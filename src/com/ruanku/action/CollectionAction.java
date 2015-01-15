package com.ruanku.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import antlr.collections.List;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.Collection;
import com.ruanku.model.News;
import com.ruanku.service.CollectionService;
import com.ruanku.service.NewsService;

@SuppressWarnings("serial")
public class CollectionAction extends ActionSupport{

	private int id;
	private int userid;
	private int newsid;
	private String username;
	private String newstitle;
	
	public String execute() throws Exception{
		return SUCCESS;
	}
	
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
