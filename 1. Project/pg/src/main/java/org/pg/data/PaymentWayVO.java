package org.pg.data;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PaymentWayVO
{
	private BigDecimal payment_no;
	private String userID,bank_name,means,card_or_account_number,payment_password,cvc;
	private int end_year,end_month;
}
