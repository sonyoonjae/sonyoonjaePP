package org.pg.data;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RecordVO
{
	private BigDecimal record_no;
	private String userID;
	private BigDecimal price;
	private String mall_code, bank_code, means,card_or_account_number;
	private Timestamp record_date;
}
