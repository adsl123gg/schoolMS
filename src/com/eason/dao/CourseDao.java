package com.eason.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Course;
import com.eason.pojo.Student;

@Repository
public class CourseDao extends BaseDao<Course, String>{

	public List<Course> findByTeacherID(String teacherid) {
		String hql = "from Course where teacher.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, teacherid);
		return (List<Course>)query.list();
	}

}
