function loginwf() {
	if($.trim($("#username").val())==""){
		alert("请输入用户名");
		return false;
	}else if($.trim($("#password").val())==""){
		alert("请输入密码");
		return false;
	}
}