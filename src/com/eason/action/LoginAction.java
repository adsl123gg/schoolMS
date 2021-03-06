package com.eason.action;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Admin;
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.pojo.User;
import com.eason.service.AdminService;
import com.eason.service.StudentService;
import com.eason.service.TeacherService;
import com.eason.service.UserService;

public class LoginAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private StudentService studentService;
	private TeacherService teacherService;
	private AdminService adminService;
	private UserService userService;
	
	private Student student;
	
	private String p;
	
	@Action(results={
					@Result(name="stu_success",type="redirectAction",params={"actionName","studentInfo"}),
					@Result(name="tea_success",type="redirectAction",params={"actionName","teacherInfo"}),
					@Result(name="admin_success",type="redirectAction",params={"actionName","adminClass"}),
					@Result(name="error",type="redirectAction",params={"actionName","index"})
				})
	public String execute() throws Exception {
		User user=new User();
		if ("student".equals(p)) {
			Student s=studentService.findByNameAndPasswd(student.getUsername(),student.getPasswd());
			if (null!=s) {
				session.put("student", s);
				
				user=userService.findByIdentity(s.getId());
				session.put("user", user);
				return "stu_success";
			}
		}else if ("teacher".equals(p)) {
			Teacher t=teacherService.findByNameAndPasswd(student.getUsername(),student.getPasswd());
			if (null!=t) {
				session.put("teacher", t);
				
				user=userService.findByIdentity(t.getId());
				session.put("user", user);
				return "tea_success";
			}
		}else if ("admin".equals(p)) {
			Admin a=adminService.findByNameAndPasswd(student.getUsername(),student.getPasswd());
			if (null!=a) {
				session.put("admin", a);
				
				user=userService.findByIdentity(a.getId());
				System.out.println(user.getId());
				session.put("user", user);
				return "admin_success";
			}
		}
			
		return ERROR;
	}

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getP() {
		return p;
	}

	public void setP(String p) {
		this.p = p;
	}

	@Autowired
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Autowired
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
}
