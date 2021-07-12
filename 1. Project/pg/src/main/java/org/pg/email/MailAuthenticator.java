package org.pg.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator
{
	PasswordAuthentication auth;
	public MailAuthenticator( String id, String password )
	{
		super();
		
		auth=new PasswordAuthentication( id, password );
	}

	@Override
	protected PasswordAuthentication getPasswordAuthentication()
	{
		
		return auth;
	};
	
	
}
