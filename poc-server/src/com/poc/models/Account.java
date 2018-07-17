package com.poc.models;

public class Account {
	private String user;
	private String cname;
	private String cmob;
	private int outstanding;
		
	public Account(String user, String cname, String cmob, int outstanding) {
		super();
		this.user = user;
		this.cname = cname;
		this.cmob = cmob;
		this.outstanding = outstanding;
	}
	
	public String getUser() {
		return user;
	}
	
	public void setUser(String user) {
		this.user = user;
	}
	
	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCmob() {
		return cmob;
	}

	public void setCmob(String cmob) {
		this.cmob = cmob;
	}

	public int getOutstanding() {
		return outstanding;
	}

	public void setOutstanding(int outstanding) {
		this.outstanding = outstanding;
	}

	
}
