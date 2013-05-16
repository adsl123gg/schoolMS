package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.ExamDao;
import com.eason.dao.PaperDao;
import com.eason.dao.ScoreDao;
import com.eason.pojo.Exam;
import com.eason.pojo.Paper;
import com.eason.pojo.Score;

@Service
@Transactional
public class ScoreService {

	private ScoreDao scoreDao;

	@Autowired
	public void setScoreDao(ScoreDao scoreDao) {
		this.scoreDao = scoreDao;
	}

	public void save(Score score) {
		scoreDao.save(score);
	}

	public Score findByStudentAndCourse(String studentid, String courseid) {
		return scoreDao.findByStudentAndCourse(studentid,courseid);
	}
	
}
