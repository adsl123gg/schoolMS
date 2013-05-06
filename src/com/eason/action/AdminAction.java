package com.eason.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Admin;
import com.eason.pojo.Class;
import com.eason.pojo.Course;
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.service.AdminService;
import com.eason.service.ClassService;
import com.eason.service.CourseService;
import com.eason.service.StudentService;
import com.eason.service.TeacherService;
import com.eason.utility.Time;
import com.eason.utility.UUID;

public class AdminAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	private AdminService adminService;
	private TeacherService teacherService;
	private StudentService studentService;
	private ClassService classService;
	private CourseService courseService;
	
	private Teacher teacher;
	private Student student;
	
	private String oldpasswd;
	private String newPwd;
	private String newPwd2;
	private String code;
	private List<Class> clazzs;
	private List<Teacher> teachers;
	private List<Student> students;
	private List<Course> courses;
	private Class clazz;
	private String classid;
	private String studentid;
	private String teacherid;
	private String result;
	private String classcontent;
	
	@Action(value="adminClass",results={@Result(location="/WEB-INF/content/admin_class.jsp")})
	public String adminClass() throws Exception {
		clazzs=classService.findAll();
		return SUCCESS;
	}
	
	@Action(value="adminTeacherInfo",results={@Result(location="/WEB-INF/content/admin_teacher_info.jsp")})
	public String adminTeacherInfo() throws Exception {
		teachers=teacherService.findAll();
		return SUCCESS;
	}
	
	@Action(value="adminClassInfo",results={
			@Result(name="success",location="/WEB-INF/content/admin_class_info.jsp"),
			@Result(name="error",type="redirectAction",params={"actionName","adminClass"})
	})
	public String adminClassInfo() throws Exception {
		clazz=classService.findById(classid);
		if (null==clazz) {
			return ERROR;
		}
		
		students=studentService.findByClass(classid);
		return SUCCESS;
	}
	
	@Action(value="adminCourse",results={@Result(location="/WEB-INF/content/admin_course.jsp")})
	public  String adminCourse(){
		teachers=teacherService.findAll();
		courses=courseService.findAll();
		return SUCCESS;
	}
	
	
	@Action(value="adminExit",results={@Result(type="redirectAction",params={"actionName","index"})})
	public String adminExit() throws Exception {
		session.clear();
		return SUCCESS;
	}
	
	@Action(value="adminChangePWD",results={@Result(type="redirectAction",params={"actionName","adminClass","code","${code}"})})
	public String adminChangePWD() throws Exception {
		Admin a=(Admin)session.get("admin");
		if (a.getPasswd().equals(oldpasswd)) {
			if (newPwd.equals(newPwd2)) {
				a.setPasswd(newPwd);
				adminService.save(a);
				setCode(UPDATEADMINPWD_SUCCESS);
			}else {
				setCode(UPDATEADMINPWD_FAIL);
			}
		}else {
			setCode(UPDATEADMINPWD_FAIL);
		}
		return SUCCESS;
	}
	
	
	@Action(value="addTeacher",results={
			@Result(name="success",type="redirectAction",params={"actionName","adminTeacherInfo","code","${code}"})
	})
	public String addTeacher(){
		
		if (isExistTeacher(teacher)) {
			setCode(ADDTEACHER_FAIL);
			return SUCCESS;
		}
		
		teacher.setCreatetime(Time.getTime());
		teacher.setPasswd(teacher.getUsername());
		teacherService.save(teacher);
		
		
		Teacher t=teacherService.findById(teacher.getId());
		if (null==t) {
			setCode(ADDTEACHER_FAIL);
			return SUCCESS;
		}
		
		setCode(ADDTEACHER_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="updateTeacher",results={
			@Result(name="success",type="redirectAction",params={"actionName","adminTeacherInfo","code","${code}"})
	})
	public String updateTeacher(){
		
		if (isExistTeacher(teacher)) {
			setCode(UPDATETEACHER_FAIL);
			return SUCCESS;
		}
		
		Teacher t=teacherService.findById(teacher.getId());
		t.setAddress(teacher.getAddress());
		t.setBirth(teacher.getBirth());
		t.setIntime(teacher.getIntime());
		t.setUsername(teacher.getUsername());
		t.setPasswd(teacher.getUsername());
		t.setName(teacher.getName());
		t.setSex(teacher.isSex());
		t.setSchool(teacher.getSchool());
		t.setEducation(teacher.getEducation());

		teacherService.save(t);
		setCode(UPDATETEACHER_SUCCESS);
		
		return SUCCESS;
	}
	
	@Action(value="deleteTeacher")
	public void deleteTeacher(){
		PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		teacher=teacherService.findById(teacherid);
		if (null==teacher) {
			writer.print(DELETETEACHER_FAIL);
			return;
		}
		
		try {
			teacherService.del(teacher);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			Teacher t=teacherService.findById(teacherid);
			if (null==t) {
				writer.print(DELETETEACHER_SUCCESS);
			}else {
				writer.print(DELETETEACHER_FAIL);
			}
		}
		
		writer.flush();
		writer.close();
	}
	
	private boolean isExistTeacher(Teacher teacher) {
		teachers=teacherService.findAll();
		
		for (Teacher t : teachers) {
			if (!(t.getId().equals(teacher.getId()))&&t.getUsername().equals(teacher.getUsername())) {
				return true;
			}
		}
		
		return false;
	}

	@Action(value="addStudent",results={
			@Result(name="success",type="redirectAction",params={"actionName","adminClassInfo","classid","${classid}","code","${code}"})
	})
	public String addStudent(){
		Class c=classService.findById(classid);
		
		if (isExistStudent(student)) {
			setCode(ADDSTUDENT_FAIL);
			return SUCCESS;
		}
		
		student.setClazz(c);
		student.setCreatetime(Time.getTime());
		student.setPasswd(student.getUsername());
		studentService.save(student);
		
		Student s=studentService.findById(student.getId());
		if (null==s) {
			setCode(ADDSTUDENT_FAIL);
			return SUCCESS;
		}
		
		setCode(ADDSTUDENT_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="updateStudent",results={
			@Result(name="success",type="redirectAction",params={"actionName","adminClassInfo","classid","${classid}","code","${code}"})
	})
	public String updateStudent(){
		if (isExistStudent(student)) {
			setCode(UPDATESTUDENT_FAIL);
			return SUCCESS;
		}
		Student s=studentService.findById(student.getId());
		s.setAddress(student.getAddress());
		s.setBirth(student.getBirth());
		s.setIntime(student.getIntime());
		s.setUsername(student.getUsername());
		s.setPasswd(student.getUsername());
		s.setName(student.getName());
		s.setSex(student.getSex());
		
		studentService.save(s);
		
		setCode(UPDATESTUDENT_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="deleteStudent")
	public void deleteStudent(){
		PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		student=studentService.findById(studentid);
		if (null!=student) {
			try {
				studentService.del(student);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				student=studentService.findById(studentid);
				if (student==null) {
					writer.print(DELETESTUDENT_SUCCESS);
					return;
				}
			}
		}
		
		writer.print(DELETESTUDENT_FAIL);
		writer.flush();
		writer.close();
	}
	
	@Action(value="addClass",results={
			@Result(name="success",type="redirectAction",params={"actionName","adminClass","code","${code}"})
	})
	public String addClass(){
		
		if (isExistClass(clazz)) {
			setCode(ADDCLASS_FAIL);
			return SUCCESS;
		}
		
		clazz.setCreatetime(Time.getTime());
		classService.save(clazz);
		
		Class c=classService.findById(clazz.getId());
		if (null==c) {
			setCode(ADDCLASS_FAIL);
		}else {
			setCode(ADDCLASS_SUCCESS);
		}
		
		return SUCCESS;
	}
	
	@Action(value="updateClass",results={
			@Result(name="success",type="redirectAction",params={"actionName","adminClass","code","${code}"})
	})
	public String updateClass(){
		clazz=classService.findById(classid);
		
		if (isExistClass(clazz)) {
			setCode(UPDATECLASS_FAIL);
			return SUCCESS;
		}
		
		clazz.setClassname(classcontent);
		classService.save(clazz);
		setCode(UPDATECLASS_SUCCESS);
		
		return SUCCESS;
	}
	
	@Action(value="delClass")
	public void delClass(){
		PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Class c=classService.findById(classid);
		System.out.println(c.getClassname());
		if (null!=c) {
			try {
				classService.del(c);
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				c=classService.findById(classid);
				if (c==null) {
					writer.print(DELETECLASS_SUCCESS);
					return;
				}
			}
			
		}
		
		writer.print(DELETECLASS_FAIL);
		writer.flush();
		writer.close();
	}
	
	public boolean isExistClass(Class clazz){
		clazzs=classService.findAll();
		for (Class c  : clazzs) {
			if ((!c.getId().equals(clazz.getId()))&&c.getClassname().equals(clazz.getClassname())) {
				return true;
			}
		}
		return false;
	}
	
	
	public boolean isExistStudent(Student student){
		students=studentService.findAll();
		for (Student s  : students) {
			if ((!s.getId().equals(student.getId()))&&s.getUsername().equals(student.getUsername())) {
				return true;
			}
		}
		return false;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	@Autowired
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@Autowired
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	@Autowired
	public void setClassService(ClassService classService) {
		this.classService = classService;
	}

	public List<Class> getClazzs() {
		return clazzs;
	}

	public void setClazzs(List<Class> clazzs) {
		this.clazzs = clazzs;
	}

	public List<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(List<Teacher> teachers) {
		this.teachers = teachers;
	}

	public Class getClazz() {
		return clazz;
	}

	public void setClazz(Class clazz) {
		this.clazz = clazz;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public String getClasscontent() {
		return classcontent;
	}

	public void setClasscontent(String classcontent) {
		this.classcontent = classcontent;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getStudentid() {
		return studentid;
	}

	public void setStudentid(String studentid) {
		this.studentid = studentid;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	public List<Course> getCourses() {
		return courses;
	}

	public void setCourses(List<Course> courses) {
		this.courses = courses;
	}

	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

}
