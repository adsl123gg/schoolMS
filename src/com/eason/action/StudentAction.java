package com.eason.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Student;
import com.eason.service.StudentService;



public class StudentAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private StudentService studentService;
	
	private String oldpasswd;
	private String newPwd;
	private String newPwd2;
	private String code;
	
	@Action(value="studentInfo",results={@Result(location="/WEB-INF/content/student_info.jsp")})
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="studentCourse",results={@Result(location="/WEB-INF/content/student_course.jsp")})
	public String studentInfo() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="studentScore",results={@Result(location="/WEB-INF/content/student_score.jsp")})
	public String studentScore() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="studentExit",results={@Result(type="redirectAction",params={"actionName","index"})})
	public String studentExit() throws Exception {
		session.clear();
		return SUCCESS;
	}
	
	
	@Action(value="stuChangePWD",results={@Result(type="redirectAction",params={"actionName","studentInfo","code","${code}"})})
	public String stuChangePWD() throws Exception {
		Student student=(Student)session.get("student");
		if (student.getPasswd().equals(oldpasswd)) {
			if (newPwd.equals(newPwd2)) {
				student.setPasswd(newPwd);
				studentService.save(student);
				code="t";
			}else {
				code="f";
			}
		}else {
			code="f";
		}
		return SUCCESS;
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

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	
}
