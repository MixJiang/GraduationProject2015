package com.ruanku.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.News;
import com.ruanku.service.NewsService;


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
		NewsService ns =new NewsService();
		News news = ns.findNewsById(id);
		if(news == null){
			return ERROR;
		}
		this.setAllProperties(news);
		return SUCCESS;
	}
	
	private void setAllProperties(News news){
		id=news.getId();
		title=news.getTitle();
		content=news.getContent();
		createtime=news.getCreatetime();
		author=news.getAuthor();
		imgUrl=news.getImgUrl();
		type=news.getType();
		state=news.getState();
		click=news.getClick();
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
}
