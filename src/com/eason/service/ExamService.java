package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.ExamDao;
import com.eason.dao.PaperDao;
import com.eason.pojo.Exam;
import com.eason.pojo.Paper;

@Service
@Transactional
public class ExamService {

	private ExamDao examDao;

	@Autowired
	public void setExamDao(ExamDao examDao) {
		this.examDao = examDao;
	}

	public void save(Exam exam) {
		examDao.save(exam);
	}

	public Exam findById(String id) {
		return examDao.findById(id);
	}
	
	
}
