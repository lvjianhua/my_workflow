<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>单据类型添加</title>
	<link rel="stylesheet" href="${contextPath}/resources/css/font.css" type="text/css">
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css" type="text/css">       
  </head>
  <body>
  <form id="searchForm" name="searchForm" method="post" action="${contextPath}/addWfType">
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	
		<tr>
             <td colspan="4">添加单据类型:</td>
         </tr>
		<tr>
			<td align="right" style="color:#0E2F72"><b><font color="0E2F72">类型名称：</font></b></td>
  		<td align="left" width="250px">
  			<input type="text" id="LatinName" name="LatinName" value="">
			</td>
		<td align="right"><b><font color="0E2F72">类型标识：</font></b></td>
		<td><input type="text" id="LatinName" name="LatinName" value=""></td>		
				</tr>
                <tr>
                <td colspan="4" align="center"><input type="submit" value="保存"></td>
                </tr>
</table>
 </form>
  </body>
</html>
