package com.lankabank.web.dao;

import java.util.List;

import com.lankabank.web.model.Account;
import com.lankabank.web.model.Transaction;

public interface AccountDAO {
	public boolean creditAccount(String accountNumber, float amount, String user);
	public boolean debitAccount(String accountNumber, float amount, String user);
	public boolean createAccount(Account account);
	public boolean removeAccount(String accountNumber, String nicNumber);
	public boolean transferMoney(String accNumber1, String accNumber2, float amount, String user);
	public Account getAccountDetails(String accNumber, String user);
	public boolean recordTransaction(Transaction transaction);
	public List<Transaction> getUserTransactionHistory(String accNumber, String user);
}
