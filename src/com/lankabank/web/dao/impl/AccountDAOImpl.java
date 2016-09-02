package com.lankabank.web.dao.impl;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
import com.lankabank.web.dao.AccountDAO;
import com.lankabank.web.model.Account;
import com.lankabank.web.model.Transaction;

@Repository
public class AccountDAOImpl implements AccountDAO {
	
	@Autowired
	private MongoTemplate accountTemplate;
	
	public boolean creditAccount(String accountNumber, float amount, String user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("accountNumber").regex(accountNumber));
		List<Account> account = accountTemplate.find(query, Account.class); 
		if(account.size() == 1) {
			Account acc = account.get(0);
			if (acc.getUser().equals(user)) {
				float balance = acc.getAccBalance();
				accountTemplate.updateFirst(query,Update.update("accBalance", balance + amount), Account.class);
				Transaction trans = creditTransactions(accountNumber, amount, user);
				boolean transVal = recordTransaction(trans);
				if(transVal) return true;
			}
			return false;
		}
		return false;
	}
	
	public boolean debitAccount(String accountNumber, float amount, String user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("accountNumber").regex(accountNumber));
		List<Account> account = accountTemplate.find(query, Account.class); 
		if(account.size() == 1) {
			Account acc = account.get(0);
			if (acc.getUser().equals(user)) {
				float balance = acc.getAccBalance();
				if (amount <= balance) {
					accountTemplate.updateFirst(query,Update.update("accBalance", balance - amount), Account.class);
					Transaction trans = debitTransactions(accountNumber, amount, user);
					boolean transVal = recordTransaction(trans);
					if(transVal) return true;
				}
			}
			return false;
		}
		return false;
	}
	
	public boolean createAccount(Account account) {
		if (!accountTemplate.collectionExists(Account.class)) {
			accountTemplate.createCollection(Account.class);
		}
		String accNum = account.getAccountNumber();
		Query query = new Query();
		query.addCriteria(Criteria.where("accountNumber").regex(accNum));
		List<Account> acc = accountTemplate.find(query, Account.class); 
		if(acc.size() == 0) {
			accountTemplate.insert(account);
			return true;
		}
		return false;
	}
	
	public boolean removeAccount(String accountNumber, String nicNumber) {
		Query query = new Query();
		query.addCriteria(Criteria.where("accountNumber").regex(accountNumber).and("nicNumber").is(nicNumber));
		List<Account> accountDelete = accountTemplate.find(query, Account.class); 
		if(accountDelete.size() == 1) {
			accountTemplate.remove(accountDelete.get(0));
			return true;
		}
		return false;
	}
	
	public boolean transferMoney(String accNumber1, String accNumber2, float amount, String user) {
		Query query1 = new Query();
		query1.addCriteria(Criteria.where("accountNumber").regex(accNumber1));
		List<Account> accountTransferFrom = accountTemplate.find(query1, Account.class); 
		
		Query query2 = new Query();
		query2.addCriteria(Criteria.where("accountNumber").regex(accNumber2));
		List<Account> accountTransferTo = accountTemplate.find(query2, Account.class); 
		
		if(accountTransferFrom.size() == 1 && accountTransferTo.size() == 1) {
			Account acc1 = accountTransferFrom.get(0);
			Account acc2 = accountTransferTo.get(0);
			if (acc1.getUser().equals(user) && acc2.getUser().equals(user)) {
				if (debitAccount(accNumber1, amount, user) && creditAccount(accNumber2, amount, user)) {
					List<Transaction> transList = moneyTransferTransactions(accNumber1, accNumber2, amount, user);
					Transaction trans1 = transList.get(0);
					Transaction trans2 = transList.get(1);
					boolean transVal = recordTransaction(trans1) && recordTransaction(trans2);
					if(transVal) return true;
				}
				return false;
			}
			return false;
		}
		return false;	
	}
	
	public Account getAccountDetails(String accNumber, String user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("accountNumber").regex(accNumber));
		List<Account> accountDetails = accountTemplate.find(query, Account.class); 
		if(accountDetails.size() == 1) {
			Account acc = accountDetails.get(0);
			if (acc.getUser().equals(user)) {
				return acc;
			}
			return null;
		}
		return null;
	}
	
	public boolean recordTransaction(Transaction transaction) {
		if (!accountTemplate.collectionExists(Transaction.class)) {
			accountTemplate.createCollection(Transaction.class);
		}
		
		accountTemplate.insert(transaction);
		return true;
	}
	
	public List<Transaction> getUserTransactionHistory(String accNumber, String user) {
		Query query = new Query();
		query.addCriteria(Criteria.where("accNumber").regex(accNumber).and("user").is(user));
		List<Transaction> transaction = accountTemplate.find(query, Transaction.class);
		return transaction;
	}
	
	public Transaction creditTransactions(String accNumber, float amount, String user) {
		
		String userName = user;
		
		String accountNumber = accNumber;
		
		String transactionType = "Deposit";
		
		String details = "A deposit of Rs." + amount + " to account " + accountNumber;
				
		DateFormat dfDate = new SimpleDateFormat("dd/MM/yy");
		DateFormat dfTime = new SimpleDateFormat("HH:mm:ss");
	    Date dateobj = new Date();
	 
		String dateOfTransaction = dfDate.format(dateobj); 

		String timeOfTransaction = dfTime.format(dateobj);
		
		return new Transaction(userName, accountNumber, transactionType, details, dateOfTransaction, timeOfTransaction);
	}
	
	public Transaction debitTransactions(String accNumber, float amount, String user) {
		
		String userName = user;
		
		String accountNumber = accNumber;
		
		String transactionType = "Withdrawal";
		
		String details = "A withdrawal of Rs." + amount + " from account " + accountNumber;
				
		DateFormat dfDate = new SimpleDateFormat("dd/MM/yy");
		DateFormat dfTime = new SimpleDateFormat("HH:mm:ss");
	    Date dateobj = new Date();
	 
		String dateOfTransaction = dfDate.format(dateobj); 

		String timeOfTransaction = dfTime.format(dateobj);
		
		return new Transaction(userName, accountNumber, transactionType, details, dateOfTransaction, timeOfTransaction);
	}
	
	public List<Transaction> moneyTransferTransactions(String accNumber1, String accNumber2, float amount, String user) {

		List<Transaction> transList = new ArrayList<Transaction>();
		
		String userName = user;
		
		String accountNumber1 = accNumber1;
		
		String accountNumber2 = accNumber2;
		
		String transactionType = "Money Transfer";
		
		String details = "A transfer of Rs." + amount + " from account " + accountNumber1 + " to account " + accountNumber2;
				
		DateFormat dfDate = new SimpleDateFormat("dd/MM/yy");
		DateFormat dfTime = new SimpleDateFormat("HH:mm:ss");
	    Date dateobj = new Date();
	 
		String dateOfTransaction = dfDate.format(dateobj); 

		String timeOfTransaction = dfTime.format(dateobj);
		
		Transaction trans1 = new Transaction(userName, accNumber1, transactionType, details, dateOfTransaction, timeOfTransaction);
		Transaction trans2 = new Transaction(userName, accNumber2, transactionType, details, dateOfTransaction, timeOfTransaction);
		
		transList.add(trans1);
		transList.add(trans2);
		return transList;
	}
	
}
