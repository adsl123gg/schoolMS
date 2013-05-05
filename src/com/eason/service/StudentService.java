package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.StudentDao;
import com.eason.pojo.Student;

@Service
@Transactional
public class StudentService {

	private StudentDao studentDao;
	
	public List<Student> findAll() {
		return studentDao.findAll();
	}
	
	public void save(Student student) {
		studentDao.save(student);
		
	}
	
	@Autowired
	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	public Student findByNameAndPasswd(String username, String passwd) {
		return studentDao.findByNameAndPasswd(username,passwd);
	}

	public List<Student> findByClass(String classid) {
		return studentDao.findByClass(classid);
	}

	public Student findById(String id) {
		return studentDao.findById(id);
	}

	public void del(Student student) {
		studentDao.del(student);
	}

}
