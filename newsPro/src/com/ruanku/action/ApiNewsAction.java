package com.ruanku.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import antlr.collections.List;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.News;
import com.ruanku.service.NewsService;

@SuppressWarnings("serial")
public class ApiNewsAction  extends ActionSupport{

	private Map<String,Object> jsonData;
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
	
	public String createNews(){
		jsonData = new HashMap<String,Object>();
		NewsService newsService = new NewsService();
		News news= new News();
		news.setTitle(title);
		news.setImgUrl(imgUrl);
		news.setAuthor(author);
		news.setContent(content);
		news.setClick(0);
		news.setState(0);
		news.setType(type);
		news.setCreatetime(createtime);
		
		if(newsService.createNews(news)){
			jsonData.put("code", "0");
		}
		else{
			jsonData.put("code","-1");
		}
		
		return SUCCESS;
	}
	
	public String findNewsByType(){
		NewsService newsService = new NewsService();
		List<News> list=newsService.findNewsByType(type);
		
		jsonData = new HashMap<String,Object>();
		jsonData.put("code", "0");
		jsonData.put("news", list);
		
		return SUCCESS;
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

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getClick() {
		return click;
	}

	public void setClick(int click) {
		this.click = click;
	}	
	
	public Map<String,Object> getJsonData(){return jsonData; }
}
