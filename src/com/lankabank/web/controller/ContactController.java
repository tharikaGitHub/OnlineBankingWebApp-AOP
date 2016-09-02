package com.lankabank.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lankabank.web.dao.ContactDAO;
import com.lankabank.web.model.Contact;

@Controller
public class ContactController {

	@Autowired
	private ContactDAO contactDao;
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String getHome(ModelMap model) {
			return "home";
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String getContact(ModelMap model) {
			return "contact";
	}
	
	@RequestMapping(value = "/contactSubmit", method = RequestMethod.POST)
	public String submitContact(@ModelAttribute Contact contact, ModelMap model) {
		contactDao.sendContact(contact);
		model.addAttribute("successSubmit", "Your message is successfully sent. We will reply to you soon.");
		return "contact";
	}
	
}
