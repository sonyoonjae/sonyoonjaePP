package org.bank.banking;

import java.math.BigDecimal;

import org.apache.ibatis.annotations.Mapper;
import org.bank.data.AccountVO;
import org.bank.data.CardVO;
import org.bank.data.LogVO;
import org.bank.data.PGVO;
import org.bank.data.UserVO;

@Mapper
public interface BankMapper
{


	UserVO getUser( String userID );

	BigDecimal getBalance( String account_number );

	void payment( BigDecimal price, String account_number );

	void receive( BigDecimal price, String mall_account_number );

	void logging( LogVO lvo );

	AccountVO getAccount( String account_number );

	CardVO getCard( String card_number );

	PGVO getPG( String pg_code );

}
