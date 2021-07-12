package org.bank.banking;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.bank.data.AccountVO;
import org.bank.data.BankException;
import org.bank.data.CardVO;
import org.bank.data.CommunicationMessage;
import org.bank.data.LogVO;
import org.bank.data.PGVO;
import org.bank.data.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class BankServiceImpl implements BankService
{
	@Autowired
	private BankMapper mapper;

	// 트랜잭션 매니저
	@Autowired
	DataSourceTransactionManager transactionManager;

	@Override
	public Map<String, Object> operating( Map<String, Object> input,
			HttpServletRequest request )
	{
		Map<String, Object> result = null;
		String messageType = (String)input.get( "messageType" );

		// 메세지 유형 별 분기
		switch ( messageType )
		{
			case CommunicationMessage.connect:
				// 연결 처리
				result = this.connection( input, request );
				break;
			case CommunicationMessage.keySend:
				// 암호화를 위한 public 키 보내기
				result = this.keySend( input );
				break;
			case CommunicationMessage.payment:
				// 결제 요청 처리하기
				result = this.payment( input );
				break;
			case CommunicationMessage.paymentWayCheck:
				result = this.paymentWayCheck( input );
				break;
			case CommunicationMessage.disconnect:
				result = this.disconnect( input, request );
				break;
			default:
				result=new HashMap<>();
				result.put( "messageType", CommunicationMessage.fail );
				result.put( "message", "잘못된 접근입니다." );
		}

		return result;
	}

	// ================================== private functions ==================================

	private Map<String, Object> connection( Map<String, Object> input,
			HttpServletRequest request )
	{
		Map<String, Object> result = new HashMap<>();
		BankException exception = null;
		HttpSession session = request.getSession();

		try
		{
			String mall_account = input.get( "mall_account" ).toString();
			if ( mall_account == null || mall_account.equals( "" ) )
			{
				exception = new BankException( "업체 계좌가 넘어오지 않았습니다." );
				throw exception;
			}
			AccountVO mallInfo = mapper.getAccount( mall_account );
			if ( mallInfo == null )
			{
				exception = new BankException( "등록되지 않은 업체 계좌입니다." );
				throw exception;
			}

			String pg_code = input.get( "pg_code" ).toString();
			if ( pg_code == null || pg_code.equals( "" ) )
			{
				exception = new BankException( "PG 코드가 넘어오지 않았습니다." );
				throw exception;
			}
			PGVO pgInfo = mapper.getPG( pg_code );
			if ( pgInfo == null )
			{
				exception = new BankException( "등록되지 않은 pg입니다." );
				throw exception;
			}

			session.setAttribute( "id", pg_code );

			result.put( "messageType", CommunicationMessage.success );
		}
		catch( BankException e )
		{
			result.put( "messageType", CommunicationMessage.fail );
			result.put( "message", e.getMessage() );
		}
		catch( Exception e )
		{
			result.put( "messageType", CommunicationMessage.error );
			result.put( "message", "예상치 못한 오류가 발생했습니다." );
			e.printStackTrace();
		}

		return result;
	}

	private Map<String, Object> keySend( Map<String, Object> input )
	{
		// String receivedKey = (String)input.get( "key" );
		// Decoder decoder = Base64.getDecoder();
		//
		// byte[] tempPubKey = decoder.decode( receivedKey );
		//
		// X509EncodedKeySpec keySpec = new X509EncodedKeySpec( tempPubKey );
		// KeyFactory kf = null;
		//
		// try
		// {
		// kf = KeyFactory.getInstance( "RSA" );
		// SecureKeys.pubKey = kf.generatePublic( keySpec );
		// }
		// catch( Exception e )
		// {
		// }
		//
		// KeyPair kp = null;
		//
		//
		// KeyPairGenerator kpg;
		// try
		// {
		// kpg = KeyPairGenerator.getInstance( "RSA" );
		// kpg.initialize( 512 );
		// kp = kpg.generateKeyPair();
		// }
		// catch( NoSuchAlgorithmException e )
		// {
		// // TODO 자동 생성된 catch 블록
		// }
		//
		// SecureKeys.privKey = kp.getPrivate();
		// PublicKey tempKey = kp.getPublic();
		//
		// Encoder encoder = Base64.getEncoder();
		// String key = encoder.encodeToString( tempKey.getEncoded() );

		Map<String, Object> result = new HashMap<>();
		result.put( "messageType", CommunicationMessage.keySend );
		result.put( "key", "Public Key" );

		return result;
	}

	private Map<String, Object> paymentWayCheck( Map<String, Object> input )
	{
		Map<String, Object> result = null;
		String means = (String)input.get( "means" );

		switch ( means )
		{
			case "card":
				// 카드 결제 확인
				result = this.paymentByCard_check( input );
				break;
			case "account":
				// 계좌 결제 확인
				result = this.paymentByAccount_check( input );
				break;
		}

		return result;
	}

	// 계좌 결제 확인
	private Map<String, Object> paymentByAccount_check( Map<String, Object> input )
	{

		Map<String, Object> result = new HashMap<>();

		// 결제자의 계좌 정보 긁어오기
		BankException exception;

		try
		{
			String account_number = (String)input.get( "card_or_account_number" );
			AccountVO accountInfo = mapper.getAccount( account_number );
			if ( accountInfo == null ) // 계좌가 존재하지 않는다면?
			{
				exception = new BankException( "계좌가 존재하지 않습니다." );
				throw exception;
			}

			String userID = accountInfo.getUserID();// 결제자의 아이디.
			UserVO userInfo = mapper.getUser( userID );

			if ( userInfo == null )
			{
				exception = new BankException( "계좌에 대한 사용자 정보가 존재하지 않습니다." );
				throw exception;
			}

			// 비밀번호가 일치하지 않을 경우
			String means = (String)input.get( "means" );
			String payment_password = (String)input.get( "payment_password" );
			boolean passwordCorrect = this.passwordCheck( means, payment_password, userID );
			if ( passwordCorrect == false )
			{
				exception = new BankException( "비밀번호가 일치하지 않습니다." );
				throw exception;
			}

			result.put( "messageType", CommunicationMessage.success );

		}
		catch( BankException e )
		{
			result.put( "messageType", CommunicationMessage.fail );
			result.put( "message", e.getMessage() );

		}
		catch( Exception e )
		{
			result.put( "messageType", CommunicationMessage.error );
			result.put( "message", "예상치 못한 오류가 발생했습니다." );
			e.printStackTrace();
		}

		return result;
	}

	// 카드 결제 확인
	@Transactional( rollbackFor = { Throwable.class, Error.class } )
	private Map<String, Object> paymentByCard_check( Map<String, Object> input )
	{
		Map<String, Object> result = new HashMap<>();
		BankException exception;

		try
		{
			// 카드 정보 긁어오기
			String card_number = (String)input.get( "card_or_account_number" );
			CardVO cardInfo = mapper.getCard( card_number );

			// 카드번호가 없을 경우.
			if ( cardInfo == null )
			{
				exception = new BankException( "카드가 존재하지 않습니다." );
				throw exception;
			}

			// 카드 만료일 정보 가져오기
			Timestamp end_date = cardInfo.getEnd_date();
			String end_Date_String = end_date.toString();
			String[] buffer = end_Date_String.split( "-" );
			String card_end_year = buffer[0];
			String card_end_month = buffer[1];

			// 카드 만료일 대조
			String end_year = (String)input.get( "end_year" );
			String end_month = (String)input.get( "end_month" );

			boolean yearEqual = end_year.equals( card_end_year );
			boolean monthEqual = end_month.equals( card_end_month );

			if ( yearEqual == false || monthEqual == false )
			{
				exception = new BankException( "카드의 만료 연/월이 일치하지 않습니다." );
				throw exception;
			}

			Calendar c = new GregorianCalendar( Locale.KOREA );
			Date tempNow = c.getTime();
			long longTime = tempNow.getTime();
			Timestamp now_date = new Timestamp( longTime );

			if ( now_date.compareTo( end_date ) > 0 )
			{
				exception = new BankException( "카드가 만료되었습니다." );
				throw exception;
			}

			String cvc = (String)input.get( "CVC" ); // CVC 코드
			if ( cvc == null )
			{
				exception = new BankException( "CVC가 입력되지 않았습니다." );
				throw exception;
			}
			String card_cvc = cardInfo.getCvc();
			// CVC 불일치
			if ( cvc.equals( card_cvc ) == false )
			{
				exception = new BankException( "CVC가 일치하지 않습니다." );
				throw exception;
			}

			String userID = cardInfo.getUserID();
			String means = (String)input.get( "means" );
			String payment_password = (String)input.get( "payment_password" );
			boolean passwordCorrect = this.passwordCheck( means, payment_password, userID );
			if ( passwordCorrect == false )
			{
				exception = new BankException( "비밀번호가 일치하지 않습니다." );
				throw exception;
			}

			result.put( "messageType", CommunicationMessage.success );
			long end_date_long = end_date.getTime();
			result.put( "end_date", end_date_long );
		}
		catch( BankException e )
		{
			result.put( "messageType", CommunicationMessage.fail );
			result.put( "message", e.getMessage() );
		}
		catch( Exception e )
		{
			result.put( "messageType", CommunicationMessage.error );
			result.put( "message", "예상외의 오류가 발생하였습니다." );
			e.printStackTrace();
		}

		return result;
	}

	private boolean passwordCheck( String means, String payment_password, String userID )
	{
		String userPassword = null;
		UserVO userInfo = mapper.getUser( userID );
		switch ( means )
		{
			case "card":
				userPassword = userInfo.getTransaction_password();
				break;
			case "account":
				userPassword = userInfo.getPassword();
				break;
		}

		boolean result = payment_password.equals( userPassword );

		return result;
	}

	@Transactional( rollbackFor = { Throwable.class, Error.class } )
	private Map<String, Object> payment( Map<String, Object> input )
	{
		/**
		 * 결제를 위한 정보
		 * means: 카드/계좌 중 한 가지 결제 수단에 대한 확인, 또는 결제 시도
		 */

		Map<String, Object> result = null;
		String means = (String)input.get( "means" ); // 결제수단

		switch ( means ) // 결제 수단에 따른 분기
		{
			case "card":
				// 카드 결제
				result = this.paymentByCard( input );
				break;
			case "account":
				// 계좌 결제
				result = this.paymentByAccount( input );
				break;

		}

		return result;
	}

	// 계좌 결제 실행
	@Transactional( rollbackFor = { Throwable.class, Error.class } )
	private synchronized Map<String, Object> paymentByAccount( Map<String, Object> input )
	{
		Map<String, Object> result = new HashMap<>();
		BigDecimal balance = null;
		BankException exception;

		// 트랜잭션 관리를 위한 객체들
		DefaultTransactionDefinition transactionDef = new DefaultTransactionDefinition();
		transactionDef.setPropagationBehavior( TransactionDefinition.PROPAGATION_REQUIRED );
		TransactionStatus transactionStat = transactionManager
				.getTransaction( transactionDef );

		// 작업 영역
		try
		{
			String means = (String)input.get( "means" ); // 결제수단

			// 사용자 정보 조회
			String account_number = (String)input.get( "card_or_account_number" ); // 계좌번호
			AccountVO accountInfo = mapper.getAccount( account_number );
			if ( accountInfo == null )
			{
				exception = new BankException( "계좌 정보가 존재하지 않습니다." );
				throw exception;
			}
			String userID = accountInfo.getUserID();

			// 업체 정보 조회
			String mall_account_number = (String)input.get( "mall_account_number" ); // 업체 계좌
			AccountVO mallInfo = mapper.getAccount( mall_account_number );
			if ( mallInfo == null )
			{
				exception = new BankException( "계좌 정보가 존재하지 않습니다." );
				throw exception;
			}
			String mall_ID = mallInfo.getUserID(); // 업체 아이디

			// 가격
			String tempPrice = (String)input.get( "total_price" );
			BigDecimal price = new BigDecimal( tempPrice );

			// 가격과 잔고 비교
			balance = accountInfo.getBalance();
			if ( balance.compareTo( price ) < 0 ) // 잔액 부족
			{
				exception = new BankException( "잔액이 부족합니다." );
				throw exception;
			}

			mapper.payment( price, account_number );// 결제
			mapper.receive( price, mall_account_number ); // 금액 이전

			balance = mapper.getBalance( account_number );
			BigDecimal deposit = price.negate();

			LogVO log = new LogVO( null, deposit, balance, userID, means, account_number,
					mall_ID, mall_account_number, "거래 성공", null );

			mapper.logging( log ); // 로그 기록

			transactionManager.commit( transactionStat );

			result.put( "messageType", CommunicationMessage.success );
			result.put( "balance", balance );

		}
		catch( BankException e ) // 오류 발생시
		{
			transactionManager.rollback( transactionStat );

			result.put( "messageType", CommunicationMessage.fail );
			result.put( "message", e.getMessage() );
		}
		catch( Exception e )
		{
			transactionManager.rollback( transactionStat );

			result.put( "messageType", CommunicationMessage.error );
			result.put( "message", "예상치 못한 오류가 발생했습니다." );
			e.printStackTrace();
		}

		return result;
	}

	// 카드 결제 실행
	@Transactional( rollbackFor = { Throwable.class, Error.class } )
	private synchronized Map<String, Object> paymentByCard( Map<String, Object> input )
	{
		Map<String, Object> result = new HashMap<>();

		BankException exception;
		// 트랜잭션 관리를 위한 객체들
		DefaultTransactionDefinition transactionDef = new DefaultTransactionDefinition();
		transactionDef.setPropagationBehavior( TransactionDefinition.PROPAGATION_REQUIRED );
		TransactionStatus transactionStat = transactionManager
				.getTransaction( transactionDef );

		try
		{
			// 가격 정보 조회
			String tempPrice = input.get( "total_price" ).toString();
			BigDecimal price = new BigDecimal( tempPrice );
			BigDecimal deposit = price.negate();

			// 사용자 정보 조회
			String card_number = (String)input.get( "card_or_account_number" );
			CardVO cardInfo = mapper.getCard( card_number );
			if ( cardInfo == null )
			{
				exception = new BankException( "카드 정보가 존재하지 않습니다." );
				throw exception;
			}
			String account_number = cardInfo.getAccount_number();
			String userID = cardInfo.getUserID();
			AccountVO accountInfo = mapper.getAccount( account_number );
			BigDecimal balance = accountInfo.getBalance();

			// 잔액 부족시
			if ( balance.compareTo( price ) < 0 )
			{
				exception = new BankException( "잔액이 부족합니다." );
				throw exception;
			}

			// 업체 계좌 정보 조회
			String mall_account_number = (String)input.get( "mall_account_number" );
			AccountVO mall_accountInfo = mapper.getAccount( mall_account_number );
			if ( mall_accountInfo == null )
			{
				exception = new BankException( "업체 정보가 존재하지 않습니다." );
				throw exception;
			}
			String mall_ID = mall_accountInfo.getUserID();

			// 결제 수단 조회
			String means = input.get( "means" ).toString();

			mapper.payment( price, account_number ); // 결제
			mapper.receive( price, mall_account_number ); // 이체

			balance = mapper.getBalance( account_number ); // 결제 후 잔액

			LogVO log = new LogVO( null, deposit, balance, userID, means, card_number, mall_ID,
					mall_account_number, "거래 성공", null );

			mapper.logging( log ); // 로그 기록

			transactionManager.commit( transactionStat );

			result.put( "messageType", CommunicationMessage.success );
			result.put( "balance", balance );
		}
		catch( BankException e ) // 오류 발생시
		{
			transactionManager.rollback( transactionStat );

			result.put( "messageType", CommunicationMessage.fail );
			result.put( "message", e.getMessage() );
		}
		catch( Exception e )
		{
			transactionManager.rollback( transactionStat );

			result.put( "messageType", CommunicationMessage.error );
			result.put( "message", "예상치 못한 오류가 발생했습니다." );
			e.printStackTrace();
		}

		return result;
	}

	private Map<String, Object> disconnect( Map<String, Object> input,
			HttpServletRequest request )
	{
		HttpSession session = request.getSession();
		session.invalidate();
		return null;
	}
}
