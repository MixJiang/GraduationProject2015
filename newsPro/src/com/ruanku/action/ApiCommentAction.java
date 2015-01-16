package com.ruanku.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import antlr.collections.List;

import com.opensymphony.xwork2.ActionSupport;
import com.ruanku.model.Collection;
import com.ruanku.model.Comment;
import com.ruanku.model.News;
import com.ruanku.model.User;
import com.ruanku.service.CollectionService;
import com.ruanku.service.CommentService;
import com.ruanku.service.NewsService;
import com.ruanku.service.UserService;

@SuppressWarnings("serial")
public class ApiCommentAction  extends ActionSupport{

	private Map<String,Object> jsonData;
	private int id;
	private int userid;
	private String username;
	private int newsid;
	private String newstitle;
	private String content;
	private String createtime;
	private int state;
	
	public String execute() throws Exception{
		return "json";
	}
	public String findCommentByNewsid(){
		CommentService cmtService =new CommentService();
		List<Comment> list=cmtService.findCommentByNewsid(newsid);
		jsonData = new HashMap<String,Object>();
		jsonData.put("code", "0");
		jsonData.put("list", list);
		return SUCCESS;
	}
	public String addComment(){
		jsonData = new HashMap<String,Object>();
		CommentService commentService = new CommentService();
		Comment comment = new Comment();
		
		comment.setContent(content);
		comment.setState(0);
		comment.setCreatetime(createtime);
		comment.setNewsid(newsid);
		comment.setNewstitle(newstitle);
		if(username == "null"){
			comment.setUserid(-1);
			comment.setUsername("匿名网友");
		}
		else{
			UserService us=new UserService();
			User user = us.getUserinfo(username);
			if(user == null){
				comment.setUserid(-1);
				comment.setUsername("匿名网友");
			}
			else{
				comment.setUserid(user.getId());
				comment.setUsername(username);
			}
		}
		
		if(commentService.addComment(comment)){
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
	
	public int getState() {
		return state;
	}
	
	public void setState(int state) {
		this.state = state;
	}
	
	public Map<String,Object> getJsonData(){return jsonData; }
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getNewstitle() {
		return newstitle;
	}
	public void setNewstitle(String title) {
		this.newstitle = title;
	}
}
