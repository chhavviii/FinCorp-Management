package com.example.utils;

import java.sql.Date;

public class Bank {
	private int branchId;
    private String branchName;
    private String location;
    private int numOfTransactions;
    private Date dateOfTransaction;
	public int getBranchId() {
		return branchId;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getNumOfTransactions() {
		return numOfTransactions;
	}
	public void setNumOfTransactions(int numOfTransactions) {
		this.numOfTransactions = numOfTransactions;
	}
	public Date getDateOfTransaction() {
		return dateOfTransaction;
	}
	public void setDateOfTransaction(Date dateOfTransaction) {
		this.dateOfTransaction = dateOfTransaction;
	}
    
    

}
