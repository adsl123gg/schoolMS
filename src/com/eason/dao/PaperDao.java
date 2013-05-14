package com.eason.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Course;
import com.eason.pojo.Paper;

@Repository
public class PaperDao extends BaseDao<Paper, String>{

	public List<Paper> findByTeacherId(String id) {
		String hql = "from Paper where teacher.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, id);
		return (List<Paper>)query.list();
	}

	public List<Paper> findSubmit() {
		String hql = "from Paper where state!='ÊÔ¾íÕýÔÚ±à¼­'";
		Query query = getSession().createQuery(hql);
		return (List<Paper>)query.list();
	}

}
