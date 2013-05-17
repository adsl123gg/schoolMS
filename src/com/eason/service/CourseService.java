package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.AdminDao;
import com.eason.dao.CourseDao;
import com.eason.pojo.Admin;
import com.eason.pojo.Course;

@Service
@Transactional
public class CourseService {

	private CourseDao courseDao;

	@Autowired
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	public void save(Course course) {
		courseDao.save(course);
	}

	public List<Course> findAll() {
		return courseDao.findAll();
	}

	public Course findById(String courseid) {
		return courseDao.findById(courseid);
	}

	public void del(Course course) {
		courseDao.del(course);
	}

	public List<Course> findByTeacherID(String teacherid) {
		return courseDao.findByTeacherID(teacherid);
	}

	public void delCourse(String classid) {
		courseDao.delCourse(classid);
	}
	
	
}
