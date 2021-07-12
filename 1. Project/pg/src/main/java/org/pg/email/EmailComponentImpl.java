package org.pg.email;

import java.util.Date;
import java.util.Properties;

import javax.activation.*;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class EmailComponentImpl implements EmailComponent
{
	@Autowired
	private JavaMailSender mailSender;

	@Override
	@Async
	public void sendMail( String to, String subject, String code )
	{
		// String password = "msartefibppjqeww";
		// String from = "teamprojectpg@gmail.com";
		// String fromName = "Payment's Manager";
		// String host = "smtp.gmail.com";
		// String port = "465";
		//
		// Properties property = new Properties();
		//
		// property.put( "mail.transport.protocol", "smtp" );
		// property.put( "mail.smtp.host", host );
		// property.put( "mail.smtp.port", port );
		// property.put( "mail.smtp.auth", "true" );
		//
		// property.put( "mail.smtp.quitwait", "false" );
		// property.put( "mail.smtp.socketFatory.port", port );
		// property.put( "mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
		// property.put( "mail.smtp.socketFatory.fallback", "false" );
		//
		// try
		// {
		//
		// Session mailSession = Session.getInstance( property, new Authenticator()
		// {
		// public PasswordAuthentication getPasswordAuthentication()
		// {
		// return new PasswordAuthentication( from, password );
		// }
		// } );
		// mailSession.setDebug( true );
		//
		// InternetAddress fromAddress = new InternetAddress( from, fromName );
		// InternetAddress toAddresses = new InternetAddress(to);
		// Date now = new Date();
		//
		// Message msg = new MimeMessage( mailSession );
		//
		// msg.setFrom( fromAddress );
		// msg.setRecipient( RecipientType.TO, toAddresses );
		// msg.setSubject( subject );
		// msg.setSentDate( now );
		//
		// Multipart multiparts = new MimeMultipart();
		// MimeBodyPart mTextPart = new MimeBodyPart();
		// // MimeBodyPart mFilePart = null;
		//
		// code = "<h3>" + code + "</h3>";
		//
		// mTextPart.setText( code, "UTF-8", "html" );
		// multiparts.addBodyPart( mTextPart );
		//
		// msg.setContent( multiparts, "text/html; charset=UTF-8" );
		//
		// MailcapCommandMap mailcapCmdMap = (MailcapCommandMap)CommandMap
		// .getDefaultCommandMap();
		// mailcapCmdMap.addMailcap(
		// "text/html;; x-java-content-handler=com.sun.mail.handlers.text_html" );
		// mailcapCmdMap.addMailcap(
		// "text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml" );
		// mailcapCmdMap.addMailcap(
		// "text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain" );
		// mailcapCmdMap.addMailcap(
		// "multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed" );
		// mailcapCmdMap.addMailcap(
		// "message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822" );
		//
		// Transport.send( msg, from, password );
		// // Transport.send( msg );
		//
		// }
		// catch( Exception e )
		// {
		// e.printStackTrace();
		// }

		MimeMessage msg = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper( msg );
		String html="<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n"
				+ "<html xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n"
				+ "<head>\r\n"
				+ "<style>\r\n"
				+ "@import url('https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap');\r\n"
				+ "@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap');\r\n"
				+ "</style>\r\n"
				+ "    <meta http-equiv=\"Content-type\" content=\"text/html; charset=utf-8\" />\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\" />\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n"
				+ "    <meta name=\"format-detection\" content=\"date=no\" />\r\n"
				+ "    <meta name=\"format-detection\" content=\"address=no\" />\r\n"
				+ "    <meta name=\"format-detection\" content=\"telephone=no\" />\r\n"
				+ "    <meta name=\"x-apple-disable-message-reformatting\" />\r\n"
				+ "    <title>Email</title>\r\n"
				+ "    <style type=\"text/css\" media=\"screen\">\r\n"
				+ "        @font-face {\r\n"
				+ "            font-family: 'Motiva Sans';\r\n"
				+ "            font-style: normal;\r\n"
				+ "            font-weight: 300;\r\n"
				+ "            src: local('Motiva Sans'), url('https://store.akamai.steamstatic.com/public/shared/fonts/email/MotivaSans-Light.woff') format('woff');\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        @font-face {\r\n"
				+ "            font-family: 'Motiva Sans';\r\n"
				+ "            font-style: normal;\r\n"
				+ "            font-weight: normal;\r\n"
				+ "            src: local('Motiva Sans'), url('https://store.akamai.steamstatic.com//public/shared/fonts/email/MotivaSans-Regular.woff') format('woff');\r\n"
				+ "        }\r\n"
				+ "\r\n"
				+ "        @font-face {\r\n"
				+ "            font-family: 'Motiva Sans';\r\n"
				+ "            font-style: normal;\r\n"
				+ "            font-weight: bold;\r\n"
				+ "            src: local('Motiva Sans'), url('https://store.akamai.steamstatic.com//public/shared/fonts/email/MotivaSans-Bold.woff') format('woff');\r\n"
				+ "        }\r\n"
				+ "    </style>\r\n"
				+ "    <style type=\"text/css\" media=\"screen\">\r\n"
				+ "        body { padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#ffffff; -webkit-text-size-adjust:none }\r\n"
				+ "        a { color:#3999ec; text-decoration:underline }\r\n"
				+ "        body a { color:#ffffff; text-decoration:none }\r\n"
				+ "        img { margin: 0 !important; -ms-interpolation-mode: bicubic; /* Allow smoother rendering of resized image in Internet Explorer */ }\r\n"
				+ "\r\n"
				+ "        /* for recepits */\r\n"
				+ "            table { mso-table-lspace:0pt; mso-table-rspace:0pt; }\r\n"
				+ "            img, a img{ border:0; outline:none; text-decoration:none; }\r\n"
				+ "            #outlook a { padding:0; }\r\n"
				+ "            .ReadMsgBody { width:100%; }\r\n"
				+ "            .ExternalClass { width:100%; }\r\n"
				+ "            div,p,a,li,td,blockquote { mso-line-height-rule:exactly; }\r\n"
				+ "            a[href^=tel],a[href^=sms] { color:inherit; text-decoration:none; }\r\n"
				+ "            .ExternalClass, .ExternalClass p, .ExternalClass td, .ExternalClass div, .ExternalClass span, .ExternalClass font { line-height:100%; }\r\n"
				+ "        /* END for recepits */\r\n"
				+ "\r\n"
				+ "        a[x-apple-data-detectors] { color: inherit !important; text-decoration: inherit !important; font-size: inherit !important; font-family: inherit !important; font-weight: inherit !important; line-height: inherit !important; }\r\n"
				+ "        .btn-18 a { display: block; padding: 13px 35px; text-decoration: none; }\r\n"
				+ "		#h_logo {display: block;overflow: hidden;width: auto;height: auto;margin: 0 auto;font-size: 40px;font-family: 'Fredoka One', cursive;line-height: 50px; color:white; }\r\n"
				+ "		td.p-80.mpy-35.mpx-15 { background: linear-gradient( to left, #2de0ae, #679ec1, #a54cd2d9 );}\r\n"
				+ "		table { border-radius: 70px;}\r\n"
				+ "    </style>\r\n"
				+ "</head>\r\n"
				+ "\r\n"
				+ "<body class=\"body\" style=\"padding:0 !important; margin:0 auto !important; display:block !important; min-width:100% !important; width:100% !important; background:#ffffff; -webkit-text-size-adjust:none;\">\r\n"
				+ "<center>\r\n"
				+ "    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" bgcolor=\"#ffffff\" class=\"gwfw\">\r\n"
				+ "        <tr>\r\n"
				+ "            <td style=\"margin: 0; padding: 0; width: 100%; height: 100%;\" align=\"center\" valign=\"top\">\r\n"
				+ "                <table width=\"775\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"class=\"m-shell\">\r\n"
				+ "                    <tr>\r\n"
				+ "                        <td class=\"td\" style=\"width:775px; min-width:775px; font-size:0pt; line-height:0pt; padding:0; margin:0; font-weight:normal;\">\r\n"
				+ "                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                <!-- Main -->\r\n"
				+ "                                <tr>\r\n"
				+ "                                    <td class=\"p-80 mpy-35 mpx-15\" bgcolor=\"fff9999\" style=\"padding: 80px;\">\r\n"
				+ "                                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "\r\n"
				+ "                                            <!-- Logo -->\r\n"
				+ "                                            <tr>\r\n"
				+ "                                                <td class=\"img pb-45\" style=\"font-size:0pt; line-height:0pt; text-align:left; padding-bottom: 45px;\">\r\n"
				+ "                                                       <div id=\"h_logo\">PayMent's</div>\r\n"
				+ "                                                    </a>\r\n"
				+ "\r\n"
				+ "                                                </td>\r\n"
				+ "                                            </tr>\r\n"
				+ "                                            <tr>\r\n"
				+ "                                                <td>\r\n"
				+ "\r\n"
				+ "			<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "				<tr>\r\n"
				+ "					<td class=\"title-36 pb-30 c-grey6 fw-b\" style=\"font-size:36px; line-height:42px; font-family:'Motiva Sans', Helvetica, Arial, sans-serif; text-align:left; padding-bottom: 30px; color:#ffffff; font-weight:bold;\">\r\n"
				+ "						안녕하세요 "+to+"님!\r\n"
				+ "					</td>\r\n"
				+ "				</tr>\r\n"
				+ "			</table>\r\n"
				+ "						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "				<tr>\r\n"
				+ "					<td class=\"text-18 c-grey4 pb-30\" style=\"font-size:18px; line-height:25px; font-family:'Motiva Sans', Helvetica, Arial, sans-serif; text-align:left; color:#ffffff; padding-bottom: 30px;\">아래의 인증 코드를 인증 페이지에 입력해주세요.</td>\r\n"
				+ "				</tr>\r\n"
				+ "			</table>\r\n"
				+ "						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "				<tr>\r\n"
				+ "					<td class=\"pb-70 mpb-50\" style=\"padding-bottom: 70px;\">\r\n"
				+ "						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"bgcolor=\"#171982\">\r\n"
				+ "							<tr>\r\n"
				+ "								<td class=\"py-30 px-56\" style=\"padding-top: 30px; padding-bottom: 30px; padding-left: 56px; padding-right: 56px;\">\r\n"
				+ "									<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "										<tr>\r\n"
				+ "											<td class=\"title-48 c-blue1 fw-b a-center\" style=\"font-size:48px; line-height:52px; font-family:'Motiva Sans', Helvetica, Arial, sans-serif; color:#F2CE2C; font-weight:bold; text-align:center;\">\r\n"+code+"</td>\r\n"
				+ "										</tr>\r\n"
				+ "									</table>\r\n"
				+ "								</td>\r\n"
				+ "							</tr>\r\n"
				+ "						</table>\r\n"
				+ "					</td>\r\n"
				+ "				</tr>\r\n"
				+ "			</table>\r\n"
				+ "						<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "				<tr>\r\n"
				+ "					<td class=\"text-18 c-grey4 pb-30\" style=\"font-size:18px; line-height:25px; font-family:'Motiva Sans', Helvetica, Arial, sans-serif; text-align:left; color:#dbdbdb; padding-bottom: 30px;\">\r\n"
				+ "					본 이메일은 <span style=\"color: #ffffff; font-size: 22px; font-family: 'Fredoka One', cursive;\">PayMent's </span>서비스 가입을 위해 발송한 메일입니다.\r\n"
				+ "				<br><br>\r\n"
				+ "<span style=\"color: #ffffff; font-weight: bold;\">서비스 가입을 하려고 한게 아니라면</span> 계정 보안을 유지하기 위해 이메일 비밀번호를 변경하시는 것이 좋습니다.\r\n"
				+ "<span style=\"color: #ffffff; font-weight: bold;\"></span> </td>\r\n"
				+ "				</tr>\r\n"
				+ "			</table>\r\n"
				+ "			            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                <tr>\r\n"
				+ "                    <td class=\"text-18 c-blue1 pb-40\" style=\"font-size:18px; line-height:25px; font-family:'Motiva Sans', Helvetica, Arial, sans-serif; text-align:left; color:#3a9aed; padding-bottom: 40px;\"></td>\r\n"
				+ "                </tr>\r\n"
				+ "            </table>\r\n"
				+ "            \r\n"
				+ "                                                                                                <!-- Signature -->\r\n"
				+ "                                                <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                    <tr>\r\n"
				+ "                                                        <td class=\"pt-30\" style=\"padding-top: 30px;\">\r\n"
				+ "                                                            <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                <tr>\r\n"
				+ "                                                                    <td class=\"img\" width=\"3\" bgcolor=\"#3a9aed\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"></td>\r\n"
				+ "                                                                    <td class=\"img\" width=\"37\" style=\"font-size:0pt; line-height:0pt; text-align:left;\"></td>\r\n"
				+ "                                                                    <td>\r\n"
				+ "                                                                        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n"
				+ "                                                                            <tr>\r\n"
				+ "                                                                                                                                                                    <td class=\"text-16 py-20 c-grey4 fallback-font\" style=\"font-size:16px; line-height:22px; font-family:'Motiva Sans', Helvetica, Arial, sans-serif; text-align:left; padding-top: 20px; padding-bottom: 20px; color:#f1f1f1;\">\r\n"
				+ "                                                                                        Thank's for join us😎😎<br />\r\n"
				+ "The <span style=\"color: #ffffff; font-size: 22px; font-family: 'Fredoka One', cursive;\">PayMent's </span> service team                                                                                  </td>\r\n"
				+ "                                                                                                                                                            </tr>\r\n"
				+ "                                                                        </table>\r\n"
				+ "                                                                    </td>\r\n"
				+ "                                                                </tr>\r\n"
				+ "                                                            </table>\r\n"
				+ "                                                        </td>\r\n"
				+ "                                                    </tr>\r\n"
				+ "                                                </table>\r\n"
				+ "                                                <!-- END Signature -->\r\n"
				+ "                                                \r\n"
				+ "                                                </td>\r\n"
				+ "                                            </tr>\r\n"
				+ "\r\n"
				+ "                                        </table>\r\n"
				+ "                                    </td>\r\n"
				+ "                                </tr>\r\n"
				+ "                                <!-- END Main -->\r\n"
				+ "                            </table>\r\n"
				+ "                        </td>\r\n"
				+ "                    </tr>\r\n"
				+ "                </table>\r\n"
				+ "            </td>\r\n"
				+ "        </tr>\r\n"
				+ "    </table>\r\n"
				+ "</center>\r\n"
				+ "\r\n"
				+ "\r\n"
				+ "</body>\r\n"
				+ "</html>";
		
		try
		{
			helper.setTo( new InternetAddress( to ) );
			helper.setSubject( subject );
			helper.setText( html,true );

			mailSender.send( msg );
		}
		catch( Exception e )
		{
			e.printStackTrace();
		}
	}

}
