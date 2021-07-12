package org.pg.process;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.pg.data.BankVO;
import org.pg.data.PaymentWayVO;

public interface ProcessService
{

	//로그인 체크
	Map<String, Object> loginCheck( String id, String password,HttpSession session );

	//id 중복여부 체크
	Map<String,Object> joinCheck( String email );

	//정보 검증 및 가입 처리.
	Map<String, Object> joinProcess( Map<String,Object> map, HttpSession session );

	// 새로운 거래 수단 등록.
	void newPaymentWay( PaymentWayVO paymentInfo);

	Map<String, Object> emailCheck( Map<String, Object> input );

	Map<String, Object> getPaymentInfos( String id );

	List<BankVO> getBanks();

	boolean newPaymentWayCheck( String card_or_account_number );

	Map<String, Object> emailConfirm( String email );

	void open( HttpSession session, long total_price, String mall_code, String mall_account );

	String encryption( Map<String, Object> input );

	String getBankURL(String bankName);



}
