package kr.ac.kopo.admincard.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.admincard.DAO.AdminCardDAO;
import kr.ac.kopo.admincard.vo.AdminCardVO;

@Service
public class AdminCardServiceImpl implements AdminCardService {

	@Autowired
	private AdminCardDAO adminCardDAO;

	public List<AdminCardVO> selectReccomendationCard(int no) {
		List<AdminCardVO> recommendationCard = adminCardDAO.selectReccomendationCard(no);
		return recommendationCard;
	}

	public List<AdminCardVO> selectCardList() {
		List<AdminCardVO> cardList = adminCardDAO.selectCardList();
		return cardList;
	}

	public List<AdminCardVO> selectCardInfo(int no) {
		List<AdminCardVO> cardInfo = adminCardDAO.selectCardInfo(no);
		return cardInfo;
	}

	public int selectMemberCount(Map<String, Object> param) {
		int memberCount = adminCardDAO.selectMemberCount(param);
		return memberCount;
	}

	public List<AdminCardVO> selectEmailAddress(AdminCardVO vo) {

		List<AdminCardVO> emailList = adminCardDAO.selectEmailAddress(vo);
		return emailList;
	}

	public void sendingMail(AdminCardVO vo) {
		List<AdminCardVO> emailList = selectEmailAddress(vo);

		String mail_id = "99bonseong@gmail.com";
		String mail_pw = "6dnjf2dlf!@#";


		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.gmail.com");
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(mail_id, mail_pw);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(mail_id));

			/*
			 * for(AdminCardVO email : emailList) {
			 * message.addRecipient(javax.mail.Message.RecipientType.TO, new
			 * InternetAddress(email.getEmailAddress())); message.setSubject("[??????????????????] " +
			 * email.getName() +"??? ???????????? ?????? ?????????????????????."); message.setText(vo.getMailContent());
			 * }
			 */
			
			// ????????? ?????? ??????
			String email="9bonseong@naver.com";
			message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(email));

			// Subject
			message.setSubject("[??????????????????] ???????????? ???????????? ?????? ?????????????????????."); // ?????? ????????? ??????

			// Text
			message.setText(vo.getMailContent()); // ?????? ????????? ??????

			// send the message
			Transport.send(message); //// ??????

			System.out.println("??????????????? ??????????????????.");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		vo.setCnt(emailList.size());
		writeLog(vo);
		

	}
	
	public void writeLog(AdminCardVO vo) {
		adminCardDAO.insertMailLog(vo);
		
		
	}

	public List<AdminCardVO> selectMailLog() {
		List<AdminCardVO> mailLog = adminCardDAO.selectMailLog();
		return mailLog;
	}
	
	

}
