package com.zhou.douyu.service;

import java.util.List;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zhou.douyu.mapper.FeedbackDao;
import com.zhou.douyu.pojo.Feedback;

@Transactional
@Service
public class FeedbackService {
	
	private static final String EMAIL_USERNAME = "cxtv_6324@163.com";
	private static final String EMAIL_PASSWORD = "zhouqi666";

	private FeedbackDao feedbackDao;

	public void addFeedback(Feedback feedback) {
		feedbackDao.add(feedback);
	}

	public List<Feedback> getAllFeedback() {
		return feedbackDao.getAllFeedback();
	}

	public FeedbackDao getFeedbackDao() {
		return feedbackDao;
	}

	/**
	 * 用cxtv_6324邮箱给用户发一封邮件
	 * 
	 * @param email
	 *            邮件地址
	 * @param subject
	 *            主题
	 * @param content
	 *            内容
	 * @throws Exception
	 */
	public void SendEmailToUser(String email, String subject, String content) throws Exception {
		Properties prop = new Properties();
		prop.setProperty("mail.host", "smtp.163.com");
		prop.setProperty("mail.transport.protocol", "smtp");
		prop.setProperty("mail.smtp.auth", "true");
		// 使用JavaMail发送邮件的5个步骤
		// 1、创建session
		Session session = Session.getInstance(prop);
		// 开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
		session.setDebug(true);
		// 2、通过session得到transport对象
		Transport ts = session.getTransport();
		// 3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
		ts.connect("smtp.163.com", EMAIL_USERNAME, EMAIL_PASSWORD);
		// 4、创建邮件
		Message message = new MimeMessage(session);
		// 5、指明邮件的发件人
		message.setFrom(new InternetAddress(EMAIL_USERNAME));
		// 6、 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
		// 7、邮件的标题
		message.setSubject(subject);
		// 8. 邮件的文本内容
		message.setContent(content, "text/html;charset=UTF-8");
		// 9、发送邮件
		ts.sendMessage(message, message.getAllRecipients());
		// 10、关闭资源
		ts.close();
	}

	@Resource
	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}
}
