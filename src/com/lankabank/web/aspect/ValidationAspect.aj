package com.lankabank.web.aspect;

import org.springframework.ui.ModelMap;
import com.lankabank.web.controller.AccountController;
import com.lankabank.web.model.Account;
import com.lankabank.web.model.User;

public aspect ValidationAspect {
	
	private String nicNumber;
	
	pointcut userFromSession(User user) :  execution(public String login(..)) && args(user,..) && within(com.lankabank.web.controller.LoginController);
	
    after (User user) : userFromSession(user) {
		this.nicNumber = user.getNic();
	}
	
	pointcut validateCreation(Account account, ModelMap model) : execution(* AccountController.createAccount(..)) && args(account, model);
	
	Object around (Account account, ModelMap model) : validateCreation(account, model) {
		String currentUserNic = nicNumber;
		String realUserNic = account.getNicNumber();
		if (realUserNic.equals(currentUserNic)) {
			return proceed(account, model);
		} else {
			model.addAttribute("permissionDenied", true);
			return "createAccount";
		}
	}
	
	pointcut validateDeletion(String nicNo, ModelMap model) : execution(* AccountController.removeAccount(..)) && args(..,nicNo,model);
	
	Object around (String nicNo, ModelMap model) : validateDeletion(nicNo, model) {
		String currentUserNic = nicNumber;
		String realUserNic = nicNo;
		if (realUserNic.equals(currentUserNic)) {
			return proceed(nicNo, model);
		} else {
			model.addAttribute("permissionDeniedForDelete", true);
			return "removeAccount";
		}
	}

}
