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
public class WfTaskController {
	
	/**
	 * 返回工作流查看页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/wfTaskList",method=RequestMethod.GET)  
    public String wfTaskList(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_task/wf_task";  
    }  
	
	/**
	 * 获取任务信息列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getWfTaskList",method=RequestMethod.GET)  
    public String getWfTaskList(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_task/wf_task_list";  
    } 
	
	/**
	 * 获取工作流发起页面
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getNewWfTask",method=RequestMethod.GET)  
    public String getNewWfTask(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_task/new_wf_task";  
    } 
	
	
}
