<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
  <title>我的工作流</title>
<link rel="stylesheet" href="${contextPath}/resources/css/font.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/workflow.css" type="text/css">
<script type="text/javascript" src="${contextPath}/resources/js/check.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/jquery.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/WdatePicker.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/listTable.js"></script>
  <script type="text/javascript">
  	var myUrl = window.location.href; //get URL
    var myUrlTab = myUrl.substring(myUrl.indexOf("#")); // For localhost/tabs.html#tab2, myUrlTab = #tab2     
    var myUrlTabName = myUrlTab.substring(0,4); // For the above example, myUrlTabName = #tab 	
    function resetTabs(){
        $("#content > div").hide(); //Hide all content
        $("#tabs a").attr("id",""); //Reset id's   
    }    
  </script>
</head>

<body>
  <ul id="tabs">
      <li><a href="#" name="#tab1">待处理</a></li>
      <li><a href="#" name="#tab2">处理中</a></li>
      <li><a href="#" name="#tab3">已完成</a></li>
  </ul>

  <div id="content">
      <div id="tab1" >
         <!--当前待处理任务-->
	     <iframe id="fileFrame" name="fileFrame" frameborder="0" width="98%" height="700px" marginheight="0" marginwidth="0" scrolling="auto" src="${contextPath}/getWfTaskList" ></iframe>
      </div>
      <div id="tab2" >
      	<!--处理中的任务-->
      	<iframe id="fileFrame" name="fileFrame" frameborder="0" width="98%"  height="700px" marginheight="0" marginwidth="0" scrolling="auto" src="${contextPath}/getWfTaskList" ></iframe>
      </div>
      <div id="tab3" >
      	<!--已完成的任务-->
        <iframe id="fileFrame" name="fileFrame" frameborder="0" width="98%"  height="700px" marginheight="0" marginwidth="0" scrolling="auto" src="${contextPath}/getWfTaskList" ></iframe>
      </div> 
  </div>  
  <script>
    (function(){
        $("#content > div").hide(); // Initially hide all content
        $("#tabs li:first a").attr("id","current"); // Activate first tab
        $("#content > div:first").fadeIn(); // Show first tab content
        
        $("#tabs a").on("click",function(e) {
            e.preventDefault();
            if ($(this).attr("id") == "current"){ //detection for current tab
             return
            }
            else{           
            resetTabs();
            $(this).attr("id","current"); // Activate this
            $($(this).attr('name')).fadeIn(); // Show content for current tab
            	if($(this).attr('name')=='#tab4')
            	{
            		
            	}
            }
        });

        for (i = 1; i <= $("#tabs li").length; i++) {
          if (myUrlTab == myUrlTabName + i) {
              resetTabs();
              $("a[name='"+myUrlTab+"']").attr("id","current"); // Activate url tab
              $(myUrlTab).fadeIn(); // Show url tab content        
          }
        }
    })()
  </script>
</body>
</html>