package com.eason.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;

import com.eason.pojo.Course;
import com.eason.pojo.Exam;
import com.eason.pojo.Question;
import com.eason.pojo.Score;
import com.eason.pojo.Student;
import com.eason.service.ClassService;
import com.eason.service.CourseService;
import com.eason.service.QuestionService;
import com.eason.service.ScoreService;
import com.eason.service.StudentService;
import com.eason.utility.Time;

public class StudentAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	private StudentService studentService;
	private ClassService classService;
	private QuestionService questionService;
	private ScoreService scoreService;
	private CourseService courseService;
	
	private String oldpasswd;
	private String newPwd;
	private String newPwd2;
	private String code;
	private String answers;
	private String courseid;
	
	private Set<Course> studentCourses;
	private List<Exam> exams;
	private Set<Score> scores;
	
	@Action(value="studentInfo",results={@Result(location="/WEB-INF/content/student_info.jsp")})
	public String execute() throws Exception {
		return SUCCESS;
	}
	
	@Action(value="studentCourse",results={@Result(location="/WEB-INF/content/student_course.jsp")})
	public String studentInfo() throws Exception {
		
		Student student=(Student) session.get("student");
		
		studentCourses=classService.findById(student.getClazz().getId()).getCourseSet();
		return SUCCESS;
	}
	
	@Action(value="studentScore",results={@Result(location="/WEB-INF/content/student_score.jsp")})
	public String studentScore() throws Exception {
		
		Student student=(Student) session.get("student");
		student=studentService.findById(student.getId());
		
		scores=student.getScoreSet();
		
		return SUCCESS;
	}
	
	@Action(value="studentExit",results={@Result(type="redirectAction",params={"actionName","index"})})
	public String studentExit() throws Exception {
		session.clear();
		return SUCCESS;
	}
	
	
	@Action(value="studentExamList",results={@Result(location="/WEB-INF/content/student_exam_list.jsp")})
	public String studentExamList() throws Exception {
		
		Student student=(Student) session.get("student");
		student=studentService.findById(student.getId());
		
		exams=new ArrayList<Exam>();
		for (Course c : student.getClazz().getCourseSet()) {
			for (Exam e : c.getExamSet()) {
				exams.add(e);
			}
		}
		
		return SUCCESS;
	}
	
	
	@Action(value="studentSubmitPaper",results={@Result(type="redirectAction",params={"actionName","studentScore"})})
	public String studentSubmitPaper() throws Exception {
		
		float s=0;
		String[] bs=answers.split("&&");
		for (String string : bs) {
			if (!"".equals(string)) {
				String[] b=string.split("%%");
				Question question=questionService.findById(b[0]);
				if (b[1].equals(question.getRightAnswer())) {
					s+=question.getScore();
				}
			}
		}
		
		Student student=(Student) session.get("student");
		student=studentService.findById(student.getId());
		Course course=courseService.findById(courseid);
		
		Score score=new Score();
		score.setCourse(course);
		score.setCreatetime(Time.getTime());
		score.setScore(s);
		score.setStudent(student);
		score.setState("Õý³£");
		
		scoreService.save(score);
		
		return SUCCESS;
	}
	
	
	@Action(value="stuChangePWD",results={@Result(type="redirectAction",params={"actionName","studentInfo","code","${code}"})})
	public String stuChangePWD() throws Exception {
		Student student=(Student)session.get("student");
		if (student.getPasswd().equals(oldpasswd)) {
			if (newPwd.equals(newPwd2)) {
				student.setPasswd(newPwd);
				studentService.save(student);
				code="t";
			}else {
				code="f";
			}
		}else {
			code="f";
		}
		return SUCCESS;
	}

	public String getOldpasswd() {
		return oldpasswd;
	}

	public void setOldpasswd(String oldpasswd) {
		this.oldpasswd = oldpasswd;
	}

	public String getNewPwd() {
		return newPwd;
	}

	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}

	public String getNewPwd2() {
		return newPwd2;
	}

	public void setNewPwd2(String newPwd2) {
		this.newPwd2 = newPwd2;
	}

	@Autowired
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Set<Course> getStudentCourses() {
		return studentCourses;
	}

	public void setStudentCourses(Set<Course> studentCourses) {
		this.studentCourses = studentCourses;
	}

	@Autowired
	public void setClassService(ClassService classService) {
		this.classService = classService;
	}

	public List<Exam> getExams() {
		return exams;
	}

	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}

	public String getAnswers() {
		return answers;
	}

	public void setAnswers(String answers) {
		this.answers = answers;
	}

	@Autowired
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	
	@Autowired
	public void setScoreService(ScoreService scoreService) {
		this.scoreService = scoreService;
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

	public Set<Score> getScores() {
		return scores;
	}

	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}
	
}
