package com.ruanku.action;

import java.util.HashMap;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.User;
import com.ruanku.service.UserService;

@SuppressWarnings("serial")
public class ApiUserAction  extends ActionSupport{
	private String username;
	private String password;
	private String newpassword;
	private String sex;
	private String phone;
	private String headimg;
	private int type;
	private Map<String,Object> jsonData;
	
	public String execute() throws Exception{
		return "json";
	}
	
	public String getUserinfo(){
		jsonData = new HashMap<String,Object>();
		UserService userService = new UserService();
		User u = userService.getUserinfo(username);
		if(u == null){
			jsonData.put("code", "-1");
		}
		else{
			u.setPassword("");//
			jsonData.put("code", "0");
			jsonData.put("user", u);
			ActionContext.getContext().getSession().put("username", username);
		}
		
		return SUCCESS;
	}
	
	public String getAllUserinfo(){
		
		return SUCCESS;
	}
	
	public String modifyUserinfo(){
		User user =new User();
		user.setHeadimg(headimg);
		user.setSex(sex);
		user.setPhone(phone);
		user.setUsername(username);
		System.out.println(user);
		UserService userService = new UserService();
		userService.modifyUserinfo(user);
		
		jsonData = new HashMap<String,Object>();
		if(userService.modifyUserinfo(user) == true){
			jsonData.put("code", "0");
		}
		else{
			jsonData.put("code", "1");
		}
		return SUCCESS;
	}
	public String modifyPassword(){
		jsonData = new HashMap<String,Object>();
		UserService userService = new UserService();
		if(userService.login(username, password)){
			userService.modifyPassword(username,newpassword);
			jsonData.put("code", "0");
		}
		else{
			jsonData.put("code", "-1");
		}
		return SUCCESS;
	}
	public String findUsername(){
		
		return SUCCESS;
	}
	
	
	
	

	public Map<String,Object> getJsonData(){return jsonData; }

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}
    public String getUsername(){ return username; }
	
	public void setUsername(String name){ username = name; }
	
	public String getPassword(){ return password; }
	
	public void setPassword(String pass){ password = pass; }
    
	public String getSex(){ return sex; }
	
	public void setSex(String sex){ this.sex = sex; }
	
	public String getPhone(){ return phone; }
	
	public void setPhone(String phone){ this.phone = phone; }
	
    public String getHeadimg(){ return headimg; }
	
	public void setHeadimg(String img){ headimg = img; }
	
	public void setNewpassword(String img){ headimg = img; }

}
