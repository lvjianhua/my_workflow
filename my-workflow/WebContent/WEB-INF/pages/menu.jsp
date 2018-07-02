<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>localhost</title>
<script src="${contextPath}/resources/js/adapter.js"></script> <!--rem适配js-->
<link rel="stylesheet" href="${contextPath}/resources/css/base.css"> <!--初始化文件-->
<link rel="stylesheet" href="${contextPath}/resources/css/menu.css"> <!--主样式-->
</head>
<body>

<div id="menu">
    <!--隐藏菜单-->
    <div id="ensconce">
        <h2>
            <img src="${contextPath}/resources/images/show.png" alt="">
            工作流
        </h2>
    </div>

    <!--显示菜单-->
    <div id="open">
        <div class="navH">
            WOEKFLOW
            <span><img class="obscure" src="${contextPath}/resources/images/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>
                <li>
                    <h2 class="obtain">工作流<i></i></h2>
                    <div class="secondary">
                        <h3>工作流设置</h3>
                        <h3>工作流查看</h3>
                        <h3>工作流委托</h3>
                        <h3>工作流发起</h3>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
<script src="${contextPath}/resources/js/menu.js"></script> <!--控制js-->
<div style="text-align:center;">
<p>欢迎您:${login.userName}</p>
</div>
</body>
</html>