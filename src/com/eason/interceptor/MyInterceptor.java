package com.eason.interceptor;


import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@Component
public class MyInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String rs=invocation.invoke();
		System.out.println(rs+"++++++++++++++++++++++++++++++++++++++");
		return rs;
	}

}
