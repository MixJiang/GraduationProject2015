package com.ruanku.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.ruanku.model.User;


public class CollectionService {
	
	private static SessionFactory sf = new  AnnotationConfiguration()
										.configure()
										.buildSessionFactory();
	private Session session;
	
	public boolean login(String username,String password){
		session = sf.openSession();
		session.beginTransaction();
		String qstr = "select u from User u where u.username = :name and u.password = :pass and type=10";
		Query q = session.createQuery(qstr);
		q.setParameter("name", username);
		q.setParameter("pass", password);
		if(q.list().size() == 1){
			return true;
		}
		session.close();
		return false;
	}
	
	public boolean loginAdmin(String username,String password){
		session = sf.openSession();
		session.beginTransaction();

		Query q = session.createQuery("select u from User u where u.username = :name and u.password = :pass and type=0");

		q.setParameter("name", username);
		q.setParameter("pass", password);
		if(q.list().size() == 1){
			return true;
		}
		session.close();
		return false;

	}
	
	public void register(String username,String password){
		User u = new User();
		u.setType(10);//默认为普通用户
		u.setUsername(username);
		u.setPassword(password);
		session = sf.openSession();
		session.beginTransaction();
		session.save(u);
		session.getTransaction().commit();
		session.close();
	}
    

}
