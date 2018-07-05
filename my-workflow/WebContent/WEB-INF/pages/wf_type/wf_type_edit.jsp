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
  <form id="searchForm" name="searchForm" method="post" action="#">
编辑单据类型:
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	
		<tr>
			<td align="right" style="color:#0E2F72"><b><font color="0E2F72">类型名称：</font></b></td>
  		<td align="left" width="250px">
  			<input type="text" id="LatinName" name="LatinName" value="请假流程">
			</td>
		<td align="right"><b><font color="0E2F72">类型标识：</font></b></td>
		<td><input type="text" id="LatinName" name="LatinName" value="leave"></td>		
				</tr>
                <tr>
                <td colspan="4" align="center"><input type="submit" value="保存"></td>
                </tr>
</table>
审核流程:
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	     
        <tr>
		<td colspan="4"><b><font color="0E2F72">添加流程:</font></b></td>
		</tr>	
        <tr >		
		<td align="right" style="color:#0E2F72"><b><font color="0E2F72">流程名称：</font></b></td>
  		<td align="left" width="250px"  colspan="3">
  			<input type="text" id="LatinName" name="LatinName" value="">例:待**审核
			</td>
				</tr>					
				
			    <tr >
                 <td align="right"><b><font color="0E2F72">是否需要金额判断跳转审核：</font></b></td>
				<td colspan="3"><select id="FarmingMethodID" name="FarmingMethodID">
				<option value="0" >否</option>
				<option value="1">是</option>
				</select>
				 </td>	
                 </tr>
				
                 <tr>
                 <td align="right"><b><font color="0E2F72">是否可删除：</font></b></td>
		<td colspan="3">				<select id="FarmingMethodID" name="FarmingMethodID">
				<option value="0" >否</option>
				<option value="1">是</option>
				</select></td>
						</tr>
						                 <tr>
                 <td align="right"><b><font color="0E2F72">(枚举)流程结束执行：</font></b></td>
		<td colspan="3">				<select id="FarmingMethodID" name="FarmingMethodID">
		<option value="0" >请选择</option>
				<option value="0" >计算XXXX金额</option>
				<option value="1">发邮件</option>
				</select></td>
						</tr>
		<tr>
			
		<td colspan="4"><b><font color="0E2F72">审核角色(二选一):</font></b></td>
		</tr>						
						
				<tr >				
                 <td align="right"><b><font color="0E2F72">(枚举)公共角色：</font></b></td>
				<td colspan="3"><select id="FarmingMethodID" name="FarmingMethodID">
				<option value="0">请选择</option>
				<option value="0">部门经理审核</option>
				<option value="1">部门总监审核</option>
				</select>&nbsp;<input type="submit" value="重置">
				 </td>	
				</tr>						

                <tr>
						<td align="right"><b><font color="0E2F72">系统角色：</font></b></td>
		<td colspan="3">
		<select id="FarmingMethodID" name="FarmingMethodID">
				<option value="0">请选择</option>
				<option value="1">人事经理</option>
				<option value="3">运营经理</option>
				<option value="4">财务运营助理</option>
				<option value="5">财务会计助理</option>
				</select>(可多选)
		</td> 
                 </tr>						

                <tr>
                <td colspan="4" align="center"><input type="submit" value="新增"></td>
                </tr>
</table>
审核流程列表:
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	
		<tr>
             <td>流程状态</td>
             <td>流程名称</td>
             <td>角色类型</td>
             <td>是否可删除</td>
             <td>是否需要金额判断跳转审核</td>
             <td>操作</td>
        </tr>
        
        <tr>
             <td>1</td>
             <td>待申请人提交</td>
             <td>申请人</td>
             <td>否</td>
             <td>否</td>
             <td><input type="button" value="编辑" onclick="javascript:window.location.href='${contextPath}/toWfProcessEdit'"/></td>
        </tr>
        <tr>
             <td>2</td>
             <td>待经理审核</td>
             <td>公共角色</td>
             <td>是</td>
             <td>是</td>
             <td><input type="button" value="编辑" onclick=""/>&nbsp;<input type="button" value="删除" onclick=""/></td>
        </tr>
</table>
 </form>
  </body>
</html>
