package com.eason.utility;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Time {

	public static String getTime(){
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(new Date());
	}
	
}
