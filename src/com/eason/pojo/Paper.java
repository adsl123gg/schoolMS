package com.eason.pojo;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.OrderBy;

@Entity
@Table(name="paper")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Paper {

	private String id;
	private String name;
	private String state;
	private String createtime;
	private Teacher teacher;
	private Set<Question> questionSet;
	private Set<Exam> examSet;
	
	@Id
	@GenericGenerator(name="uuid", strategy="uuid") 
	@GeneratedValue(generator="uuid") 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	@ManyToOne
	@JoinColumn(name="teacher_id")
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	
	@OneToMany(mappedBy="paper",cascade={CascadeType.REMOVE})
	@javax.persistence.OrderBy("createtime asc")
	public Set<Question> getQuestionSet() {
		return questionSet;
	}
	public void setQuestionSet(Set<Question> questionSet) {
		this.questionSet = questionSet;
	}
	@OneToMany(mappedBy="paper",cascade={CascadeType.REMOVE})
	public Set<Exam> getExamSet() {
		return examSet;
	}
	public void setExamSet(Set<Exam> examSet) {
		this.examSet = examSet;
	}
	
}
