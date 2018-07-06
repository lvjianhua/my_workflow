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
编辑审核流程:
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	
              <tr>
		<td colspan="4"><b><font color="0E2F72">编辑流程:</font></b></td>
		</tr>	
       <tr >		
		<td align="right" style="color:#0E2F72"><b><font color="0E2F72">流程名称：</font></b></td>
  		<td align="left" width="250px"  colspan="3">
  			<input type="text" id="LatinName" name="LatinName" value="待申请人提交">例:待**审核
			</td>
				</tr>					
				
			    <tr >
                 <td align="right"><b><font color="0E2F72">是否需要金额判断跳转审核：</font></b></td>
				<td colspan="3"><select id="FarmingMethodID" name="FarmingMethodID">
				<option value="0" >否</option>
				<option value="1">是</option>
				</select>当前流程下有两个至两个流程以上才可选择‘是’
				 </td>	
                 </tr>
				
                 <tr>
                 <td align="right"><b><font color="0E2F72">是否可删除：</font></b></td>
		<td colspan="3">				<select id="FarmingMethodID" name="FarmingMethodID" disabled>
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
                <td colspan="4" align="center"><input type="submit" value="保存"></td>
                </tr>
</table>
<br/>
添加金额判断:注：以下部分展不展示由“是否需要金额判断跳转审核”决定，是就显示，反之<br/>
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	
		<tr>
			
		<td align="right"><b><font color="0E2F72">(枚举)符号：</font></b></td>
		<td colspan="3">
<select id="FarmingMethodID" name="FarmingMethodID">
				<option value="1">请选择</option>
				<option value="1" selected>">"</option>
				<option value="2">">="</option>
				<option value="3">"<"</option>
				<option value="4">"<="</option>
				</select>
		</td>		
				</tr>
                 <tr>
                 <td align="right"><b><font color="0E2F72">公式：</font></b></td>
				 <td colspan="3">><input type="text" value="123">
				 <select>
				 	<option value="1">数值判断</option>
				 	<option value="1">天数判断</option>
				 </select>				 
				 </td>
                 </tr>
                <tr>
                 <td align="right"><b><font color="0E2F72">流程：</font></b></td>
				 <td colspan="3">
					<select id="FarmingMethodID" name="FarmingMethodID">
						<option value="0">请选择</option>
						<option value="3">3-待经理审核</option>
						<option value="4">4-待财务审核</option>
					</select>
				 </td>
                </tr>
                 <tr>
                 <td align="right"><b><font color="0E2F72">角色：</font></b></td>
				 <td colspan="3">
					<select id="FarmingMethodID" name="FarmingMethodID">
						<option value="0">请选择</option>
						<option value="1">财务助理</option>
						<option value="2">运营经理</option>
					</select>注:流程加载
				 </td>
                </tr>
                <tr>
                <td colspan="4" align="center"><input type="submit" value="保存"></td>
                </tr>
</table>
<br/>
注:当前步骤状态a__满足公式XXXX--->跳转至步骤状态b审核
<table border="1" cellspacing="0" cellpadding="1" align="center" width="100%">	
		<tr>
             <td colspan="3">公式</td>
             <td>操作</td>
        </tr>
        
        <tr>
             <td colspan="3">1__数值<500--->3-待经理审核(项目组1经理)</td>
             <td><input type="button" value="删除" onclick=""/></td>
        </tr>
        <tr>
             <td colspan="3">1__数值>500--->4-待财务审核(财务行政助理,财务会计助理)</td>
             <td><input type="button" value="删除" onclick=""/></td>
        </tr>
</table>
 </form>
  </body>
</html>
