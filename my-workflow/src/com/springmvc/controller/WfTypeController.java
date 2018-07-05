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
public class WfTypeController {
	
	/**
	 * 返回工作流设置页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/wfTypeList",method=RequestMethod.GET)  
    public String wfTypeList(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_type/wf_type";  
    }  
	
	/**
	 * 添加工作流类型页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/toWfTypeAdd",method=RequestMethod.GET)  
    public String toWfTypeAdd(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_type/wf_type_add";  
    } 
	
	/**
	 * 添加工作流类型
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/addWfType",method=RequestMethod.POST)  
    public String addWfType(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "redirect:wfTypeList";  
    } 
	
	
	/**
	 * 编辑工作流类型页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/toWfTypeEdit",method=RequestMethod.GET)  
    public String toWfTypeEdit(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_type/wf_type_edit";  
    } 
	
	
	/**
	 * 编辑工作流审核流程页面
	 * 
	 * @param request
	 * @return
	 */

	@RequestMapping(value="/toWfProcessEdit",method=RequestMethod.GET)  
    public String toWfProcessEdit(HttpServletRequest request,Model model){  
		model.addAttribute("contextPath", request.getContextPath());
        return "wf_type/wf_process_edit";  
    }
	
}
