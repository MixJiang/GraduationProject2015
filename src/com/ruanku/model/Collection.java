package com.ruanku.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name="Collection")
public class Collection implements Serializable{



	/**
	 * 
	 */
	private static final long serialVersionUID = 3992986044553066648L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) 
	private int id;
	
	@Column(name="userid") 
	private int userid;
	
	@Column(name="newsid") 
	private int newsid;
	
	@Column(name="username") 
	private String username;
	
	@Column(name="newstitle") 
	private String newstitle;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getNewsid() {
		return newsid;
	}

	public void setNewsid(int newsid) {
		this.newsid = newsid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getNewstitle() {
		return newstitle;
	}

	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}
	
	
	
}
