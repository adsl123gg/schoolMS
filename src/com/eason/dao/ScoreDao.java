package com.eason.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.eason.core.BaseDao;
import com.eason.pojo.Score;
import com.eason.pojo.Student;

@Repository
public class ScoreDao extends BaseDao<Score, String>{

	public Score findByStudentAndCourse(String studentid, String courseid) {
		String hql = "from Score where student_id = ? and course_id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, studentid);
		query.setParameter(1, courseid);
		return (Score) query.uniqueResult();
	}


}
