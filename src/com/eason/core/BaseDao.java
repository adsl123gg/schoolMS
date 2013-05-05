package com.eason.core;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;


public class BaseDao<T,PK extends Serializable> {
	
	private SessionFactory sessionFactory;
	private Class<?> clazz;
	
	public BaseDao() {
		ParameterizedType t = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] types = t.getActualTypeArguments();
		clazz = (Class<?>) types[0];
	}
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public void save(T t) {
		getSession().saveOrUpdate(t);
	}
	
	public void del(T t) {
		getSession().delete(t);
	}
	
	@SuppressWarnings("unchecked")
	public T findById(PK id) {
		return (T) getSession().get(clazz, id);
	}
	
	public void del(PK id) {
		getSession().delete(findById(id));
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		Criteria cir = getSession().createCriteria(clazz);
		return cir.list();
	}
	
	
}
