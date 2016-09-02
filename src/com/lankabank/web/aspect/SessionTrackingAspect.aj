package com.lankabank.web.aspect;

import org.springframework.ui.ModelMap;

import com.lankabank.web.model.User;

public aspect SessionTrackingAspect {

	private String userName;
	
    pointcut session(User user) :  execution(public String login(..)) && args(user,..) && within(com.lankabank.web.controller.LoginController);
	
    after (User user) : session(user) {
		this.userName = user.getUserName();
	 }
	 
	pointcut setSession(ModelMap model) : execution(* com.lankabank.web..*.*(..)) && args(..,model) && !execution(public String login(..));
	 
	Object around (ModelMap model) : setSession(model) {
		model.addAttribute("user", userName);
		Object retVal = proceed(model);
		return retVal;
	}

}
