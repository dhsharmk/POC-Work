package com.poc.models;

public class Item {
	private String user;
	private String unit;
	private String quantity;
	private String stuff;
	private String time;
	public Item(String user, String quantity, String unit, String stuff, String time) {
    		this.user = user;
		this.unit = unit;
		this.quantity = quantity;
		this.stuff = stuff;
		this.time = time;
	}
	public Item(String user, String unit, String quantity, String stuff) {
		super();
		this.user = user;
		this.unit = unit;
		this.quantity = quantity;
		this.stuff = stuff;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
