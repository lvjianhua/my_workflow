<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import = "java.util.*"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd"> 
<html>
<head>
<title>银行管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
<link type="text/css" href="./css/jquery-ui.css" rel="stylesheet" />
<link type="text/css" href="./css/jquery.window.css" rel="stylesheet" />

<script type="text/javascript"  src="./jquery.js"></script>
<script type="text/javascript" src="./jquery-ui.js"></script>
<script type="text/javascript" src="./demo/jquery.window.min.js"></script>

<script language="JavaScript">

    var data = {
    	products:[{name: "mac", desc: "computer",	price: 1000, quantity: 100, alert:null },
    		{ name: "ipod", desc: "music player",price:  200, quantity: 200, alert:"on sale now!" },
    		{ name: "cinema display", desc: "screen",price:  800, quantity: 300, alert:"best deal!" }],
    		customer:{first: "John", last: "Public", level: "gold"}};
	
	function gg()
	{
		$("#userlist").bindTemplate({source:data, template:$("#template-userinfo")});
	}
	
	function ff()
	{
		$.window({
			title: "Cyclops Studio",
			url: "/editbase/ctl?action=listTruckCode"
		});
	}

</script>
</head>


<body bgcolor="#FFFFFF" text="#000000">
<div id="template-userinfo" style="display: none">
	<table width="100%" border="1">
		<tr>
			<th>编号</th>
			<th>姓名</th>
			<th>年龄</th>
			<th>地址</th>
		</tr>
		<tr class="{{products}}">
			<td>{{name}}</td>
			<td>{{desc}}</td>
			<td>{{price}}</td>
			<td>{{quantity}}</td>
		</tr>
		</table>
 </div>
 <div id="userlist"></div>
 <input name="adf" id="adf" type="button" value="模版" onclick="gg()">
 	
 <input name="adf" id="adf" type="button" value="测试" onclick="ff()">
</body>


</html>
