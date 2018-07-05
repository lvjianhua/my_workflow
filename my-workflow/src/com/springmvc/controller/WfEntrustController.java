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
public class WfEntrustController {
	
	/**
	 * 获取委托信息列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/getWfEntrustList",method=RequestMethod.GET)  
    public String getWfEntrustList(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_entrust/wf_entrust_list";  
    } 
	
	/**
	 * 添加委托信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toWfEntrustAdd",method=RequestMethod.GET)  
    public String toWfEntrustAdd(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_entrust/wf_entrust_add";  
    } 
	
	/**
	 * 编辑委托信息
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toWfEntrustEdit",method=RequestMethod.GET)  
    public String toWfEntrustEdit(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_entrust/wf_entrust_edit";  
    } 
}
