package com.eason.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;


public class IndexAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	@Action(results={@Result(location="/WEB-INF/content/login.jsp")})
	public String execute() throws Exception {
		return "success";
	}

	
}
