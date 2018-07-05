String.prototype.endWith=function(oString){  
	var   reg=new   RegExp(oString+"$");  
	return   reg.test(this);     
}

/*
"^\\d+$"　　//非负整数（正整数 + 0） 
"^[0-9]*[1-9][0-9]*$"　　//正整数 
"^((-\\d+)|(0+))$"　　//非正整数（负整数 + 0） 
"^-[0-9]*[1-9][0-9]*$"　　//负整数 
"^-?\\d+$"　　　　//整数 
"^\\d+(\.\d+)?$"　　//非负浮点数（正浮点数 + 0） 
"^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$"　　//正浮点数 
"^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$"　　//非正浮点数（负浮点数 + 0） 
"^(-(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*)))$"　　//负浮点数 
"^(-?\\d+)(\\.\\d+)?$"　　//浮点数
*/

//只能输入数字，len是需要限制的长度
function isFormateNum(ob,len){
	if(ob.value.length>len)
	{
		ob.value = ob.value.substring(0,len);
	}		
	ob.value=ob.value.replace(/\D/g,'');
}

 function checkNum(obj){ 
   //检查输入的是否是数字
   obj.value = obj.value.replace(/\.$/g,""); 
 } 


//检查正整数，这里限制到8位数
function isPositiveInteger(o)  
{  
	var value=$.trim(o.value );
	var reg=/^[0-9]{1,8}$/;
	if (!reg.test(value)){
		o.value=o.value.replace(/\D/g,'');		
	}
	return true;
}

//保证输入的是金额
function clearNoNum(event,obj){
	//响应鼠标事件，允许左右方向键移动   
  event = window.event||event; 
  if(event.keyCode == 37 | event.keyCode == 39){ 
      return; 
  }  
  //先把非数字的都替换掉，除了数字和.   
  obj.value = obj.value.replace(/[^\d.]/g,"");   
  //必须保证第一个为数字而不是.
  obj.value = obj.value.replace(/^\./g,"");   
   //保证只有出现一个.而没有多个.   
  obj.value = obj.value.replace(/\.{2,}/g,".");   
   //保证.只出现一次，而不能出现两次以上    
  obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
} 

//检查是否是正整数
function isInteger(ov)  
{ 
	var ov=$.trim(ov);
	var reg=/^[0-9]{1,8}$/;
	if (!reg.test(ov)){
		return false;
	}
	return true;
}

//检查小数
function clearNotDecimal(id){
	var value=$.trim($("#"+id).val());
	$("#"+id).val(value.replace(/[^\d.]/g,""));
}

//检查用户注册时的用户名正确性(至少四位，可以是中文字符，英文字符，数字，中横线或者是下横线)
function checkRegisterUserName(userNameInput){
	var userName=$.trim(userNameInput.value);
	var reg=/^((\w)|(-)){4,20}$/;
	if(reg.test(userName)){
		return true;
	}else{
		return false;
	}
}
//检查用户注册时密码的正确性(至少六位,必须包含英文和数字)
function checkRegisterPassword(passwordInput){
	var password=$.trim(passwordInput.value);
	if(password==null||password==""){
		password=$("#password").val();
	}
	//检测位数
	if(password.length>=6&&password.length<=20){
		//检测是否有特殊字符
		var reg=/^([a-zA-Z]|\d){6,}$/;
		if(reg.test(password)){			
			//检车是否包含字母
			reg=/([a-zA-Z])+/;
			if(reg.test(password)){
				//检测是否包含数字
				reg=/\d+/;
				if(reg.test(password)){
					return true;
				}else{
					return false;
				}
			}else{
				return false;
			}
		}else{
			return false;
		}
	}else{
		return false;
	}
}
//检查用户确认密码的有效性
function checkConfirmPassword(){
	var password=$.trim($("#password").val());
	var confirmPassword=$.trim($("#confirmPwd").val());
	if(password!=""&&confirmPassword!=""){
		if(password==confirmPassword){
			return 1;
		}else{
			return 0;
		}
	}else{
		return -1; //没有输入密码就来检测确认密码
	}
}
//检查邮箱数据有效性
function checkRegisterEmail(emailInput){
	var email=$.trim(emailInput.value);
	var reg=/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	if(reg.test(email)){
		return true;
	}else{
		return false;
	}
}
//检查手机格式有效性
function checkRegisterPhone(phoneInput){
	var phone=$.trim(phoneInput.value);
	var reg=/^1[3|4|5|7|8]{1}\d{9}$/;
	if(reg.test(phone)){
		return true;
	}else{
		return false;
	}
}

