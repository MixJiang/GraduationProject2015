package com.ruanku.service;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.ruanku.model.User;


public class UserService {
	
	private static SessionFactory sf = new  AnnotationConfiguration()
										.configure()
										.buildSessionFactory();
	private Session session;
	
	public boolean login(String username,String password){
		session = sf.openSession();
		session.beginTransaction();
		String qstr = "select u from User u where u.username = :name and u.password = :pass and u.type=10";
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

		Query q = session.createQuery("select u from User u where u.username = :name and u.password = :pass and u.type=0");

		q.setParameter("name", username);
		q.setParameter("pass", password);
		if(q.list().size() == 1){
			return true;
		}
		session.close();
		return false;

	}
	
	public boolean register(String username,String password){
		
		if(this.getUserinfo(username) != null){
			return false;//
		}
		User u = new User();
		u.setType(10);//
		u.setUsername(username);
		u.setPassword(password);
		session = sf.openSession();
		session.beginTransaction();
		session.save(u);
		session.getTransaction().commit();
		session.close();
		
		return true;
	}
    
	public User getUserinfo(String username){
		session = sf.openSession();
		session.beginTransaction();
		String qstr = "select u from User u where u.username = :name";
		Query q = session.createQuery(qstr);
		q.setParameter("name", username);
		if(q.list().size() == 1){
			return (User)q.list().get(0);
		}
		session.close();
		return null;
	}
	public boolean modifyUserinfo(User user){
		session = sf.openSession();
		session.beginTransaction();
		String hqlstr="update User u set u.phone=:phone,u.headimg=:headimg,u.sex=:sex where u.username=:username";
		Query q = session.createQuery(hqlstr);
		q.setParameter("username", user.getUsername());
		q.setParameter("phone", user.getPhone());
		q.setParameter("headimg",user.getHeadimg());
		q.setParameter("sex",user.getSex());
		q.executeUpdate();
		session.getTransaction().commit();
		session.close();
		
		return true;
	}
	public boolean modifyPassword(String username,String newpassword){
		session = sf.openSession();
		session.beginTransaction();
		String hqlstr="update User u set u.password=:password where u.username=:username";
		Query q = session.createQuery(hqlstr);
		q.setParameter("username", username);
		q.setParameter("password", newpassword);
		q.executeUpdate();
		session.getTransaction().commit();
		session.close();
		return true;
	}
}
