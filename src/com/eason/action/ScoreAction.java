package com.eason.action;

import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.InterceptorRefs;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Admin;
import com.eason.pojo.Course;
import com.eason.pojo.Exam;
import com.eason.pojo.Paper;
import com.eason.pojo.Score;
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.service.AdminService;
import com.eason.service.CourseService;
import com.eason.service.ExamService;
import com.eason.service.PaperService;
import com.eason.service.ScoreService;
import com.eason.service.StudentService;
import com.eason.service.TeacherService;
import com.eason.utility.Time;

public class ScoreAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	private ExamService examService;
	private ScoreService scoreService;
	private StudentService studentService;
	
	private String examid;
	
	@Action(value="isSubmit")
	public void isSubmit() throws Exception {
		PrintWriter writer=getWriter();
		
		Student student=(Student) session.get("student");
		student=studentService.findById(student.getId());
		
		Exam exam=examService.findById(examid);
		Score s=scoreService.findByStudentAndCourse(student.getId(),exam.getCourse().getId());
		
		if (null==s) {
			writer.write("submit_no");
		}else {
			writer.write("submit_ok");
		}
		
		closeWriter(writer);
	}

	public String getExamid() {
		return examid;
	}

	public void setExamid(String examid) {
		this.examid = examid;
	}

	@Autowired
	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	@Autowired
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
	}

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
}
