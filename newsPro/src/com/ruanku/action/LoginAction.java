package com.ruanku.action;

import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.User;
import com.ruanku.service.UserService;


@SuppressWarnings("serial")
public class LoginAction extends ActionSupport{
	
	private String username;
	private String password;
	private String headimg;
	private Map<String,Object> jsonData;
	
	public String getUsername(){ return username; }
	
	public void setUsername(String name){ username = name; }
	
	public String getPassword(){ return password; }
	
	public void setPassword(String pass){ password = pass; }
	
	public Map<String,Object> getJsonData(){return jsonData; }
	
	
	public String execute() throws Exception {
		return "json";
	}
	
	
	public String AJAXlogin(){
		jsonData = new HashMap<String,Object>();
		UserService userService = new UserService();
		User user = userService.login(username, password);
		if( user !=null){
			jsonData.put("code", "0");
			jsonData.put("type", "10");
			jsonData.put("username", username);
//			jsonData.put("headimg", user.getHeadimg());
//			headimg =user.getHeadimg();
			ActionContext.getContext().getSession().put("username", username);
<<<<<<< HEAD
			ActionContext.getContext().getSession().put("headimg",headimg);
=======
			ActionContext.getContext().getSession().put("headimg",  user.getHeadimg());
>>>>>>> bd823c8b55cc26a9e02c8edcbbb993e62c45f6c1
		}
		else{
			jsonData.put("code","-1");
		}
		return SUCCESS;
	}
	
//	public String AJAXloginAdmin(){
//		jsonData = new HashMap<String,Object>();
//		System.out.println("ajax login admin start");
//		UserService userService = new UserService();
//		if(userService.loginAdmin(username, password)){
//			jsonData.put("code","0");
//			jsonData.put("type", "0");
//			jsonData.put("username", username);
//			ActionContext.getContext().getSession().put("username", username);
//		}
//		else{
//			jsonData.put("code","-1");
//		}
//		return SUCCESS;
//
//	}
	
	public String AJAXlogout(){
		jsonData = new HashMap<String,Object>();
		String name =(String) ActionContext.getContext().getSession().get("username");
		System.out.println(name);
		System.out.println(username);
		if(name.equals(username)){
			jsonData.put("code", "0");
			ActionContext.getContext().getSession().remove("username");
			ActionContext.getContext().getSession().remove("headimg");
		}
		else{
			jsonData.put("code","-1");
		}
		return SUCCESS;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

}
