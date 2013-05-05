package com.eason.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Admin;
import com.eason.pojo.Class;
import com.eason.pojo.Student;

@Repository
public class AdminDao extends BaseDao<Admin, String>{

	public Admin findByNameAndPasswd(String username, String passwd) {
		String hql = "from Admin where username = ? and passwd=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, passwd);
		return (Admin) query.uniqueResult();
	}

	
	
	
}
