package com.eason.pojo;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="course")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Course {

	private String id;
	private String coursename;
	private String time;
	private String address;
	private String credit;
	private String property;
	private String createtime;
	private Teacher teacher;
	private Set<Class> classSet;
	
	@Id
	@GenericGenerator(name="uuid", strategy="uuid") 
	@GeneratedValue(generator="uuid") 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCoursename() {
		return coursename;
	}
	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getProperty() {
		return property;
	}
	public void setProperty(String property) {
		this.property = property;
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
	
	@ManyToMany(cascade={CascadeType.REMOVE})
	@JoinTable(name="class_course",
				joinColumns=@JoinColumn(name="course_id"),
				inverseJoinColumns=@JoinColumn(name="class_id")
			)
	public Set<Class> getClassSet() {
		return classSet;
	}
	public void setClassSet(Set<Class> classSet) {
		this.classSet = classSet;
	}
	
}
