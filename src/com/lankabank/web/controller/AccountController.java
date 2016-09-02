package com.lankabank.web.controller;

import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lankabank.web.dao.AccountDAO;
import com.lankabank.web.model.Account;
import com.lankabank.web.model.Transaction;

@Controller
public class AccountController {

	@Autowired
	private AccountDAO accountDao;

	@RequestMapping(value = "/createAccountForm", method = RequestMethod.GET)
	public String getCreateAccForm(ModelMap model) {
			return "createAccount";
	}
	
	@RequestMapping(value = "/removeAccountForm", method = RequestMethod.GET)
	public String getRemoveAccForm(ModelMap model) {
			return "removeAccount";
	}
	
	@RequestMapping(value = "/creditAccountForm", method = RequestMethod.GET)
	public String getCreditAccForm(ModelMap model) {
			return "creditAccount";
	}
	
	@RequestMapping(value = "/debitAccountForm", method = RequestMethod.GET)
	public String getDebitAccForm(ModelMap model) {
			return "debitAccount";
	}
	
	@RequestMapping(value = "/moneyTransferAccountForm", method = RequestMethod.GET)
	public String getMoneyTransferAccForm(ModelMap model) {
			return "moneyTransfer";
	}
	
	@RequestMapping(value = "/accountInquiryForm", method = RequestMethod.GET)
	public String getAccInquiryForm(ModelMap model) {
			return "accInquiry";
	}
	
	@RequestMapping(value = "/inquiryForm", method = RequestMethod.GET)
	public String getAccInquiryRequestForm(ModelMap model) {
			return "inquiry";
	}
	
	@RequestMapping(value = "/createAccount", method = RequestMethod.POST)
	public String createAccount(@ModelAttribute Account account, ModelMap model) {
		Random rand = new Random();
		int  n = rand.nextInt(90000) + 10000;
		String accountNumber = Integer.toString(n);
		account.setAccountNumber(accountNumber);
		account.setAccBalance(0f);
		account.setUser((String)model.get("user"));
		if (accountDao.createAccount(account)) {
			model.addAttribute("accSuccess", "Account creation was successful");
			model.addAttribute("accNumber", accountNumber);
		} else {
			model.addAttribute("accError", "Account creation was unsuccessful. Please try again.");
		}
		return "createAccount";
	}
	
	@RequestMapping(value = "/creditAccount", method = RequestMethod.POST)
	public String creditAccount(@RequestParam("accNumber") String accNumber, @RequestParam("amount") float amount, ModelMap model) {
		String user = (String)model.get("user");
		if(accountDao.creditAccount(accNumber, amount, user)){
			model.addAttribute("creditSuccess", "Your account was successfully credited.");
		} else {
			model.addAttribute("creditError", "Account crediting was unsuccessfull. Please try again.");
		}
		return "creditAccount";
	}
	
	@RequestMapping(value = "/debitAccount", method = RequestMethod.POST)
	public String debitAccount(@RequestParam("accNumber") String accNumber, @RequestParam("amount") float amount, ModelMap model) {
		String user = (String)model.get("user");
		if(accountDao.debitAccount(accNumber, amount, user)) {
			model.addAttribute("debitSuccess", "Your account was successfully debited.");
		} else {
			model.addAttribute("debitError", "Account debiting was unsuccessfull. Please try again.");
		}
		return "debitAccount";
		
	}
	
	@RequestMapping(value = "/removeAccount", method = RequestMethod.POST)
	public String removeAccount(@RequestParam("accNumber") String accNumber, @RequestParam("nicNumber") String nicNumber, ModelMap model) {
		if(accountDao.removeAccount(accNumber, nicNumber)) {
			model.addAttribute("delSuccess", "The account was successfully suspended.");
		} else {
			model.addAttribute("delError", "Account suspension was unsuccessfull. Please try again.");
		}
		return "removeAccount";
	}
	
	@RequestMapping(value = "/moneyTransfer", method = RequestMethod.POST)
	public String moneyTransfer(@RequestParam("accNumber1") String accNumber1, @RequestParam("accNumber2") String accNumber2, @RequestParam("amount") float amount, ModelMap model) {
		String user = (String)model.get("user");
		if(accountDao.transferMoney(accNumber1, accNumber2, amount, user)) {
			model.addAttribute("trSuccess", "The money transfer was successful.");
		} else {
			model.addAttribute("trError", "Money transfer was unsuccessful. Please try again.");
		}
		return "moneyTransfer";
	}
	
	@RequestMapping(value = "/accInquiry", method = RequestMethod.POST)
	public String accountInquiry(@RequestParam("accNumber") String accNumber, ModelMap model) {
		String user = (String)model.get("user");
		Account acc = accountDao.getAccountDetails(accNumber, user);
		if (acc == null) {
			model.addAttribute("InqError", "Iquiry failed. Please try again.");
			return "inquiry";
		} else {
			model.addAttribute("accNumber", acc.getAccountNumber());
			model.addAttribute("accHolderName", acc.getAccHolderName());
			model.addAttribute("nicNumber", acc.getNicNumber());
			model.addAttribute("accBalance", acc.getAccBalance());
		}
		return "accInquiry";
	}
	
	@RequestMapping(value = "/getTransHistoryForm", method = RequestMethod.GET)
	public String getTransHistoryForm(ModelMap model) {
			return "transHistoryForm";
	}
	
	@RequestMapping(value = "/transactionHistory", method = RequestMethod.POST)
	public String getTransHistory(@RequestParam("accNumber") String accNumber, ModelMap model) {
		String user = (String)model.get("user");
		List<Transaction> transactionsHistory = accountDao.getUserTransactionHistory(accNumber, user);
		if (transactionsHistory == null) {
			model.addAttribute("historyError", "The account does not exist.");
			return "transHistoryForm";
		}
		else {
			model.addAttribute("history", transactionsHistory);
			return "transHistory";
		}
	}
	
	
}
