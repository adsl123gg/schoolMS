package com.eason.dao;


import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.User;

@Repository
public class UserDao extends BaseDao<User, String>{

	public User findByIdentity(String id) {
		System.out.println(id+"====================");
		String hql = "from User where identity_id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, id);
		return (User) query.uniqueResult();
	}

	
}
