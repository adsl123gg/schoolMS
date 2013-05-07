package com.eason.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.ClassDao;
import com.eason.dao.CourseDao;
import com.eason.dao.TeacherDao;
import com.eason.pojo.Class;
import com.eason.pojo.Course;

@Service
@Transactional
public class ClassService {
	
	private ClassDao classDao;
	private CourseDao courseDao;

	public void save(Class clazz) {
		classDao.save(clazz);
	}

	@Autowired
	public void setClassDao(ClassDao classDao) {
		this.classDao = classDao;
	}
	
	@Autowired
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}

	public Class findById(String id) {
		return classDao.findById(id);
	}

	public List<Class> findAll() {
		return classDao.findAll();
	}

	public void del(Class c) {
		classDao.del(c);
	}

	public Set<Class> findByTeacherId(String id) {
		Set<Class> rs=new HashSet<Class>();
		for (Course cou : courseDao.findByTeacherID(id)) {
			for (Class cla : cou.getClassSet()) {
				rs.add(cla);
			}
		}
		return rs;
	}


}
