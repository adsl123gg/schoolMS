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
import com.eason.pojo.Student;
import com.eason.pojo.Teacher;
import com.eason.service.AdminService;
import com.eason.service.CourseService;
import com.eason.service.ExamService;
import com.eason.service.PaperService;
import com.eason.service.StudentService;
import com.eason.service.TeacherService;
import com.eason.utility.Time;

public class ExamAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private ExamService examService;
	private CourseService courseService;
	private PaperService paperService;
	
	private List<Paper> papers;
	private Exam exam;
	private Course course;
	private Paper paper;
	
	private String courseid;
	private String paperid;
	private String examid;
	private String code;
	
	@Action(value="toAddExam",results={
			@Result(name="toadd",location="/WEB-INF/content/admin_add_exam.jsp"),
			@Result(name="add",location="/WEB-INF/content/admin_course_exam.jsp")
			})
	public String toAddExam(){
		course=courseService.findById(courseid);
		if (course.getExamSet()!=null&&course.getExamSet().size()==1) {
			for (Exam e : course.getExamSet()) {
				exam=e;
			}
			return "add";
		}
		
		papers=paperService.findVerify();
		return "toadd";
	}
	
	@Action(value="addExam",results={@Result(type="redirectAction",params={"actionName","toAddExam","courseid","${courseid}","code","${code}"})})
	public String addExam(){
		try {
			Paper paper=paperService.findById(paperid);
			course=courseService.findById(courseid);
			
			exam.setCourse(course);
			exam.setPaper(paper);
			exam.setCreatetime(Time.getTime());
			
			examService.save(exam);
		} catch (Exception e) {
			e.printStackTrace();
			setCode(ADDEXAM_FAIL);
			return SUCCESS;
		}
		
		setCode(ADDEXAM_SUCCESS);
		return SUCCESS;
	}
	
	@Action(value="verifyExam")
	public void verifyExam(){
		PrintWriter writer=getWriter();
		
		exam=examService.findById(examid);
		String rs=Time.isInExamTime(exam.getStarttime(), Integer.valueOf(exam.getLengthoftime()));
		writer.write(rs);
		closeWriter(writer);
	}
	
	
	@Action(value="countdown")
	public void countdown(){
		PrintWriter writer=getWriter();
		
		exam=examService.findById(examid);
		String rs=Time.isInExamTime(exam.getStarttime(), Integer.valueOf(exam.getLengthoftime()));
		if ("ok".equals(rs)) {
			int minute=Time.getCountDown(exam.getStarttime(), Integer.valueOf(exam.getLengthoftime()));
			if (minute>0) {
				writer.write(minute+"");
			}else {
				writer.write("timeout");
			}
		}else{
			writer.write("timeout");
		}
		
		closeWriter(writer);
	}
	
	@Action(value="studentExamPaper",results={@Result(location="/WEB-INF/content/student_exam_paper.jsp")})
	public String studentExamPaper() throws Exception {
		exam=examService.findById(examid);
		paper=exam.getPaper();
		return SUCCESS;
	}
	
	@Autowired
	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	public String getCourseid() {
		return courseid;
	}

	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}

	@Autowired
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Paper> getPapers() {
		return papers;
	}

	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}

	@Autowired
	public void setPaperService(PaperService paperService) {
		this.paperService = paperService;
	}


	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	public String getPaperid() {
		return paperid;
	}

	public void setPaperid(String paperid) {
		this.paperid = paperid;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getExamid() {
		return examid;
	}

	public void setExamid(String examid) {
		this.examid = examid;
	}

	public Paper getPaper() {
		return paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
}
