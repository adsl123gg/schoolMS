package com.eason.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Admin;
import com.eason.pojo.Class;
import com.eason.pojo.Course;
import com.eason.pojo.Data;
import com.eason.pojo.Student;
import com.eason.pojo.User;

@Repository
public class DataDao extends BaseDao<Data, String>{

	public String findNameBySavename(String fileName) {
		String hql = "from Data where savename=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, fileName);
		return ((Data)query.uniqueResult()).getFilename();
	}

	
}
