package org.bank.data;

import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;

public class SecureKeys
{
	public static PublicKey pubKey;
	public static PrivateKey privKey;
	
	public static void generatePrivateKey(String tempKey) {
		PKCS8EncodedKeySpec keySpec=new PKCS8EncodedKeySpec( tempKey.getBytes() );
		KeyFactory kf;
		try
		{
			kf = KeyFactory.getInstance( "RSA" );
			privKey=kf.generatePrivate( keySpec );
		}
		catch( NoSuchAlgorithmException | InvalidKeySpecException e )
		{
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}
		
	}
}
