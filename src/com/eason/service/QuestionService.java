package com.eason.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.PaperDao;
import com.eason.dao.QuestionDao;
import com.eason.pojo.Question;

@Service
@Transactional
public class QuestionService {

	private QuestionDao questionDao;

	@Autowired
	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	public void save(Question question) {
		questionDao.save(question);
	}

	public Question findById(String questionid) {
		return questionDao.findById(questionid);
	}

	public void del(Question question) {
		questionDao.del(question);
	}
	
}
