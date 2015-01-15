package com.ruanku.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import antlr.collections.List;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.Collection;
import com.ruanku.model.Comment;
import com.ruanku.service.CollectionService;
import com.ruanku.service.CommentService;

@SuppressWarnings("serial")
public class CommentAction  extends ActionSupport{

	private int id;
	private int userid;
	private int newsid;
	private String content;
	private String createtime;
	private String state;
	
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
	
	public String getState() {
		return state;
	}
	
	public void setState(String state) {
		this.state = state;
	}
}
