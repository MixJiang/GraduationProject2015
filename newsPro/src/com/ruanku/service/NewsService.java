package com.ruanku.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

//import antlr.collections.List;

import com.ruanku.model.News;


public class NewsService {
	
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
	
	public boolean createNews(News news){
		session = sf.openSession();
		session.beginTransaction();
		System.out.println(news.toString());
		session.save(news);
		session.getTransaction().commit();
		session.close();
		return true;
	}
	public List<News> findNewsByType(int type){
		session = sf.openSession();
		session.beginTransaction();
		Query q;
		if(type == 0){
			//获取所有数据
			q = session.createQuery("select n from News n");
		}
		else{
			String qstr = "select n from News n where n.type=:type";
		    q = session.createQuery(qstr);
			q.setParameter("type", type);
		}
		
		
		return (List<News>) q.list();
	}
    

}
