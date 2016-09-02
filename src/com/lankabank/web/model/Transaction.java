package com.lankabank.web.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection="transaction")
public class Transaction {
	
	@Id
	private String _id;
	private String user;
	private String accNumber;
	private String transactionType;
	private String transactionDetails;
	private String dateOfTransaction;
	private String timeOfTransaction;
	
	//Immutable design pattern is used here
	public Transaction (String user, String accNumber, String transactionType, String transactionDetails, String dateOfTransaction, String timeOfTransaction) {
		this.user = user;
		this.accNumber = accNumber;
		this.transactionType = transactionType;
		this.transactionDetails = transactionDetails;
		this.dateOfTransaction = dateOfTransaction;
		this.timeOfTransaction = timeOfTransaction;
	}
	
	public String getUser() {
		return user;
	}

	public String getAccNumber() {
		return accNumber;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public String getTransactionDetails() {
		return transactionDetails;
	}

	public String getDateOfTransaction() {
		return dateOfTransaction;
	}

	public String getTimeOfTransaction() {
		return timeOfTransaction;
	}
	
}
