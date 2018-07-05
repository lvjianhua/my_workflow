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
	<input type="button" value="添加" onclick="javascript:window.location.href='${contextPath}/toWfTypeAdd'"/>
	<table border="1" cellspacing="0" cellpadding="0" align="center" width="100%" >
		 <tr>
		  	<td>类型名称</td>
		  	<td>类型标识</td>
		  	<td>操作</td>
		  </tr>
		  <%-- <c:forEach items="${listData}" var="hm" varStatus="s"> --%>
			  <tr>
				 <td>请假流程</td>
				 <td>leave</td>
				 <td><input type="button" value="编辑" onclick="javascript:window.location.href='${contextPath}/toWfTypeEdit'"/>&nbsp;<input type="button" value="删除" onclick=""/></td>
			  </tr>
		   <%-- </c:forEach> --%>
	</table>
 </form>
  </body>
</html>
