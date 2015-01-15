package com.ruanku.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name="News")
public class News implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4118993536465042703L;


	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) 
	private int id;//int 11
	
	@Column(name="title") 
	private String title;

	@Column(name="content") 
	private String content;
	
	@Column(name="createtime") 
	private String createtime;
	
	@Column(name="author") 
	private String author;
	
	@Column(name="imgUrl") 
	private String imgUrl;
	
	@Column(name="type")
	/*
	 * 1:娱乐
	 * 2:科技
	 * 3:军事
	 * */
	private int type;
	
	@Column(name="state") 
	private int state;
	
	@Column(name="click") 
	private int click;

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
