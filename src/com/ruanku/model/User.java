package com.ruanku.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;




@Entity
@Table(name="User")
public class User implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -492057020136677760L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO) 
	private int id;//int 11
	
	@Column(name="username") 
	private String username;//varchar 20
	
	@Column(name="password") 
	private String password;//varchar 20
	
	@Column(name="sex") 
	private String sex;//char 1
	
	@Column(name="phone") 
	private String phone;//varchar 11
	
	@Column(name="type")
	private int type; //tinyint 3
	
	@Column(name="headimg")
	private String headimg;
	
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
	
	
}
