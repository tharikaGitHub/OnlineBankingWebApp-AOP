package com.lankabank.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lankabank.web.dao.UserDAO;
import com.lankabank.web.model.User;

@Controller
public class UserRegistrationController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public String getRegister(ModelMap model) {
			return "register";
	}
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public String editProfile(@ModelAttribute User user, ModelMap model) {
		userDao.updateUser(user, (String)model.get("user"));
		model.addAttribute("editSuccess", "Your profile was edited successfully.");
		return "profile";
	}
	
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String getProfileEdit(ModelMap model) {
		List<User> userList = userDao.getUserByName((String)model.get("user"));
		if(userList.size() == 1) {
			User theUser = userList.get(0);
			model.addAttribute("theUser", theUser);
		}
		return "profile";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(@ModelAttribute User user, ModelMap model) {
		boolean result = userDao.addUser(user);
		if (result) {
			model.addAttribute("regSuccess", "Registration successful. Now you can sign in.");
			return "login";
		} else {
			model.addAttribute("regError", "Registration Unsuccessful. The username provided already exists. Try another username.");
			return "register";
		}
	}
}

