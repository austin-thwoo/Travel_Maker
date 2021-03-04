package com.icia.TravelMaker.service;

import java.security.MessageDigest;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.icia.TravelMaker.dto.OrdersDTO;
import com.icia.TravelMaker.util.MailUtils;

public class MailSendService {

	public String sendAuthMail(String email) {
        String authKey = getAuthKey(email);
        
        String host = "http://localhost:8080/TravelMaker/";
        String from = "k.tinnitus@gmail.com"; 
        String to = email;
        String subject = "회원가입 이메일 인증";
        String content = "<h1>[이메일 인증]</h1>"
        		+ "<p>아래 링크를 클릭하시면 이메일 인증이 완료됩니다.</p>"
        		+ "<a href='" + host + "joinConfirm?MID=" + email
        		+ "&AUTHKEY=" + authKey + "&MSTATE=1' target='_blenk'>이메일 인증 확인</a>";
        Properties p = new Properties();
        p.put("mail.smtp.user", from);
        p.put("mail.smtp.host", "smtp.googlemail.com");
        p.put("mail.smtp.port", "465");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.debug", "true");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.socketFactory.fallback", "false");
        try {
        	Authenticator auth = new MailUtils();
        	Session ses = Session.getInstance(p, auth);
        	ses.setDebug(true);
        	MimeMessage msg = new MimeMessage(ses);
        	msg.setSubject(subject);
        	Address fromAddr = new InternetAddress(from);
        	msg.setFrom(fromAddr);
        	Address toAddr = new InternetAddress(to);
        	msg.addRecipient(Message.RecipientType.TO, toAddr);
        	msg.setContent(content, "text/html; charset=UTF-8");
        	Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }

          return authKey;
    }
	
	//인증키 생성
	private String getAuthKey(String input) {
        StringBuffer result = new StringBuffer();
        try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			byte[] salt = "Hello! This is Salt.".getBytes();
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(input.getBytes("UTF-8"));
			for(int i = 0; i < chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if (hex.length() == 1) {
					result.append("0");
				}
				result.append(hex);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
        return result.toString();
    }

	public String sendTempPassword(String email) {
		String tempPassword = getTmepPassword();
		
        String from = "k.tinnitus@gmail.com"; 
        String to = email;
        String subject = "임시 비밀번호입니다.";
        String content = "<h1>[임시 비밀번호입니다.]</h1>"
        		+ "<p>임시 비밀번호. 로그인 후 비밀번호를 변경하여 사용하세요.</p>"
        		+ "<h3>" + tempPassword + "<h3>";
        Properties p = new Properties();
        p.put("mail.smtp.user", from);
        p.put("mail.smtp.host", "smtp.googlemail.com");
        p.put("mail.smtp.port", "465");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.debug", "true");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.socketFactory.fallback", "false");
        try {
        	Authenticator auth = new MailUtils();
        	Session ses = Session.getInstance(p, auth);
        	ses.setDebug(true);
        	MimeMessage msg = new MimeMessage(ses);
        	msg.setSubject(subject);
        	Address fromAddr = new InternetAddress(from);
        	msg.setFrom(fromAddr);
        	Address toAddr = new InternetAddress(to);
        	msg.addRecipient(Message.RecipientType.TO, toAddr);
        	msg.setContent(content, "text/html; charset=UTF-8");
        	Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }

          return tempPassword;
	}

	private String getTmepPassword() {
		return UUID.randomUUID().toString().replaceAll("-", "").substring(0, 10);
	}

	public void sendAlarm(OrdersDTO dto) {
        String from = "k.tinnitus@gmail.com"; 
        String to = dto.getMID();
        String subject = "계약금을 지불한신 패키지의 여행최소인원이 채워졌습니다.";
        String content = "<p>계약금을 지불한신 패키지[" + dto.getPNAME() + "(" + dto.getPSSTART() + " ~ " + dto.getPSEND() + ")"
        		+ "]의 여행최소인원이 채워졌습니다.</p>"
        		+ "<p>남은 잔금 결제을 결재하시겠습니까?</p>"
        		+ "<h3>링크를 넣을까 말까?<h3>";
        Properties p = new Properties();
        p.put("mail.smtp.user", from);
        p.put("mail.smtp.host", "smtp.googlemail.com");
        p.put("mail.smtp.port", "465");
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.debug", "true");
        p.put("mail.smtp.socketFactory.port", "465");
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        p.put("mail.smtp.socketFactory.fallback", "false");
        try {
        	Authenticator auth = new MailUtils();
        	Session ses = Session.getInstance(p, auth);
        	ses.setDebug(true);
        	MimeMessage msg = new MimeMessage(ses);
        	msg.setSubject(subject);
        	Address fromAddr = new InternetAddress(from);
        	msg.setFrom(fromAddr);
        	Address toAddr = new InternetAddress(to);
        	msg.addRecipient(Message.RecipientType.TO, toAddr);
        	msg.setContent(content, "text/html; charset=UTF-8");
        	Transport.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
