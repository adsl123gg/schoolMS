package com.eason.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.service.TeacherService;

public class TeacherAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private TeacherService teacherService;
	
	private String oldpasswd;
	private String newPwd;
	private String newPwd2;
	private String code;

	@Action(value="teacherInfo",results={@Result(location="/WEB-INF/content/teacher_info.jsp")})
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="teacherCourse",results={@Result(location="/WEB-INF/content/teacher_course.jsp")})
	public String teacherInfo() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="teacherScore",results={@Result(location="/WEB-INF/content/teacher_score.jsp")})
	public String teacherScore() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="teacherExit",results={@Result(type="redirectAction",params={"actionName","index"})})
	public String teacherExit() throws Exception {
		session.clear();
		return SUCCESS;
	}
	
	@Action(value="teaChangePWD",results={@Result(type="redirectAction",params={"actionName","teacherInfo","code","${code}"})})
	public String stuChangePWD() throws Exception {
		Teacher t=(Teacher)session.get("teacher");
		if (t.getPasswd().equals(oldpasswd)) {
			if (newPwd.equals(newPwd2)) {
				t.setPasswd(newPwd);
				teacherService.save(t);
				code="t";
			}else {
				code="f";
			}
		}else {
			code="f";
		}
		return SUCCESS;
	}
	
	@Autowired
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getOldpasswd() {
		return oldpasswd;
	}

	public void setOldpasswd(String oldpasswd) {
		this.oldpasswd = oldpasswd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getNewPwd2() {
		return newPwd2;
	}

	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}
	
}
