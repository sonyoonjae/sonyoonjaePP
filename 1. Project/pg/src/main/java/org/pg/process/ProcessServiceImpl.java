package org.pg.process;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.*;
import java.math.MathContext;
import java.sql.Timestamp;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.pg.data.*;
import org.pg.email.EmailComponent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
public class ProcessServiceImpl implements ProcessService
{
	@Autowired
	ProcessMapper mapper;

	@Autowired
	EmailComponent emailComponent;
	// 트랜잭션 매니저
	@Autowired
	DataSourceTransactionManager transactionManager;

	@Override
	public void open( HttpSession session, long total_price, String mall_code,
			String mall_account )
	{
		session.setAttribute( "total_price", total_price );
		MallVO mallInfo = mapper.getMall( mall_code );
		String mall_name = mallInfo.getMall_name();
		session.setAttribute( "mall_name", mall_name );
		session.setAttribute( "mall_account", mall_account );
	}

	@Override
	public Map<String, Object> loginCheck( String id, String password, HttpSession session )
	{
		Map<String, Object> result = new HashMap<>();
		boolean login = false;
		UserVO userInfo = null;
		MessageDigest msgDigest = null;

		try
		{
			if ( id.equals( "" ) || password.equals( "" ) )
			{
				throw new PGException( "id와 비밀번호가 입력되지 않았습니다." );
			}

			userInfo = mapper.getUser( id );
			if ( userInfo == null )
			{
				throw new PGException( "존재하지 않는 회원입니다." );
			}

			String userID = userInfo.getUserID();
			userID = userID.trim();
			String userPassword = userInfo.getPassword();
			userPassword = userPassword.trim();

			// 암호화 영역
			msgDigest = MessageDigest.getInstance( "SHA3-256" );
			msgDigest.reset();

			byte[] passwordBytes = password.getBytes( "UTF-8" );
			msgDigest.update( passwordBytes );

			byte[] digestBytes = msgDigest.digest();
			BigInteger tempNum = new BigInteger( 1, digestBytes );
			String encryptedPassword = String.format( "%x", tempNum );

			boolean idEqual = id.equals( userID );
			boolean pwEqual = encryptedPassword.equals( userPassword );

			if ( idEqual && pwEqual )
			{
				login = true;
				session.setAttribute( "id", id );
			}
			else
			{
				throw new PGException( "아이디와 비밀번호가 일치하지 않습니다." );
			}

		}
		catch( NoSuchAlgorithmException | UnsupportedEncodingException e )
		{
			result.put( "message", "암호화 도중 오류가 발생했습니다." );
		}
		catch( PGException e )
		{
			result.put( "message", e.getMessage() );
		}
		catch( Exception e )
		{
			result.put( "message", "예상치 못한 에러가 발생했습니다: " + e.getMessage() );
			e.printStackTrace();
		}

		result.put( "check", login );
		result.put( "id", id );
		return result;
	}

	// 이메일 중복 여부 점검
	@Override
	public Map<String, Object> joinCheck( String email )
	{
		Map<String, Object> result = new HashMap<>();

		if ( email.equals( "" ) )
		{
			result.put( "check", false );
			result.put( "message", "아이디를 입력하세요" );
			return result;
		}

		email = email.trim();

		result.put( "email", email );
		result.put( "check", true );

		return result;
	}

	// 입력받은 코드를 대조
	@Override
	public Map<String, Object> emailCheck( Map<String, Object> input )
	{
		// 트랜잭션 관리를 위한 객체들
		DefaultTransactionDefinition transactionDef = new DefaultTransactionDefinition();
		transactionDef.setPropagationBehavior( TransactionDefinition.PROPAGATION_REQUIRED );
		TransactionStatus transactionStat = transactionManager
				.getTransaction( transactionDef );

		Map<String, Object> result = new HashMap<>();

		String email = (String)input.get( "email" );
		String code = (String)input.get( "code" );

		email = email.trim();
		code = code.trim();

		CertifyVO codeInfo = mapper.getCertify( email );
		String existedCode = codeInfo.getCode();

		Timestamp tempTime = codeInfo.getEnd_time();
		long time = tempTime.getTime();
		long now = System.currentTimeMillis();
		BigDecimal second = new BigDecimal( now - time ).divide( new BigDecimal( 1000 ) );
		BigDecimal minute = second.divide( new BigDecimal( 60 ), MathContext.DECIMAL64 );

		boolean equal = code.equals( existedCode );
		if ( equal == false )
		{
			result.put( "check", false );
			result.put( "message", "코드가 일치하지 않습니다. 다시 확인하세요." );
		}
		else if ( minute.compareTo( new BigDecimal( 5 ) ) > 0 )
		{

			result.put( "check", false );
			result.put( "message", "코드가 만료되었습니다. 새로고침을 눌러 다시 시도하세요." );
		}
		else
		{
			result.put( "check", true );
			mapper.deleteCertifyingCode( email );
			transactionManager.commit( transactionStat );
		}

		return result;
	}

