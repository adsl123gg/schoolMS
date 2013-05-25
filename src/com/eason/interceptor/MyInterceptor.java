package com.eason.interceptor;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Component;

import com.eason.pojo.Admin;
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionProxy;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@Component
public class MyInterceptor extends AbstractInterceptor{

	private static final long serialVersionUID = 1L;
	
	private Set<String> studentActions=new HashSet<String>();
	private Set<String> teacherActions=new HashSet<String>();
	
	Student student=null;
	Teacher teacher=null;
	Admin admin=null;
	
	String rs="";
	String role="";
	
	
	public MyInterceptor() throws Exception {
		//String path="E:\\Git\\schoolMS\\etc\\";
		
		String path=MyInterceptor.class.getClassLoader().getResource("").toString();
		path=path.replace("file:/", "");
		
		System.out.println(path);
		System.out.println("==================================");
		String line="";
		
		File student_role=new File(path+"student_role");
		BufferedReader reader=new BufferedReader(new InputStreamReader(new FileInputStream(student_role)));
		while ((line=reader.readLine())!=null) {
			studentActions.add(line.trim());
		}
		reader.close();
		
		File teacher_role=new File(path+"teacher_role");
		 reader=new BufferedReader(new InputStreamReader(new FileInputStream(teacher_role)));
		while ((line=reader.readLine())!=null) {
			teacherActions.add(line.trim());
		}
		reader.close();
	}
	

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpSession session=ServletActionContext.getRequest().getSession();
		
		
		ActionProxy proxy=invocation.getProxy();
		String name=proxy.getActionName();
		
		if (name.equals("index")||name.equals("no_permission")||name.equals("login")) {
			rs=invocation.invoke();
			return rs;
		}
		
		
		student=(Student) session.getAttribute("student");
		teacher=(Teacher) session.getAttribute("teacher");
		admin=(Admin) session.getAttribute("admin");
		
		if (validateActionName(name)) {
			rs=invocation.invoke();
			return rs;
		}
		
		return "no_permission";
	}
	
	private boolean validateActionName( String name) {
		/*if ("student".equals(role)) {
			if (studentActions.contains(name)&&student!=null) {
				return true;
			}
		}else if ("teacher".equals(role)) {
			if (teacherActions.contains(name)&&teacher!=null) {
				return true;
			}
		}else if ("admin".equals(role)&&admin!=null) {
			return true;
		}*/
		
			if (studentActions.contains(name)&&student!=null) {
				return true;
			}
			if (teacherActions.contains(name)&&teacher!=null) {
				return true;
			}
			 if (admin!=null) {
				 return true;
			 }
		
		return false;
	}

	
}
