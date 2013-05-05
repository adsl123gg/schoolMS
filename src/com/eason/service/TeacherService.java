package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.TeacherDao;
import com.eason.pojo.Teacher;

@Service
@Transactional
public class TeacherService {
	
	private TeacherDao teacherDao;

	@Autowired
	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	public Teacher findByNameAndPasswd(String username, String passwd) {
		return teacherDao.findByNameAndPasswd(username,passwd);
	}

	public void save(Teacher t) {
		teacherDao.save(t);
	}

	public List<Teacher> findAll() {
		return teacherDao.findAll();
	}

	public Teacher findById(String id) {
		return teacherDao.findById(id);
	}

	public void del(Teacher teacher) {
		teacherDao.del(teacher);
		
	}

}
