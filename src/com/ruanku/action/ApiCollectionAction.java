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
public class ApiCollectionAction extends ActionSupport{

	private Map<String,Object> jsonData;
	private int id;
	private int userid;
	private int newsid;
	private String username;
	private String newstitle;
	
	public String execute() throws Exception{
		return "json";
	}
	
	public String addCollection(){
		jsonData = new HashMap<String,Object>();
		CollectionService collectionService = new CollectionService();
		Collection collection = new Collection();
		collection.setNewstitle(newstitle);
		collection.setUsername(username);
		
		if(collectionService.addCollection(collection)){
			jsonData.put("code", "0");
		}
		else{
			jsonData.put("code","-1");
		}
		
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
	
	public Map<String,Object> getJsonData(){return jsonData; }
}
