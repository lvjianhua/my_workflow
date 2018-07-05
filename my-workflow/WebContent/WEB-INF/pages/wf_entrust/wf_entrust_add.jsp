<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>委托设置 ->添加</title>
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
	
	var strids="";
	
	function commitWeiTuo(){
	var theform = document.addForm;
  	 if(!$.trim($("#ReceiverID").val())){
        window.alert("请填写接收人名称!");
        theform.ReceiverID.focus();
           return;
    }
     if(!$.trim($("#BeginTime").val())){
        window.alert("请填写开始时间!");
        theform.BeginTime.focus();
        return;
    }
    if(!$.trim($("#EndTime").val())){
        window.alert("请填写结束时间!");
        theform.EndTime.focus();
        return;
    }
    else
    {
	    theform.btnCommit.style.display="none";
	/*     theform.action ="/gx/wf?disclass=gxworkflow&action=commitWeiTuo&strids= "+$("#strids").val();
	    theform.submit(); */
	    var jsonData={
	   			"strids":$("#strids").val(),
	   			"WeiTuoRenID":$("#WeiTuoRenID").val(),//委托人
	   			"ReceiverID":$("#ReceiverID").val(),//接收人
	   			"BeginTime":$("#BeginTime").val(),//开始时间
	   			"EndTime":$("#EndTime").val()//结束时间
	   };
	   $.ajax({
	        type : 'post',
			url : '/gx/wf?disclass=gxworkflow&action=commitWeiTuo',
			async : false,
			data : jsonData,
			dataType : 'json',
			success : function(data, textStatus) {
				if (data.result > 0) {
					/* alert("保存成功！"); */
					location.href="/gx/wf?disclass=gxworkflow&action=getWeiTuoList";
				} else {
					alert("保存失败！");
				}
			}
	    });	    
	 }
}
	
	
	//单选复选框
	function onCheck(newid, transTools,ischeck) {
	if (ischeck) {
		if (strids.length == 0) {
			strids = "'"+newid+"'";
		} else {
			var strnewid1 = ",'" + strids + "',";
			var strnewid2 = ",'" + newid + "',";
			if (strnewid1.indexOf(strnewid2) < 0) {
				strids = strids + ",'" + newid+"'";
			}
		}
	} else {
		if (strids == "'"+newid+"'") {
			strids = "";
		} else if (strids.length > 0) {
			var strnewid1 = "'"+newid + "',";
			var strnewid2 = "," +"'"+ newid+"'";
			var stridsd = strids + "";
			if (stridsd.indexOf(strnewid1) >= 0) {
				strids = stridsd.replace(strnewid1, "");
			} else if (stridsd.indexOf(strnewid2) >= 0) {
				strids = stridsd.replace(strnewid2, "");
			}
		}
	}
	$("#strids").val(strids);
}
//全选
function selectAll()
{

	var checkNum = $("#CheckNum").val();
	var strids = "";	
	if($("#btnSelectAll").val() == "全 选")
	{			
		for(var i = 0; i<checkNum; i++)
		{		
			$("#checkOrder"+i).prop("checked",true);
			if(i==0)
			{
				strids = "'"+$("#ID"+i).val()+"'";
			}
			else
			{
				strids += ",'" +	 $("#ID"+i).val()+"'";
			}
		}
		
		$("#btnSelectAll").val("取消全选");
	}
	else
	{
		for(var i = 0; i<checkNum; i++)
		{		
			$("#checkOrder"+i).prop("checked",false);
		}		
		
		$("#btnSelectAll").val("全 选");
	}	
	
	$("#strids").val(strids);
}
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<input type="hidden" id="strids" name="strids" value="${strids}">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="88%"><font
				face="Arial, Helvetica, sans-serif"><b>委托设置->添加</b>
			</font>
			</td>
			<td width="12%" align="right">
			</td>
		</tr>
		<tr bgcolor="#0E2F72">
			<td width="88%" height="1"></td>
			<td width="12%" height="1"></td>
		</tr>
	</table>
	<br>
<form name="addForm" method="post" action="">	
	<table>
		<tr>
			<td>	
				<table>
				<tr>
					<table border="0" cellspacing="0" cellpadding="1" align="center" width="600px">
						<tr>			
							<td width="100px" height="35px" align="right"><b><font color="0E2F72">委托人：</font></b></td>
							<td width="200px"><input type="text" readonly="readonly"  style="width:155px" value="浦东"/>
							</td>
							<td width="100px" height="35px" align="right"><b><font color="0E2F72">接收人：</font>
							</b>
							</td>
							<td width="250px">
							<select>
							<option>请选择</option>
								<option>虹桥</option>
								<option>李四</option>
								<option>王五</option>
								<option>赵六</option>
							</select>注：动态查询
							</td>
						</tr>
						<tr>
							<td height="35px" align="right"><b><font color="0E2F72">开始时间：</font>
							</b>
							</td>
							<td size="10" height="35px"><input type="text"
								name="BeginTime" id="BeginTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH'});"/></td>
							<td height="35px" align="right"><b><font color="0E2F72">结束时间：</font>
							</b>
							</td>
							<td size="10" height="35px"><input type="text" style = "width:165px"name=EndTime id="EndTime" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH'});"/></td>
					</table>
				</td>
			</tr>
			<tr>
				<td>
				<table border="1" cellspacing="0" cellpadding="2" align="left"	width="300px">
					<tr>				
						<td width="50px" class="tableTitle"><strong>处理</strong></td>
						<td width="90px" class="tableTitle">单据类型</td>
					</tr>
					<tr>				
						<td width="50px" class="tableTitle"><input type="checkbox" name='checkOrder'  /></td>
						<td width="90px" class="tableTitle">请假流程</td>
					</tr>
					<c:forEach items="${requestScope.listData}" var="HD" varStatus="s">
						<tr height="30px"
							<c:if test="${s.index%2==0 }">style="background-color:#E0FFFF"</c:if>>
							<c:set var="CheckNum" value="${CheckNum+1}" />							
							<td><input type="hidden" name='ID${s.index}' id='ID${s.index}' value='${HD.ID}' /> 
								<input type="hidden" name='OrderType${s.index}' id='OrderType${s.index}' value='${HD.OrderCode}' />
								<input type="checkbox" name='checkOrder' id='checkOrder${s.index}'  value="${HD.ID}" <c:if test="${HD.isChecked == 1}" > checked </c:if>
								 onclick="onCheck('${HD.ID}', '${s.index}',this.checked)" />
							</td>
							<td>${HD.OrderType}</td>
						</tr>
					</c:forEach>
				</table>
			</td>
		</tr>
		<tr><td>&nbsp;</td><tr>
		<tr>
			<td>
				<table width="100%" align="center" border="0">
					<tr>
						<td>   
								<input type="button" id="btnSelectAll" onclick="selectAll()" value="全 选" />&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" name="btnCommit" id="btnCommit" value="&nbsp;&nbsp;保&nbsp;&nbsp;存&nbsp;&nbsp;" onClick="commitWeiTuo()" />
		   			  <input type="hidden" name="CheckNum" id="CheckNum"value='${CheckNum}' /></td>
						
					</tr>
				</table>
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>
