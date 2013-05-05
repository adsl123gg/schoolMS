package com.eason.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Class;
import com.eason.pojo.Teacher;

@Repository
public class TeacherDao extends BaseDao<Teacher, String>{

	public Teacher findByNameAndPasswd(String username, String passwd) {
		String hql = "from Teacher where username = ? and passwd=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, passwd);
		return (Teacher) query.uniqueResult();
	}

	
}
