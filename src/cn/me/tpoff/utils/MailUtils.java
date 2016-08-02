package cn.me.tpoff.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/**
 * 邮件发送工具类
 * @author 严杨鸿
 *
 */

public class MailUtils {
	
	/**
	 * 发送邮件的方法
	 * @param to	:收件人
	 * @param code	:激活码
	 */
	public static void sendMail(String to, String ecode) {
		/**
		 * 1.获得一个Session对象.
		 * 2.创建一个代表邮件的对象Message.
		 * 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.163.com");	//smtp服务器地址
		props.setProperty("mail.smtp.auth", "true");				//是否需要认证
		
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("yanyanghong_work@163.com", "WYjustforyou9496");
			}
			
		});
		session.setDebug(true);		//打开debug模式，会打印发送细节到console
		
		
		// 2.创建邮件对象:	
		MimeMessage message = new MimeMessage(session);
		// 设置发件人:
		try {
			message.setFrom(new InternetAddress("yanyanghong_work@163.com"));		//发件人的邮箱
			// 设置收件人:
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));		//邮件接收方
			// 抄送 CC   密送BCC
			// 设置标题
			message.setSubject("生鲜交易平台Me家官方激活邮件");
			// 设置邮件正文:
			String content = "<h1>生鲜交易平台Me家官方激活邮件!点下面链接完成激活操作!</h1>"
					+ "<h3><a href='http://localhost:8080/tpoff/user_active.action?ecode="+ecode+"&email="+to+"'>"
							+ "http://localhost:8080/tpoff/user_active.action?ecode="+ecode+"&email="+to+"</a></h3>";
			message.setContent(content, "text/html;charset=UTF-8");
			// 3.发送邮件:
			System.out.println(to);
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 发送邮件的方法
	 * @param to	:收件人
	 * @param code	:激活码
	 * @throws IOException 
	 */
	public static void editMail(String username, String to, String ecode) throws IOException {
		/**
		 * 1.获得一个Session对象.
		 * 2.创建一个代表邮件的对象Message.
		 * 3.发送邮件Transport
		 */
		// 1.获得连接对象
		Properties props = new Properties();
		props.setProperty("mail.smtp.host", "smtp.163.com");	//smtp服务器地址
		props.setProperty("mail.smtp.auth", "true");				//是否需要认证
		
		Session session = Session.getInstance(props, new Authenticator() {

			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("yanyanghong_work@163.com", "WYjustforyou9496");
			}
			
		});
		session.setDebug(true);		//打开debug模式，会打印发送细节到console
		
		
		// 2.创建邮件对象:	
		MimeMessage message = new MimeMessage(session);
		// 设置发件人:
		try {
			message.setFrom(new InternetAddress("yanyanghong_work@163.com"));		//发件人的邮箱
			// 设置收件人:
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));		//邮件接收方
			// 抄送 CC   密送BCC
			// 设置标题
			message.setSubject("生鲜交易平台Me家官方激活邮件");
			// 设置邮件正文:
			String content = "<h1>生鲜交易平台Me家官方激活邮件!点下面链接完成激活操作!</h1>"
					+ "<h3><a href='http://localhost:8080/tpoff/user_confirmEmail.action?username="+username+"&ecode="+ecode+"'>"
							+ "http://localhost:8080/tpoff/user_confirmEmail.action?username="+ username +"&ecode="+ecode+"</a></h3>";
			message.setContent(content, "text/html;charset=UTF-8");
			// 3.发送邮件:
			System.out.println(to);
			Transport.send(message);
			
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
