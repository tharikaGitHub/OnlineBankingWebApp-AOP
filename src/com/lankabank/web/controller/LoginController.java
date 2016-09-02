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
public class LoginController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String getLogin(ModelMap model) {
			return "login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute User user, ModelMap model) {
		String userName = user.getUserName();
		String password = user.getPassword();
		if(userDao.validateUser(userName, password)) {
			List<User> theUser = userDao.getUserByName(userName);
			user.setNic(theUser.get(0).getNic());
			model.addAttribute("user", userName);
			model.addAttribute("success", "Welcome to our Online Banking Portal "+ userName + "!");
			return "home";
		}
		model.addAttribute("error", "Your UserName or Password is incorrect. Please try again.");
		return "login";
	}
	
}

