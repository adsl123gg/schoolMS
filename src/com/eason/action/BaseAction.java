package com.eason.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;


import com.eason.utility.Constant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport implements Constant{

	private static final long serialVersionUID = 1L;
	 Map<String, Object> session;
	 Map<String, Object> application;
	 HttpServletRequest request;
	 HttpServletResponse response;
	
	
	public BaseAction(){
		session=ActionContext.getContext().getSession();
		application=ActionContext.getContext().getApplication();
		request=ServletActionContext.getRequest();
		response=ServletActionContext.getResponse();
		
	}
	
	public PrintWriter getWriter(){
		 PrintWriter writer=null;
		 try {
				writer = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
		 
		 return writer;
	}
	
	public void closeWriter(PrintWriter writer){
		writer.flush();
		writer.close();
	}

}
