package com.eason.utility;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Time implements Constant{

	public static String getTime(){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(new Date());
	}
	
	public static String isInExamTime(String starttime,int length){
		Date date=new Date(starttime);
		if (date.compareTo(new Date())==1) {
			return BEFOREEXAM;
		}
		
		date.setHours(date.getHours()+length);
		if (date.compareTo(new Date())==-1) {
			return AFTEREXAM;
		}
		
		return "ok";
	}
	
	public static int getCountDown(String starttime,int length) {
		Date date=new Date(starttime);
		date.setHours(date.getHours()+length);
		
		int datemin=date.getHours()*60+date.getMinutes();
		
		Date now=new Date();
		int nowmin=now.getHours()*60+now.getMinutes();
		
		return (datemin-nowmin);
	}
	
}
