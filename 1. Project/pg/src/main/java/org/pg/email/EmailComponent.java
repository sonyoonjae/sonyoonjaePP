package org.pg.email;


public interface EmailComponent
{
	 void sendMail( String to, String subject, String code );
}
