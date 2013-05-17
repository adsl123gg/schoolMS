package com.eason.pojo;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="class")
@Cache(usage=CacheConcurrencyStrategy.READ_WRITE)
public class Class {
	private String id;
	private String classname;
	private Set<Student> studentSet;
	private Set<Course> courseSet;
	
	@Id
	@GenericGenerator(name="uuid", strategy="uuid") 
	@GeneratedValue(generator="uuid") 
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	@OneToMany(mappedBy="clazz",cascade={CascadeType.REMOVE})
	public Set<Student> getStudentSet() {
		return studentSet;
	}
	public void setStudentSet(Set<Student> studentSet) {
		this.studentSet = studentSet;
	}
	
	private String createtime;
	
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	//@ManyToMany(mappedBy="classSet",cascade={CascadeType.REMOVE})
	@ManyToMany(cascade={CascadeType.REMOVE})
	@JoinTable(name="class_course",
				joinColumns=@JoinColumn(name="class_id"),
				inverseJoinColumns=@JoinColumn(name="course_id")
			)
	public Set<Course> getCourseSet() {
		return courseSet;
	}
	public void setCourseSet(Set<Course> courseSet) {
		this.courseSet = courseSet;
	}
	
}
