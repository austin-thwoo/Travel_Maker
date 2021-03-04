package com.icia.TravelMaker.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailUtils extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("k.tinnitus@gmail.com", "hoty4848");
	}
}
