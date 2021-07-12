package org.bank.data;

import java.math.BigDecimal;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AccountVO
{
	private String account_number,userID;
	private BigDecimal balance;
}
