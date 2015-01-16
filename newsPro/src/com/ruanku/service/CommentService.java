package com.ruanku.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

import com.ruanku.model.Comment;
import com.ruanku.model.News;
import com.ruanku.model.User;


public class CommentService {
	
	private static SessionFactory sf = new  AnnotationConfiguration()
										.configure()
										.buildSessionFactory();
	private Session session;
	
	public boolean addComment(Comment cmt){
		session = sf.openSession();
		session.beginTransaction();
		System.out.println(cmt.toString());
		session.save(cmt);
		session.getTransaction().commit();
		session.close();
		return true;
	}
	
	public List<Comment> findCommentByNewsid(int id){
		session = sf.openSession();
		session.beginTransaction();
		Query q=session.createQuery("select c from Comment c where c.newsid =:id");;
		q.setParameter("id", id);
		return (List<Comment>) q.list();
	}
    

}
