package com.poc.models;

public class Item {
	private String user;
	private String cname;
	private String cmob;
	private String unit;
	private String quantity;
	private String stuff;
	private String price;
	private String rate;
	private String time;
	private String outstanding;
	
	public Item(String user, String quantity, String unit, String stuff, String time, String rate) {
		this.user = user;
		this.unit = unit;
		this.quantity = quantity;
		this.stuff = stuff;
		this.time = time;
		this.rate = rate;
	}
	
	public Item(String user, String cname, String cmob, String outstanding) {
		super();
		this.user = user;
		this.cname = cname;
		this.cmob = cmob;
		this.outstanding = outstanding;
	}

	public Item(String cname, String cmob, String unit, String quantity, String stuff, String price, String rate) {
		super();
		this.cname = cname;
		this.cmob = cmob;
		this.unit = unit;
		this.quantity = quantity;
		this.stuff = stuff;
		this.price = price;
		this.rate = rate;
	}

	public Item(String user, String cname, String cmob, String unit, String quantity, String stuff, String price, String rate) {
		super();
		this.user = user;
		this.cname = cname;
		this.cmob = cmob;
		this.unit = unit;
		this.quantity = quantity;
		this.stuff = stuff;
		this.price = price;
		this.rate = rate;
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

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getStuff() {
		return stuff;
	}

	public void setStuff(String stuff) {
		this.stuff = stuff;
	}
	
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
		this.rate = rate;
	}

	public String getTime() {
		return time;
	}
	
	public String getOutstanding() {
		return outstanding;
	}

	public void setOutstanding(String outstanding) {
		this.outstanding = outstanding;
	}

	public void setTime(String time) {
		this.time = time;
	}
}