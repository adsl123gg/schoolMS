package com.eason.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.AdminDao;
import com.eason.pojo.Admin;

@Service
@Transactional
public class AdminService {

	private AdminDao adminDao;

	public Admin findByNameAndPasswd(String username, String passwd) {
		return adminDao.findByNameAndPasswd(username, passwd);
	}

	@Autowired
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}

	public void save(Admin a) {
		adminDao.save(a);
	}
	
}
