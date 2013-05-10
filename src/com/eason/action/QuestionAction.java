package com.eason.action;


import java.io.PrintWriter;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Paper;
import com.eason.pojo.Question;
import com.eason.service.PaperService;
import com.eason.service.QuestionService;
import com.eason.utility.Time;

public class QuestionAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private QuestionService questionService;
	private PaperService paperService;
	
	private Question question;

	private String paperid;
	private String questionid;
	private String code;
	
	@Action(value="addQuestion",results={@Result(type="redirectAction",params={"actionName","teacherPaperInfo","code","${code}","paperid","${paperid}"})})
	public String addQuestion(){
		question.setCreatetime(Time.getTime());
		question.setAnswers(question.getAnswers().replaceAll("&&$", ""));
		question.setPaper(paperService.findById(((Paper)session.get("paper")).getId()));
		paperid=((Paper)session.get("paper")).getId();
		
		try {
			questionService.save(question);
		} catch (Exception e) {
			e.printStackTrace();
			setCode(ADDQUESTION_FAIL);
			return SUCCESS;
		}
		setCode(ADDQUESTION_SUCCESS);
		return SUCCESS;
	}
	
	
	@Action(value="updateQuestion",results={@Result(type="redirectAction",params={"actionName","teacherPaperInfo","code","${code}","paperid","${paperid}"})})
	public String updateQuestion(){
		paperid=((Paper)session.get("paper")).getId();
		try {
			Question q=questionService.findById(questionid);
			q.setAnswers(question.getAnswers().replaceAll("&&$", ""));
			q.setQuestion(question.getQuestion());
			q.setRightAnswer(question.getRightAnswer());
			q.setScore(question.getScore());
			
			questionService.save(q);
		} catch (Exception e) {
			e.printStackTrace();
			setCode(UPDATEQUESTION_FAIL);
			return SUCCESS;
		}
		
		setCode(UPDATEQUESTION_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="deleteQuestion")
	public void deleteQuestion(){
		question=questionService.findById(questionid);
		
		PrintWriter writer=getWriter();
		
		try {
			questionService.del(question);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			question=questionService.findById(questionid);
			if (null==question) {
				writer.print(DELQUESTION_SUCCESS);
			}else {
				writer.print(DELQUESTION_FAIL);
			}
		}

		closeWriter(writer);
	}

	@Autowired
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}


	public Question getQuestion() {
		return question;
	}


	public void setQuestion(Question question) {
		this.question = question;
	}


	public String getPaperid() {
		return paperid;
	}


	public void setPaperid(String paperid) {
		this.paperid = paperid;
	}


	@Autowired
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getQuestionid() {
		return questionid;
	}

	public void setQuestionid(String questionid) {
		this.questionid = questionid;
	}
	
}
