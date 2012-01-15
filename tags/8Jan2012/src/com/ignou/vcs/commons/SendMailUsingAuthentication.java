package com.ignou.vcs.commons;

/*
Some SMTP servers require a username and password authentication before you
can use their Server for Sending mail. This is most common with couple
of ISP's who provide SMTP Address to Send Mail.

This Program gives any example on how to do SMTP Authentication
(User and Password verification)

This is a free source code and is provided as it is without any warranties and
it can be used in any your code for free.

Author : Sudhir Ancha
*/

import javax.mail.*;
import javax.mail.internet.*;

import java.security.Security;
import java.util.*;


/*
  To use this program, change values for the following three constants,

    SMTP_HOST_NAME -- Has your SMTP Host Name
    SMTP_AUTH_USER -- Has your SMTP Authentication UserName
    SMTP_AUTH_PWD  -- Has your SMTP Authentication Password

  Next change values for fields

  emailMsgTxt  -- Message Text for the Email
  emailSubjectTxt  -- Subject for email
  emailFromAddress -- Email Address whose name will appears as "from" address

  Next change value for "emailList".
  This String array has List of all Email Addresses to Email Email needs to be sent to.


  Next to run the program, execute it as follows,

  SendMailUsingAuthentication authProg = new SendMailUsingAuthentication();

*/

public class SendMailUsingAuthentication
{

	private static final String SMTP_HOST_NAME = "smtp.gmail.com";
	private static final String SMTP_PORT = "465";
	private static final String emailFromAddress = "info.onlineexam@gmail.com";
	private static final String emailFromPassword = "OES@Java";
	private static final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";


  public static void main(String args[]) throws Exception
  {
	  SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();

	  String[] recepients = {"venu.2703@gmail.com"};
	  String subject = "Welcome to Virtual Classroom System";
	  String message = "Congratulations, You are now a part of VCS. Your Login Details are as follows:\n Username:" + "STU10003" + " \n Password:" + "prateek" + "." ;
	  String from = "info.virtualclassroomsystems@gmail.com";

	  smtpMailSender.postMail(recepients,subject,message,from);
	  
//	  String emailMsgTxt = "A New Notice has been uploaded on Virtual Classroom System";
//		String emailSubjectTxt = "New Notice on VCS";
//		String emailFromAddress = "anchal.frend@gmail.com";
//		String[] emailList = { "ankit.kumar@jssaten.ac.in" };
//
//		SendMailUsingAuthentication smtpMailSender = new SendMailUsingAuthentication();
//		smtpMailSender.postMail(emailList, emailSubjectTxt, emailMsgTxt,
//				emailFromAddress);
//		System.out.println("Sucessfully Sent mail to All Users");
  }

  public void postMail( String recipients[ ], String subject,
                            String message , String from) throws MessagingException
  {
    boolean debug = false;

	Properties props = new Properties();
	props.put("mail.smtp.host", SMTP_HOST_NAME);
	props.put("mail.smtp.auth", "true");
	props.put("mail.debug", "true");
	props.put("mail.smtp.port", SMTP_PORT);
	props.put("mail.smtp.socketFactory.port", SMTP_PORT);
	props.put("mail.smtp.socketFactory.class", SSL_FACTORY);
	props.put("mail.smtp.socketFactory.fallback", "false");


    Authenticator auth = new SMTPAuthenticator();
    Session session = Session.getInstance(props, auth);

    session.setDebug(debug);

    // create a message
    Message msg = new MimeMessage(session);

    // set the from and to address
    InternetAddress addressFrom = new InternetAddress(emailFromAddress);
    msg.setFrom(addressFrom);

    InternetAddress[] addressTo = new InternetAddress[recipients.length];
    for (int i = 0; i < recipients.length; i++)
    {
        addressTo[i] = new InternetAddress(recipients[i]);
    }
    msg.setRecipients(Message.RecipientType.TO, addressTo);


    // Setting the Subject and Content Type
    msg.setSubject(subject);
    msg.setContent(message, "text/plain");
    Transport.send(msg);
 }


/**
* SimpleAuthenticator is used to do simple authentication
* when the SMTP server requires it.
*/
private class SMTPAuthenticator extends javax.mail.Authenticator
{

    public PasswordAuthentication getPasswordAuthentication()
    {
        String username = emailFromAddress;
        String password = emailFromPassword;
        return new PasswordAuthentication(username, password);
    }
}

}


