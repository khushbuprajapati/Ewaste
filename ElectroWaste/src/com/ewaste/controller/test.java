package com.ewaste.controller;

public class test extends Thread {
	
	public void run() {
		System.out.println("My thread is in running state.");
	}
	
	public static void main(String args[]) {
		test obj = new test();
		obj.run();
	}
}
