package com.springmvc.interceptor;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import com.springmvc.param.Login;
/**
 * 
 * 拦截器：判断是否已登录
 * 
 * @author lv
 *
 */
public class LoginInterceptor extends HandlerInterceptorAdapter {
 
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		super.afterCompletion(request, response, handler, ex);
	}
 
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception {
		request.setCharacterEncoding("UTF-8");
        String url = request.getServletPath();    
        System.out.println("post URL："+url);
        if(!url.equals("")){
            // 判断是否已登录
        	Login loginUser = (Login)request.getSession().getAttribute("login");
            if(loginUser == null){
                // 无session则是未登录状态
                System.out.println(">>>未登录,请重新登录<<<");
                response.sendRedirect(request.getContextPath()+"/home");
                return false;
            }
        }
        return true;
	}
}
