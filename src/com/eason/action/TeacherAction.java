package com.eason.action;


import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Class;
import com.eason.pojo.Course;
import com.eason.pojo.Paper;
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.service.ClassService;
import com.eason.service.PaperService;
import com.eason.service.StudentService;
import com.eason.service.TeacherService;

public class TeacherAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private TeacherService teacherService;
	private ClassService classService;
	private StudentService studentService;
	private PaperService paperService;
	
	private List<Student> students;
	private List<Paper> papers;
	
	private String oldpasswd;
	private String newPwd;
	private String newPwd2;
	private String code;
	private Set<Course> teacherCourses;
	private Set<Class> clazzs;
	private String classid;
	private Class clazz;
	
	private Teacher teacher=(Teacher) session.get("teacher");

	@Action(value="teacherInfo",results={@Result(location="/WEB-INF/content/teacher_info.jsp")})
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="teacherCourse",results={@Result(location="/WEB-INF/content/teacher_course.jsp")})
	public String teacherInfo() throws Exception {
		
		System.out.println(teacher.getName());
		teacherCourses=teacherService.findById(teacher.getId()).getCourseSet();
		
		return SUCCESS;
	}
	
	@Action(value="teacherClass",results={@Result(location="/WEB-INF/content/teacher_class.jsp")})
	public String teacherScore() throws Exception {
		
		clazzs=classService.findByTeacherId(teacher.getId());
		
		return SUCCESS;
	}
	
	
	@Action(value="teacherClassInfo",results={@Result(location="/WEB-INF/content/teacher_class_info.jsp")})
	public String teacherClassInfo() throws Exception {
		
		clazz=classService.findById(classid);
		students=studentService.findByClass(classid);
		
		return SUCCESS;
	}
	
	
	@Action(value="teacherPaperList",results={@Result(location="/WEB-INF/content/teacher_paper.jsp")})
	public String teacherPaperList() throws Exception {
		Teacher t=(Teacher)session.get("teacher");
		papers=paperService.findByTeacherId(t.getId());
		
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
				setCode(UPDATETEACHERPWD_SUCCESS);
			}else {
				setCode(UPDATETEACHERPWD_FAIL);
			}
		}else {
			setCode(UPDATETEACHERPWD_FAIL);
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

	public Set<Course> getTeacherCourses() {
		return teacherCourses;
	}

	public void setTeacherCourses(Set<Course> teacherCourses) {
		this.teacherCourses = teacherCourses;
	}

	public Set<Class> getClazzs() {
		return clazzs;
	}

	public void setClazzs(Set<Class> clazzs) {
		this.clazzs = clazzs;
	}

	public void setClassService(ClassService classService) {
		this.classService = classService;
	}

	public String getClassid() {
		return classid;
	}

	public void setClassid(String classid) {
		this.classid = classid;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public List<Student> getStudents() {
		return students;
	}

	public void setStudents(List<Student> students) {
		this.students = students;
	}

	public Class getClazz() {
		return clazz;
	}

	public void setClazz(Class clazz) {
		this.clazz = clazz;
	}

	public List<Paper> getPapers() {
		return papers;
	}

	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}

	@Autowired
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}
	
}
