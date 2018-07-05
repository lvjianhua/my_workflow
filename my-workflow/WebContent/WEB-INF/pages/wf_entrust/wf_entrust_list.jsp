<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<title>委托查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${contextPath}/resources/css/font.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css" type="text/css">
<script type="text/javascript" src="${contextPath}/resources/js/WdatePicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/page.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/check.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/ajaxfileupload.js"></script>	

<script language="JavaScript">
function disableRow(ID){
	if(confirm("确实要停用吗?")){
	   $.ajax({
	        type : 'post',
			url : "/gx/wf?disclass=gxworkflow&action=disableWeiTuo&ID="+ID,
			async : false,
			data : null,
			dataType : 'json',
			success : function(data, textStatus) {
				if (data.result > 0) {
					alert("停用成功！");
					location.reload(true);
				} else {
					alert("停用失败！");
				}
			}
	    });	   
	}
	else{
		return;
	}
}	
function goSearch(itype){
	var theform = document.searchForm;
  	theform.submit();
}

</script>
</head>


<body bgcolor="#FFFFFF" text="#000000">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="100%"><font 
				face="Arial, Helvetica, sans-serif"><b>委托查询:</b> </font></td>
			<td width="12%">&nbsp;</td>
			<td width="11%">&nbsp;</td>
		</tr>
		<tr bgcolor="#0E2F72">
			<td width="77%" height="1"></td>
			<td width="12%" height="1"></td>
			<td width="11%" height="1"></td>
		</tr>
	</table>
	<form name="sForm" method="post" action="">
	<input type="button" value="添加" onclick="javascript:window.location.href='${contextPath}/toWfEntrustAdd'"/>
<table width="100%" border="1" cellspacing="0" cellpadding="0" align="center" width="100%">
						<tr>
							<td>委托时间
							</td>
							<td>委托人
							</td>
							<td>接收人
							</td>
							<td>开始时间
							</td>
							<td>结束时间
							</td>
							<td>操作
							</td>
						</tr>
						<tr>
							<td>2018-07-05
							</td>
							<td>浦东
							</td>
							<td>虹桥
							</td>
							<td>2018-07-05 22:00
							</td>
							<td>2018-08-05 22:00
							</td>
							<td><input type="button" value="停用">&nbsp;<input type="button" value="查询"onclick="javascript:window.location.href='${contextPath}/toWfEntrustEdit'" >
							</td>
						</tr>
					</table>
	</form>
</body>
</html>
