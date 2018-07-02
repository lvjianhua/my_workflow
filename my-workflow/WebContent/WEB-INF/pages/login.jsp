<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登陆界面</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css" />  
    <script type="text/javascript" src="${contextPath}/resources/js/jquery.js" ></script>
    <script type="text/javascript" src="${contextPath}/resources/js/login/login.js" ></script>     
  </head>
 <script type="text/javascript">
	window.onload=function(){
		if(GetQueryString("message") != null){
			alert(GetQueryString("message"));
			window.location.href = "${contextPath}/login";
		}
	}	
	// 获取地址栏参数
	function GetQueryString(name){
	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	     var r = window.location.search.substr(1).match(reg);
	     if(r!=null)return  decodeURI(r[2]); return null;
	}
</script> 
  <body>
    <form action="${contextPath}/toLogin" method="get" name="loginFm" onsubmit="return loginwf();">
        <div class="main">
    	<div class="mainin">
        	<h1>LV-WORKFLOW</h1>
            <div class="mainin1">
            	<ul>
                	<li><span>用户名：</span><input name="username" type="text" id="username" placeholder="登录名" class="SearchKeyword"></li>
                    <li><span>密码：</span><input type="password" name="password" id="password" placeholder="密码" class="SearchKeyword2"></li>
                    <li><button class="tijiao" type="submit">登陆</button></li>
                </ul>
            </div>
        </div>
    </div>
    </form>
  </body>
</html>
