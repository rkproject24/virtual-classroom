package com.ignou.vcs.commons;

	import java.util.ArrayList;
	import java.util.Properties;
import java.util.StringTokenizer;
	import java.util.regex.Matcher;
	import java.util.regex.Pattern;
	import javax.activation.DataHandler;
	import javax.activation.DataSource;
	import javax.activation.FileDataSource;
	import javax.mail.BodyPart;
	import javax.mail.Message;
	import javax.mail.MessagingException;
	import javax.mail.Multipart;
	import javax.mail.PasswordAuthentication;
	import javax.mail.Session;
	import javax.mail.Transport;
	import javax.mail.internet.AddressException;
	import javax.mail.internet.InternetAddress;
	import javax.mail.internet.MimeBodyPart;
	import javax.mail.internet.MimeMessage;
	import javax.mail.internet.MimeMultipart;
import com.ignou.vcs.commons.beans.MailBean; 
	
	/**
	 To use this program, change values for the following constants,
	 SMTP_HOST_NAME : SMTP host name.
	 SMTP_PORT : port.
	 EMAIL_FROM : sender address.
	 EMAIL_FROM_PASSWORD : sender address password for authentication.
	 SSL_FACTORY : SSL factory class.
	 SSL_FACTORY_FALLBACK : SSL fall back.
	 SMTP_AUTH : to check whether SMTP authentication required or not.
	 MAIL_DEBUG : debugging required or not.
	 */

	public class EMailUtilities 
	{
		private static final String SMTP_HOST_NAME = "smtp.gmail.com";
		private static final String SMTP_PORT = "465";
		private static final String EMAIL_FROM = "info.onlineexam@gmail.com";
		private static final String EMAIL_FROM_PASSWORD = "OES@Java";
		private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		private static final String SSL_FACTORY_FALLBACK = "false";
		private static final String SMTP_AUTH = "true";
		private static final String MAIL_DEBUG = "true";
		
		// constants for Email Address validation.
		private static Pattern pattern;
		private static Matcher matcher;
		private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
		public static void sendMail(MailBean mb) throws MessagingException 
		{
			boolean debug = false;
			int toRecipientsCount = mb.getToRecipients().size(); // get TO recipients count
			int ccRecipientsCount = mb.getCCRecipients().size(); // get CC recipients count
			int bccRecipientsCount = mb.getBCCRecipients().size(); // get BCC recipients count
			int attachedFilesCount = mb.getMailAttachments().size(); // get attached files count
			
			//Validation
			String subject = mb.getMailSubject();
			String message = mb.getMsgContent();
		
			if(subject.length()<=0)
			{
				System.out.println("Subject not found for this message. Not able to send such mail.");
				return;
			}else if(message.length()<=0)
			{
				System.out.println("No message contents found. Not able to send such mail.");
				return;
			}else if(toRecipientsCount==0 && ccRecipientsCount==0 && bccRecipientsCount==0)
			{
				System.out.println("Message recipients not found. Not able to send such mail./n " +
						"You should add any one of the following addresses: " +
						"TO, CC, BCC.");
				return;
			}
			
			if(mb.getMailFrom().length()>1)
			{
				message = message +"/n/n/n" +
						"---------------------" +
						"This email is sent onbelfhalf of "+mb.getMailFrom();
			}
			
			Properties props = new Properties();
			props.put("mail.smtp.host", SMTP_HOST_NAME);
			props.put("mail.smtp.auth", SMTP_AUTH);
			props.put("mail.debug", MAIL_DEBUG);
			props.put("mail.smtp.port", SMTP_PORT);
			props.put("mail.smtp.socketFactory.port", SMTP_PORT);
			props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
			props.put("mail.smtp.socketFactory.fallback", SSL_FACTORY_FALLBACK);
	
			Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() 
				{
					protected PasswordAuthentication getPasswordAuthentication() 
					{
						return new PasswordAuthentication(EMAIL_FROM,EMAIL_FROM_PASSWORD);
					}
				});
			session.setDebug(debug);
	
			// create a message.
			Message msg = new MimeMessage(session);
			// set the from address.
			InternetAddress addressFrom = new InternetAddress(EMAIL_FROM_PASSWORD);
			msg.setFrom(addressFrom);
			
			// setting TO addresses - multiple TO addresses will be supported.
			InternetAddress[] toAddresses = new InternetAddress[toRecipientsCount];
			for (int i = 0; i < toRecipientsCount; i++) 
			{
				toAddresses[i] = new InternetAddress(mb.getToRecipients().get(i));
			}
			msg.setRecipients(Message.RecipientType.TO, toAddresses);
			
			// setting CC addresses - multiple CC addresses will be supported.
			if(ccRecipientsCount>0)
			{
				InternetAddress[] ccAddresses = new InternetAddress[ccRecipientsCount];
				
				for (int i = 0; i < ccRecipientsCount; i++) 
				{
					ccAddresses[i] = new InternetAddress(mb.getCCRecipients().get(i));
				}
				msg.setRecipients(Message.RecipientType.CC, ccAddresses);
			}
			
			// setting BCC addresses - multiple BCC addresses will be supported.
			if(bccRecipientsCount>0)
			{
				InternetAddress[] bccAddresses = new InternetAddress[bccRecipientsCount];
				
				for (int i = 0; i < bccRecipientsCount; i++) 
				{
					bccAddresses[i] = new InternetAddress(mb.getBCCRecipients().get(i));
				}
				msg.setRecipients(Message.RecipientType.BCC, bccAddresses);
			}
			
			// Setting the Subject.
			msg.setSubject(subject);
			// Setting message contents.
			msg.setContent(message, "text/plain");
			
			// Checking for attachments - If attachments found, add to message.
			if(attachedFilesCount>0)
			{
				 BodyPart messageBodyPart = new MimeBodyPart();
		         messageBodyPart.setText(mb.getMsgContent());
		         Multipart multipart = new MimeMultipart();
		         //add the message body to the MIME message.
		         multipart.addBodyPart(messageBodyPart);
		         // add any file attachments to the message.
		         addAtachments(mb.getMailAttachments(), multipart);
		         //Put all message parts in the message.
		         msg.setContent(multipart);
			}
			
			Transport.send(msg);
		}
		
		private static void addAtachments(ArrayList<String> attachments, Multipart multipart)
	            throws MessagingException, AddressException 
	    {
	        for (int i = 0; i <= attachments.size() - 1; i++) 
	        {
	            String filename = attachments.get(i);
	            StringTokenizer st = new StringTokenizer(filename,"\\");
	            String dispFileName = "FileNameNotFound";
	            while(st.hasMoreTokens())
	            {
	            	dispFileName = st.nextToken();
	            }
	            MimeBodyPart attachmentBodyPart = new MimeBodyPart();
	            //use a JAF FileDataSource as it does MIME type detection
	            DataSource source = new FileDataSource(filename);
	            attachmentBodyPart.setDataHandler(new DataHandler(source));
	            attachmentBodyPart.setFileName(dispFileName);
	            //add the attachment
	            multipart.addBodyPart(attachmentBodyPart);
	        }
	    }
		
		/**
		 * Validating EMail address. 
		 **/
		public static Boolean isValidEmail(String emailAdd)
	    {
			 pattern = Pattern.compile(EMAIL_PATTERN);
	    	 matcher = pattern.matcher(emailAdd);
			 return matcher.matches();
	    }
		
		public static void main(String s[])
		{
			ArrayList<String> toList = new ArrayList<String>();
			ArrayList<String> ccList = new ArrayList<String>();
			ArrayList<String> bccList = new ArrayList<String>();
			ArrayList<String> attachments = new ArrayList<String>();
			
			toList.add("venu.2703@gmail.com");
			ccList.add("venu_2703@yahoo.co.in");
			bccList.add("kris_2708@yahoo.co.in");
			attachments.add("C:\\Users\\Krishna\\Desktop\\LED.zip");
			
			MailBean mb = new MailBean();
			mb.setMailSubject("Test mail from Java");
			mb.setMsgContent("Testing...");
			mb.setToRecipients(toList);
			mb.setCCRecipients(ccList);
			mb.setBCCRecipients(bccList);
			mb.setMailAttachments(attachments);
			
			try 
			{
				sendMail(mb);
			} 
			catch (MessagingException e) 
			{
				System.out.println("\n\nThere is an error while sending email. Please try again later.\nThe following error occured:");
				e.printStackTrace();
			}
		}
	}