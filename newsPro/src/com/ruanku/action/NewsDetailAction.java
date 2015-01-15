package com.ruanku.action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.service.UserService;

@SuppressWarnings("serial")
public class NewsDetailAction  extends ActionSupport{
	private int id;
	private String title;
	private String content;
	private String createtime;
	private String author;
	private String imgUrl;
	private int type;
	private int state;
	private int click; 
	public String execute() throws Exception{
		return "json";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
