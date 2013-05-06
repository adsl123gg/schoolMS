package com.eason.utility;

public class Utility {

	public static String dealCourseTime(String time){
		String rs="";
		
		time=time.replaceAll("&&$", "");
		String[] bs=time.split("&&");
		for (String string : bs) {
			rs+=deal(string)+"&&";
		}
		
		return rs.replaceAll("&&$", "");
	}

	private static String deal(String string) {
		String[] bs=string.split("-");
		if ("1".equals(bs[1].trim())) {
			return "星期一"+bs[0];
		}else if ("2".equals(bs[1].trim())) {
			return "星期二"+bs[0];
		}if ("3".equals(bs[1].trim())) {
			return "星期三"+bs[0];
		}if ("4".equals(bs[1].trim())) {
			return "星期四"+bs[0];
		}if ("5".equals(bs[1].trim())) {
			return "星期五"+bs[0];
		}/*if ("6".equals(bs[1].trim())) {
			return "6-"+bs[0];
		}if ("7".equals(bs[1].trim())) {
			return "7-"+bs[0];
		}if ("8".equals(bs[1].trim())) {
			return "8-"+bs[0];
		}if ("9".equals(bs[1].trim())) {
			return "9-"+bs[0];
		}if ("10".equals(bs[1].trim())) {
			return "10-"+bs[0];
		}*/
		return null;
	}
	
	public static void main(String[] args) {
		String a="第一节-1&&第二节-2&&";
		System.out.println(dealCourseTime(a));
	}
	
}