//恢复对象的默认值
function returnDefaultValue(obj){
	obj.value=obj.defaultValue;
}
//检查用户是否登录
function checkUserLogin(){
	var isLogin=true;
	$.ajax({
		url:"/no/verify?disclass=verify&action=checkUserLogin",
		type:"post",
		async:false,
		success:function(data){
			if(data==-1){
				alert("程序发生错误！");
			}else{
				if(data==0){
					isLogin=false;
				}
			}
		}
	});
	return isLogin; 
}
//检查输入合法性
function checkInput(input){
	var reg=/^(\w|\s)*(or |exec|insert|select|drop|delete|--|'|update|count|\*|%|chr|mid|master|truncate|char|declare|script|alert|frame|<|>)+(\w|\s)*$/;
	if(reg.test(input)){
		return false;
	}else{
		return true;
	}
}
//设置cookie
function setCookie(name,value){
	var expires = new Date();
	expires.setTime(expires.getTime() + 10 * 24 * 60 * 60 * 1000);
	document.cookie=name+"="+escape(value)+";expires="+expires.toGMTString();
}
//获得cookie
function getCookie(name){
	var cookies=document.cookie;
	var start=cookies.indexOf(name+"=");
	if(start==-1){
		return "";
	}else{
		start+=name.length + 1;
		var end = cookies.indexOf(';', start);
		if (end == -1){
			return unescape(cookies.substring(start));
		}else{			
			return unescape(cookies.substring(start, end));
		}
	}
}
//删除cookie
function removeCookie(name){
	alert(document.cookie);
	var expires = new Date();
	expires.setTime(expires.getTime()-100);
	document.cookie=name+"=;expires="+expires.toGMTString();
	alert(document.cookie);
}

//自动转换数字金额为大小写中文字符,返回大小写中文字符串，最大处理到999兆
function changeMoneyToChinese(id,showText )
{
	var money = $("#"+id).val();
	var cnNums = new Array("零","壹","贰","叁","肆","伍","陆","柒","捌","玖"); //汉字的数字
	var cnIntRadice = new Array("","拾","佰","仟"); //基本单位
	var cnIntUnits = new Array("","万","亿","兆"); //对应整数部分扩展单位
	var cnDecUnits = new Array("角","分","毫","厘"); //对应小数部分单位
	var cnInteger = "整"; //整数金额时后面跟的字符
	var cnIntLast = "元"; //整型完以后的单位
	var maxNum = 999999999999999.9999; //最大处理的数字
	
	var IntegerNum; //金额整数部分
	var DecimalNum; //金额小数部分
	var ChineseStr=""; //输出的中文金额字符串
	var parts; //分离金额后用的数组，预定义
	
	if( money == "" ){
		alert("请输入金额！");
		return;
	}
	
	money = parseFloat(money);
	if( money >= maxNum ){
		alert("超出最大处理数字");
		return;
	}
	if( money == 0 ){
		ChineseStr = cnNums[0]+cnIntLast+cnInteger;
		$("#"+showText).text(ChineseStr);
		return;
	}
	money = money.toString(); //转换为字符串
	if( money.indexOf(".") == -1 ){
		IntegerNum = money;
		DecimalNum = '';
	}else{
		parts = money.split(".");
		IntegerNum = parts[0];
		DecimalNum = parts[1].substr(0,4);
	}
	if( parseInt(IntegerNum,10) > 0 ){//获取整型部分转换
		zeroCount = 0;
		IntLen = IntegerNum.length;
		for( i=0;i<IntLen;i++ ){
			n = IntegerNum.substr(i,1);
			p = IntLen - i - 1;
			q = p / 4;
			m = p % 4;
			if( n == "0" ){
				zeroCount++;
			}else{
				if( zeroCount > 0 ){
					ChineseStr += cnNums[0];
				}
				zeroCount = 0; //归零
				ChineseStr += cnNums[parseInt(n)]+cnIntRadice[m];
			}
			if( m==0 && zeroCount<4 ){
				ChineseStr += cnIntUnits[q];
			}
		}
		ChineseStr += cnIntLast;
	//整型部分处理完毕
	}
	if( DecimalNum!= '' ){//小数部分
		decLen = DecimalNum.length;
		for( i=0; i<decLen; i++ ){
			n = DecimalNum.substr(i,1);
			if( n != '0' ){
				ChineseStr += cnNums[Number(n)]+cnDecUnits[i];
			}
		}
	}
	if( ChineseStr == '' ){
		ChineseStr += cnNums[0]+cnIntLast+cnInteger;
	}else if( DecimalNum == '' ){
		ChineseStr += cnInteger;
	}
	$("#"+showText).text(ChineseStr);
}