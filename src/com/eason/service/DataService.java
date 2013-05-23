package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.AdminDao;
import com.eason.dao.DataDao;
import com.eason.dao.UserDao;
import com.eason.pojo.Admin;
import com.eason.pojo.Data;
import com.eason.pojo.User;

@Service
@Transactional
public class DataService {

	private DataDao dataDao;

	@Autowired
	public void setDataDao(DataDao dataDao) {
		this.dataDao = dataDao;
	}
	
	public void save(Data data){
		dataDao.save(data);
	}
	
	public void del(Data data){
		dataDao.save(data);
	}
	
	public List<Data> findAll(){
		return dataDao.findAll();
	}

	public String findNameBySavename(String fileName) {
		return dataDao.findNameBySavename(fileName);
	}
	
}
