package com.ruanku.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name="Comment")
public class Comment implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1247493680367560152L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) 
	private int id;
	
	@Column(name="userid") 
	private int userid;
	
	@Column(name="username") 
	private String username;
	
	@Column(name="newsid") 
	private int newsid;
	
	@Column(name="newstitle") 
	private String newstitle;
	
	@Column(name="content") 
	private String content;
	
	@Column(name="createtime") 
	private String createtime;
	
	@Column(name="state") 
	private int state;
	

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getNewstitle() {
		return newstitle;
	}

	public void setNewstitle(String newstitle) {
		this.newstitle = newstitle;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	
	
	
	
}
