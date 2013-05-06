package com.eason.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Course;
import com.eason.pojo.Teacher;
import com.eason.service.CourseService;
import com.eason.service.TeacherService;
import com.eason.utility.Time;
import com.eason.utility.Utility;

public class CourseAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private CourseService courseService;
	private TeacherService teacherService;
	private Course course;
	private String teacherid;
	
	private String code;
	private String courseid;

	@Action(value="addCourse",results={@Result(name="success",type="redirectAction",params={"actionName","adminCourse","code","${code}"})})
	public String addCourse(){
		
		Teacher t=teacherService.findById(teacherid);
		course.setCreatetime(Time.getTime());
		course.setTeacher(t);
		
		course.setTime(Utility.dealCourseTime(course.getTime()));
		
		try {
			courseService.save(course);
		} catch (Exception e) {
			e.printStackTrace();
			setCode(ADDCOURSE_FAIL);
			return SUCCESS;
		}
		setCode(ADDCOURSE_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="updateCourse",results={@Result(name="success",type="redirectAction",params={"actionName","adminCourse","code","${code}"})})
	public String updateCourse(){
		
		Teacher t=teacherService.findById(teacherid);
		//course.setCreatetime(Time.getTime());
		Course c=courseService.findById(courseid);
		c.setAddress(course.getAddress());
		c.setCoursename(course.getCoursename());
		c.setCredit(course.getCredit());
		c.setProperty(course.getProperty());
		c.setTeacher(t);
		//c.setTime(course.getTime());
		
		System.out.println(course.getTime());
		
		c.setTime(Utility.dealCourseTime(course.getTime()));
		
		try {
			courseService.save(c);
		} catch (Exception e) {
			e.printStackTrace();
			setCode(UPDATECOURSE_FAIL);
			return SUCCESS;
		}
		setCode(UPDATECOURSE_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="deleteCourse")
	public void deleteCourse(){
		PrintWriter writer=null;
		try {
			writer = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		course=courseService.findById(courseid);
		
		try {
			courseService.del(course);
		} catch (Exception e) {
			e.printStackTrace();
			writer.print(DELETECOURSE_FAIL);
		}finally{
			course=courseService.findById(courseid);
			if (course!=null) {
				writer.print(DELETECOURSE_FAIL);
			}else {
				writer.print(DELETECOURSE_SUCCESS);
			}
			
		}
		
	}

	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	
}
