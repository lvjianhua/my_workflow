package com.springmvc.controller;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.protocol.HTTP;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.springmvc.param.Login;
import com.springmvc.urls.ScUrls;
import com.springmvc.util.Response;
import com.springmvc.util.ResponseUtil;
import com.springmvc.vo.MessageBean;
/**
 * @author lv
 */
@Controller
public class LoginController {
	
	/**
	 * 返回login登陆页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/login",method=RequestMethod.GET)  
    public String login(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "login";  
    }  
	
	/**
	 * 登录
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws ClientProtocolException 
	 */
	@RequestMapping(value = "/toLogin",method=RequestMethod.GET)
	public String toLogin(HttpServletRequest request,Model model,String username,String password) throws ClientProtocolException, IOException{
		String pageResult = "menu";
		model.addAttribute("contextPath", request.getContextPath());
		Login loginUser = (Login)request.getSession().getAttribute("login");
        if(loginUser != null && loginUser.getUserName().equals(username) && loginUser.getPassword().equals(password)){
            return pageResult;
        }else{
        	request.getSession().removeAttribute("login");
        }		
		if(StringUtils.isEmpty(username) || StringUtils.isEmpty(password)){
			return pageResult = "redirect:login";
		}
		Login login = new Login();
		login.setUserName(username);
		login.setPassword(password);
		String requestPath = ScUrls.SC_HTTP_PATH + ScUrls.LOGIN;
	    // 利用httpClient调用springcloud的api服务,post请求
		HttpClient httpClient = HttpClientBuilder.create().build();
		HttpPost httpPost = new HttpPost(requestPath);
		httpPost.addHeader("content-type", "application/json;charset=UTF-8");
		httpPost.addHeader("Accept", "application/json;charset=UTF-8");
		Gson gson = new Gson();
		
		String jsonString = gson.toJson(login);
		StringEntity entity = new StringEntity(jsonString,HTTP.UTF_8);
		httpPost.setEntity(entity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		String response = EntityUtils.toString(httpResponse.getEntity());
		JsonObject returnData = new JsonParser().parse(response).getAsJsonObject();
		
		model.addAttribute("login", login);		
		model.addAttribute("message",String.valueOf(returnData.get("message")).replace("\"", ""));
		if(Integer.parseInt(String.valueOf(returnData.get("code"))) == 1){
			pageResult = "redirect:login";
		}
		if("menu".equals(pageResult)){
			request.getSession().setAttribute("login", login);
		}		
		return pageResult;
	}
	
	@RequestMapping(value="/ceshi",method=RequestMethod.GET)  
    public String ceshi(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "menu";  
    }  
}
