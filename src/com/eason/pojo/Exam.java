package com.eason.pojo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="exam")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Exam {

	private String id;
	private String starttime;
	private String lengthoftime;
	private String address;
	private String createtime;
	private Course course;
	private Paper paper;
	
	@Id
	@GenericGenerator(name="uuid", strategy="uuid") 
	@GeneratedValue(generator="uuid") 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getLengthoftime() {
		return lengthoftime;
	}
	public void setLengthoftime(String lengthoftime) {
		this.lengthoftime = lengthoftime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	@ManyToOne
	@JoinColumn(name="course_id")
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	@ManyToOne
	@JoinColumn(name="paper_id")
	public Paper getPaper() {
		return paper;
	}
	public void setPaper(Paper paper) {
		this.paper = paper;
	}
	
}
