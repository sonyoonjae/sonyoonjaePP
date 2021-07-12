package org.bank.data;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CardVO
{
	private String card_number,account_number,userID,cvc;
	private Timestamp end_date;
}
