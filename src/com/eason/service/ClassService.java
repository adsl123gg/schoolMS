package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.ClassDao;
import com.eason.pojo.Class;

@Service
@Transactional
public class ClassService {
	
	private ClassDao classDao;

	public void save(Class clazz) {
		classDao.save(clazz);
	}

	@Autowired
	public void setClassDao(ClassDao classDao) {
		this.classDao = classDao;
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


}
