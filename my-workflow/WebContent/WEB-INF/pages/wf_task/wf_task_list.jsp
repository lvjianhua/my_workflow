<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>单据审核流程</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css" type="text/css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css" type="text/css">       
  </head>
  <body>
  <form id="searchForm" name="searchForm" method="post" action="">
	<table border="1" cellspacing="0" cellpadding="0" align="center" width="100%" >
		 <tr>
		  	<td>单据类型</td>
		  	<td>工作流单号</td>
		  	<td>单据状态</td>
		  	<td>申请人</td>
		  	<td>待处理角色</td>
		  	<td>操作时间</td>
		  </tr>
		  <%-- <c:forEach items="${listData}" var="hm" varStatus="s"> --%>
			  <tr>
				 <td>请假流程</td>
				 <td>123456</td>
				 <td>待提交</td>
				 <td>客服经理</td>
				 <td>妹爷</td>
				 <td>2018-07-05 17:21</td>
			  </tr>
		   <%-- </c:forEach> --%>
	</table>
 </form>
  </body>
</html>
