package org.pg.process;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.pg.data.BankVO;
import org.pg.data.CertifyVO;
import org.pg.data.MallVO;
import org.pg.data.PaymentWayVO;
import org.pg.data.UserVO;

@Mapper
public interface ProcessMapper
{
	MallVO getMall( String mall_code );

	UserVO getUser( String id );

	void join( UserVO uvo );

	UserVO getUserByEmail( String email );

	void joinCodeGeneration( String email, String code );

	CertifyVO getCertify( String email );

	void deleteCertifyingCode( String email);

	void insertNewUser( String id, String password, String email, String name,
			String phone_number );

	List<PaymentWayVO> getPaymentWays( String id );

	List<BankVO> getBanks();

	void insertNewPaymentWay( PaymentWayVO paymentInfo );

	PaymentWayVO getPaymentWayByCard_or_account_number( String card_or_account_number );

	String getBankURL( String bankName );

}
