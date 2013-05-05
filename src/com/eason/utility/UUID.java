package com.eason.utility;

public class UUID {

	public static String getUUID(){
		return java.util.UUID.randomUUID().toString();
	}
	
	public static void main(String[] args) {
		System.out.println(getUUID());
	}
}
