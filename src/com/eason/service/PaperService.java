package com.eason.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.eason.dao.PaperDao;
import com.eason.pojo.Paper;

@Service
@Transactional
public class PaperService {

	private PaperDao paperDao;

	@Autowired
	public void setPaperDao(PaperDao paperDao) {
		this.paperDao = paperDao;
	}

	public void save(Paper paper) {
		paperDao.save(paper);
	}

	public List<Paper> findByTeacherId(String id) {
		return paperDao.findByTeacherId(id);
	}

	public Paper findById(String id) {
		return paperDao.findById(id);
	}

	public void del(String paperid) {
		paperDao.del(paperid);
	}

	public List<Paper> findSubmit() {
		return paperDao.findSubmit();
	}
	
	
}
