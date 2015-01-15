package com.ruanku.interceptot;

import java.util.Map;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.ruanku.model.User;
import com.ruanku.service.UserService;

public class LoginInterceptor extends AbstractInterceptor {

	
  @Override
  public String intercept(ActionInvocation invocation) throws Exception {

    // 取得请求相关的ActionContext实例
    ActionContext ctx = invocation.getInvocationContext();
    Map session = ctx.getSession();
    String user = (String) session.get("username");
   
    // 假设没有登陆
    if (user != null) {
      System.out.println("ok");
      return invocation.invoke();
    }

    ctx.put("tip", "你还没有登录");
    return Action.LOGIN;

  }

}