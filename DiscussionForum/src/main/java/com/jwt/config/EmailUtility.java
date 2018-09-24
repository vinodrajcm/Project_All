package com.jwt.config;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;




public class EmailUtility {

	/** The sender. */
    private static JavaMailSenderImpl sender;

    private static final String LOCATION = "EmailUtility";

    /**
     * Instantiates a new email utility.
     */
    public EmailUtility() {
	initialize();
    }

    /**
     * Initialize.
     */
    private void initialize() {
	try {
	    sender = new JavaMailSenderImpl();
	    sender.setHost("hqap101.kennametal.com");
	    sender.setPort(25);
	    //sender.setHost("10.44.148.150");
		// sender.setHost("192.168.1.78");
		// sender.setPort(587);
		sender.setPort(25);
		//sender.setUsername("munirvc");
		//sender.setPassword("Samsung@s4");
		
		 /*sender.setHost("smtp.gmail.com");
		 sender.setPort(465);
		 sender.setUsername("vinodrajcm@gmail.com");
		 sender.setPassword("1ac08ec054@123");*/
		
	    Properties javaMaiProperties = new Properties();
	    /*javaMaiProperties.put("mail.smtp.auth", true);
	    javaMaiProperties.put("mail.smtp.starttls.enable", true);*/
	    javaMaiProperties.put("mail.smtp.starttls.enable", "true");
	    javaMaiProperties.put("mail.smtp.auth", "true");
	    javaMaiProperties.put("mail.transport.protocol", "smtp");
	    javaMaiProperties.put("mail.debug", "true");

	} catch (Exception e) {
	    System.out.println("error");
	}
    }

    /**
     * return From E-mail id based on brand code. As there is different from user for Kennametal and Widia
     * 
     * @param brandCode brand code
     * @return InternetAddress instance containing E-mail address
     * @throws AddressException
     */
    private static InternetAddress getFrom(String brandCode) throws AddressException {
	InternetAddress address = null;
	
	    address = new InternetAddress("ebusiness.service@kennametal.com");
	
	return address;
    }

    /**
     * Send E-mail with html UTF-8 encoded content along with attachment. This method with create separate thread to send e-mail.
     * 
     * @param to array of receiver E-mail addresses
     * @param bcc array of BCC receiver E-mail addresses
     * @param subject E-mail subject string
     * @param message E-mail message body
     * @param brandCode brand code
     * @param filesToAttach list of files to be sent as attachment
     */
    private static void sendEMail(final String[] to, final String[] bcc, final String subject, final String message, final String brandCode
	   ) {
	Thread emailSenderThread = new Thread() {
	    @Override
	    public void run() {
		try {
		    MimeMessage mimeMessage = sender.createMimeMessage();

		    String encodingOptions = "text/html; charset=UTF-8";
		    mimeMessage.setHeader("Content-Type", encodingOptions);

		    InternetAddress address = getFrom(brandCode);
		    mimeMessage.setFrom(address);

		    MimeMessageHelper helper = null;
		    // use the true flag to indicate you need a multipart message
		    helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
		    helper.setTo(to);
		    if (bcc != null && bcc.length > 0) {
			helper.setBcc(bcc);
		    }
		    helper.setSubject(subject);
		    helper.setText(message, true);

		    

		   
		    sender.send(mimeMessage);
		   

		    
		} catch (MessagingException e) {
		    System.out.println("error");

		} catch (Exception ex) {
			System.out.println("error");
		}
	    }
	};
	emailSenderThread.start();
    }


    /**
     * Send email.
     * 
     * @param to the to
     * @param subject the subject
     * @param message the message
     * @param values the values
     */
    public static void sendEmail(final String[] to, final String[] bcc, final String subject, final String message, final String brandCode) {
	sendEMail(to, bcc, subject, message, brandCode);
    }

    

    /**
     * Send email.
     * 
     * @param to the to
     * @param subject the subject
     * @param message the message
     */
    public static void sendEmail(final String to, final String subject, final String message, final String brandCode) {
	String[] toList = new String[1];
	toList[0] = to;
	sendEMail(toList, null, subject, message, brandCode);
    }

    /**
     * send Email
     * 
     * @param to respondent id
     * @param bcc bcc respondent id
     * @param subject Email subject
     * @param message Email body
     * @param brandCode brand
     */
    public static void sendEmail(final String to, String bcc, final String subject, final String message, final String brandCode) {
	String[] toList = new String[1];
	toList[0] = to;
	String[] bccList = new String[1];
	bccList[0] = bcc;
	sendEMail(toList, bccList, subject, message, brandCode);
    }

  

    public static void main(String args[]) {
	JavaMailSenderImpl sender = new JavaMailSenderImpl();
	SimpleMailMessage mailMessage = new SimpleMailMessage();
	sender.setHost("10.44.148.150");
	// sender.setHost("192.168.1.78");
	// sender.setPort(587);
	sender.setPort(25);
	sender.setUsername("rakesh.beerum");
	sender.setPassword("wel$come#123");
	Properties javaMaiProperties = new Properties();
	javaMaiProperties.put("mail.smtp.auth", true);
	javaMaiProperties.put("mail.smtp.starttls.enable", true);
	mailMessage.setFrom("kennametal");
	SimpleMailMessage message = new SimpleMailMessage();
	message.setFrom("knowledge");
	message.setTo("beerumrakesh@gmail.com");
	// message.setTo("rakesh.beerum");
	message.setSubject("test Kennmetal");
	message.setText("test Kennmetal");
	// sender.send(message);

	// JavaMailSenderImpl sender = new JavaMailSenderImpl();
	// mailMessage = new SimpleMailMessage();
	// sender.setHost("smtp.gmail.com");
	// sender.setPort(465);
	// sender.setUsername("netwebinar@gmail.com");
	// sender.setPassword("netweb12");
	// Properties javaMaiProperties = new Properties();
	// javaMaiProperties.put("mail.smtp.auth", true);
	// javaMaiProperties.put("mail.smtp.starttls.enable", true);
	// mailMessage.setFrom("kennametal");
	// MimeMessage mimeMessage = sender.createMimeMessage();
	// SimpleMailMessage message = new SimpleMailMessage();
	// message.setFrom("jayesh.dalwadi@bridge-x.com");
	// message.setTo("jayesh.dalwadi@bridge-x.com");
	// message.setSubject("test Kennmetal");
	// message.setText("test Kennmetal");
	// sender.send(message);

	// MimeMessageHelper helper = null;
	// MimeMessage mimeMessage = sender.createMimeMessage();
	// try
	// {
	// helper = new MimeMessageHelper(mimeMessage, true);
	// helper.setTo("jayeshd@imail.iz");
	// helper.setSubject("test Kennmetal");
	// helper.setText("test Kennmetal", true);
	// }
	// catch (MessagingException e)
	// {
	// // TODO Auto-generated catch block
	// ErrorProcessor.processAppError(e, LOCATION, "sendEmail" + " : To single user");
	// }
	// sender.send(mimeMessage);

    }
}
