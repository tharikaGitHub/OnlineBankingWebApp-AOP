package com.lankabank.web.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

import com.lankabank.web.dao.ContactDAO;
import com.lankabank.web.model.Contact;

@Repository
public class ContactDAOImpl implements ContactDAO {
	
	@Autowired
	private MongoTemplate contactTemplate;
	
	public void sendContact(Contact contact){
		if (!contactTemplate.collectionExists(Contact.class)) {
			contactTemplate.createCollection(Contact.class);
		}
		contactTemplate.insert(contact);
	}
}
