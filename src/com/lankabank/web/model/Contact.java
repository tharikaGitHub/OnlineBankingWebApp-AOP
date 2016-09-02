package com.lankabank.web.model;

import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="contact")
public class Contact {

	private String email;
	private String subject;
	private String message;
	
	public Contact() {}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
}
