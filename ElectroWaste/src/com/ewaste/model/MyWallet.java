package com.ewaste.model;

import java.util.Date;

public class MyWallet {
	
	private int wallet_id;
	private int wp_id;
	private int user_id;
	private int amount;
	private Date date;

	public int getWallet_id() {
		return wallet_id;
	}
	public void setWallet_id(int wallet_id) {
		this.wallet_id = wallet_id;
	}
	public int getWp_id() {
		return wp_id;
	}
	public void setWp_id(int wp_id) {
		this.wp_id = wp_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
 