	// 가입을 위해 입력한 정보들을 검증
	@Override
	public Map<String, Object> joinProcess( Map<String, Object> map, HttpSession session )
	{
		Map<String, Object> result = new HashMap<>();
		MessageDigest msgDigest = null;
		try
		{
			String id = map.get( "userID" ).toString();

			// 아이디 입력 체크
			if ( id == null || id.equals( "" ) )
			{
				throw new PGException( "아이디가 입력되지 않았습니다." );
			}

			// id 중복 확인
			UserVO existedID = mapper.getUser( id );
			if ( existedID != null )
			{
				throw new PGException( "이미 사용중인 아이디입니다." );
			}

			// 비밀번호 체크
			String password = (String)map.get( "payment_password" );
			String password_confirm = (String)map.get( "password_confirm" );
			password = password.trim();
			password_confirm = password_confirm.trim();
			if ( password == null || password.equals( "" ) )
			{
				throw new PGException( "비밀번호가 입력되지 않았습니다." );
			}
			if ( password.equals( password_confirm ) == false )
			{
				throw new PGException( "비밀번호가 일치하지 않습니다." );
			}

			// 비밀번호 암호화
			msgDigest = MessageDigest.getInstance( "SHA3-256" );
			msgDigest.reset();

			byte[] passwordBytes = password.getBytes( "UTF-8" );
			msgDigest.update( passwordBytes );

			byte[] digestBytes = msgDigest.digest();
			BigInteger tempNum = new BigInteger( 1, digestBytes );
			String encryptedPassword = String.format( "%x", tempNum );

			// 이름 체크
			String name = (String)map.get( "name" );
			if ( name == null || name.equals( "" ) )
			{
				throw new PGException( "이름이 입력되지 않았습니다." );
			}
			name = name.trim();

			// 전화번호 체크
			String phone_number = (String)map.get( "phone_number" );
			if ( phone_number == null || phone_number.equals( "" ) )
			{
				throw new PGException( "전화번호가 입력되지 않았습니다." );
			}
			phone_number = phone_number.trim();

			result.put( "check", true );
			session.setAttribute( "id", id );

			String email = (String)map.get( "email" );
			mapper.insertNewUser( id, encryptedPassword, email, name, phone_number );
		}
		catch( NoSuchAlgorithmException e )
		{
			result.put( "check", false );
			result.put( "message", "암호화 도중 오류가 발생했습니다." );
		}
		catch( PGException e )
		{
			result.put( "check", false );
			result.put( "message", e.getMessage() );
		}
		catch( Exception e )
		{
			result.put( "check", false );
			result.put( "message", "예상 외의 오류가 발생했습니다." );
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<BankVO> getBanks()
	{
		List<BankVO> result = mapper.getBanks();
		return result;
	}

	@Override
	public void newPaymentWay( PaymentWayVO paymentInfo )
	{

		String card_or_account_number = paymentInfo.getCard_or_account_number();
		card_or_account_number = card_or_account_number.replace( ",", "" );
		card_or_account_number = card_or_account_number.trim();
		paymentInfo.setCard_or_account_number( card_or_account_number );

		String password = paymentInfo.getPayment_password();
		password = password.replace( ",", "" );
		password = password.trim();

		// 비밀번호 암호화

		MessageDigest msgDigest;
		String encryptedPassword = null;
		try
		{
			msgDigest = MessageDigest.getInstance( "SHA3-256" );
			msgDigest.reset();

			byte[] passwordBytes = password.getBytes( "UTF-8" );
			msgDigest.update( passwordBytes );

			byte[] digestBytes = msgDigest.digest();
			BigInteger tempNum = new BigInteger( 1, digestBytes );
			encryptedPassword = String.format( "%x", tempNum );
		}
		catch( NoSuchAlgorithmException | UnsupportedEncodingException e )
		{
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}

		paymentInfo.setPayment_password( encryptedPassword );

		String cvc = paymentInfo.getCvc();
		cvc = cvc.replace( ",", "" );
		cvc = cvc.trim();
		paymentInfo.setCvc( cvc );

		mapper.insertNewPaymentWay( paymentInfo );

	}

	@Override
	public boolean newPaymentWayCheck( String card_or_account_number )
	{
		PaymentWayVO paymentWayInfo = mapper
				.getPaymentWayByCard_or_account_number( card_or_account_number );
		if ( paymentWayInfo == null )
		{

			return true;
		}
		return false;
	}

	@Override
	public Map<String, Object> getPaymentInfos( String id )
	{
		Map<String, Object> result = new HashMap<>();

		if ( id == null )
		{
			return result;
		}

		List<PaymentWayVO> paymentways = mapper.getPaymentWays( id );

		if ( paymentways == null || paymentways.size() == 0 )
		{
			result.put( "emptyFlag", "false" );
		}
		else
		{
			result.put( "emptyFlag", "true" );
		}
		result.put( "paymentways", paymentways );

		return result;
	}

	// 이메일 인증 준비 과정
	@Override
	public Map<String, Object> emailConfirm( String email )
	{
		Calendar c = GregorianCalendar.getInstance( Locale.KOREA );
		long nowTime = c.getTimeInMillis();
		Date nowDate = new Date( nowTime );
		DateFormat dateFormatter = new SimpleDateFormat( "MM월 dd일 HH시 mm분" );
		String startTime = dateFormatter.format( nowDate );

		Map<String, Object> result = new HashMap<>();
		String code = getCertifyingCode( email );
		inputCodeToDB( email, code );
		emailComponent.sendMail( email, "Payment's 인증 메일입니다.", code );

		result.put( "startTime", startTime );
		return result;
	}

	// 인증 코드 생성
	private String getCertifyingCode( String email )
	{

		SecureRandom random = new SecureRandom();
		int length = 8;
		StringBuffer tempCode = new StringBuffer( "" );

		for( int i = 0 ; i < length ; i++ )
		{
			char c = (char)(random.nextInt( 58 ) + 65);
			tempCode.append( c );
		}
		String code = tempCode.toString();
		return code;
	}

	// 인증 코드를 DB에 등록.
	@Transactional
	private void inputCodeToDB( String email, String code )
	{
		// 트랜잭션 관리를 위한 객체들
		DefaultTransactionDefinition transactionDef = new DefaultTransactionDefinition();
		transactionDef.setPropagationBehavior( TransactionDefinition.PROPAGATION_REQUIRED );
		TransactionStatus transactionStat = transactionManager
				.getTransaction( transactionDef );

		try
		{
			mapper.deleteCertifyingCode( email );
			mapper.joinCodeGeneration( email, code );

			transactionManager.commit( transactionStat );
		}
		catch( Exception e )
		{
			e.printStackTrace();
			transactionManager.rollback( transactionStat );
		}
	}

	@Override
	public String encryption( Map<String, Object> input )
	{
		String data = input.get( "data" ).toString();
		String result = null;

		try
		{
			MessageDigest msgDigest = MessageDigest.getInstance( "SHA3-256" );
			msgDigest.reset();

			byte[] dataBytes = data.getBytes( "UTF-8" );
			msgDigest.update( dataBytes );

			byte[] digestBytes = msgDigest.digest();
			BigInteger tempNum = new BigInteger( 1, digestBytes );
			result = String.format( "%x", tempNum );
		}
		catch( NoSuchAlgorithmException | UnsupportedEncodingException e )
		{
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public String getBankURL( String bankName )
	{
		String result = mapper.getBankURL( bankName );
		return result;
	}

}
