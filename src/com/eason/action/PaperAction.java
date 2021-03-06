package com.eason.action;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Paper;
import com.eason.pojo.Teacher;
import com.eason.service.PaperService;
import com.eason.service.TeacherService;
import com.eason.utility.Time;

public class PaperAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private TeacherService teacherService;
	private PaperService paperService;
	
	private Paper paper;
	
	private String teacherid;
	private String paperid;
	private String code;
	
	@Action(value="addPaperName",results={@Result(type="redirectAction",params={"actionName","teacherPaperList","code","${code}"})})
	public String addPaperName(){
		
		Teacher t=teacherService.findById(teacherid);
		paper.setTeacher(t);
		paper.setCreatetime(Time.getTime());
		paper.setState(PAPER_EDIT);
		
		paperService.save(paper);
		setCode(ADDPAPER_SUCCESS);
		
		return SUCCESS;
	}
	
	@Action(value="updatePaperName",results={@Result(type="redirectAction",params={"actionName","teacherPaperList","code","${code}"})})
	public String updatePaperName(){
		
		Paper p=paperService.findById(paper.getId());
		p.setName(paper.getName());
		
		paperService.save(p);
		setCode(UPDATEPAPER_SUCCESS);
		
		return SUCCESS;
	}
	
	
	@Action(value="deletePaper",results={@Result(type="redirectAction",params={"actionName","teacherPaperList","code","${code}"})})
	public void deletePaper(){
		
		PrintWriter writer=getWriter();
		try {
			paperService.del(paperid);
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			Paper p=paperService.findById(paperid);
			if (p==null) {
				writer.print(DELPAPER_SUCCESS);
			}else {
				writer.print(DELPAPER_FAIL);
			}
			
		}
		
		closeWriter(writer);
	}
	
	
	@Action(value="teacherPaperInfo",results={
			@Result(name="success",location="/WEB-INF/content/teacher_paper_info.jsp"),
			@Result(name="submit",location="/WEB-INF/content/teacher_paper_info_submit.jsp")}
	)
	public String teacherPaperInfo() throws Exception {
		paper=paperService.findById(paperid);
		if (PAPER_EDIT.equals(paper.getState().trim())) {
			session.put("paper", paper);
			return SUCCESS;
		}else {
			return "submit";
		}
		
	}
	
	
	@Action(value="submitPaper")
	public void submitPaper() throws Exception {
		PrintWriter writer=getWriter();
		
		try {
			paper=paperService.findById(paperid);
			paper.setState(PAPER_SUBMIT);
			
			paperService.save(paper);
		} catch (Exception e) {
			e.printStackTrace();
			
			writer.print(PAPER_SUBMIT_FAIL);
			closeWriter(writer);
			return;
		}
		
		writer.print(PAPER_SUBMIT_SUCCESS);
		closeWriter(writer);
	}
	
	@Action(value="checkPaperSubmit")
	public void checkPaperSubmit() throws Exception {
		paper=paperService.findById(paperid);
		PrintWriter writer=getWriter();
		if (!PAPER_EDIT.equals(paper.getState())) {
			writer.write("true");
		}else {
			writer.write("false");
		}
		
		closeWriter(writer);
	}

	@Autowired
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	public String getTeacherid() {
		return teacherid;
	}

	public void setTeacherid(String teacherid) {
		this.teacherid = teacherid;
	}

	@Autowired
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPaperid() {
		return paperid;
	}

	public void setPaperid(String paperid) {
		this.paperid = paperid;
	}

	
}
