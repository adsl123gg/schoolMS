package com.eason.dao;


import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Student;

@Repository
public class StudentDao extends BaseDao<Student, String>{

	public Student findByNameAndPasswd(String username, String passwd) {
		String hql = "from Student where username = ? and passwd=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, username);
		query.setParameter(1, passwd);
		return (Student) query.uniqueResult();
	}

	public List<Student> findByClass(String classid) {
		String hql = "from Student where class_id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, classid);
		return (List<Student>)query.list();
	}
	
}
