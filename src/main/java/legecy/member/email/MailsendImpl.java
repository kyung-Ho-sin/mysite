package legecy.member.email;

import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailsendImpl implements Mailsend{
	
	private final JavaMailSender javamailsender;
	
	@Autowired
	public MailsendImpl(JavaMailSender javamailsender) {
		this.javamailsender = javamailsender;
	}
	
	@Override
	public boolean send(Map<String, Object> mailvo) {
		MimeMessage message = javamailsender.createMimeMessage();
		
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"UTF-8");
			helper.setSubject((String) mailvo.get("subject"));
			helper.setText((String) mailvo.get("text"));
			helper.setFrom((String)mailvo.get("from"));
			helper.setTo((String)mailvo.get("to"));


			javamailsender.send(message);
			return true;
		}catch(MessagingException e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
