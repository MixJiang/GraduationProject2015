package com.ruanku.action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.service.UserService;

@SuppressWarnings("serial")
public class RegisterAction  extends ActionSupport{
	private String username;
	private String password;
	private Map<String,Object> jsonData;
	
	public String getUsername(){ return username; }
	
	public void setUsername(String name){ username = name; }
	
	public String getPassword(){ return password; }
	
	public void setPassword(String pass){ password = pass; }
	
	public Map<String,Object> getJsonData(){return jsonData; }
	
	public String execute() throws Exception{
		return "json";
	}
	
	public String AJAXregister(){
		jsonData = new HashMap<String,Object>();
		UserService userService = new UserService();
		if(userService.register(username, password)){
			jsonData.put("code", 0);
			jsonData.put("type", 10);
			jsonData.put("username", username);
			ActionContext.getContext().getSession().put("username", username);
		}
		else{
			jsonData.put("code", "-1");
		}
		
		return SUCCESS;
	}
}
