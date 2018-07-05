﻿/*document.onkeydown = function(evt){ 
	var evt = window.event?window.event:evt; 
	if (evt.keyCode==13) { 
		goSearch(0); 
	} 
	};*/
//加载大小类
function loadSmallCategory(FirstClassID){
	if(!$.trim(FirstClassID)){
		return;
	}
  getCascadeData(FirstClassID,"SecondClassID","GXProductSecondClass","ID,SecondClassName,Status","FirstClassID='"+FirstClassID+"' and Status= 0 ",0);
}
//获取三级商品
function loadProductName(SecondClassID)
{	
	if(!$.trim(SecondClassID))
	{
		return;
	}			
  getCascadeData(SecondClassID,"ProductID","GXProductName","ID,CNName,Status","SecondClassID='"+SecondClassID+"' and Status= 0 ",0);
}
//获取供应商品牌
function loadBrandList(SupplierID){
  getCascadeDataAndOrderDetail(SupplierID,"BrandID","SupplierBrands","ID,CNBrandName","SupplierID='"+SupplierID+"' and del= 0 ",0);
}
/*
 * 根据拼音查询数据:按名称排序
 * inputId:		拼音查询时拼音输入框input的id
 * dataSelectId:用于展示数据的Select标签的id
 * tableName:	将要查询的表名
 * queryColumn:	将要查询的字段
 * likedColumn：	sql语句like后的字段名
 * subSql:		附加查询条件，如status！=-1
 */
function getDataByPYByCompanyName(inputId,dataSelectId,tableName,queryColumn,likedColumn,subSql){
	//获得拼音输入框的id获得用户输入的查询数据
	var inputValue=$.trim($("#"+inputId).val());
	//根据传来的id获得select框
	var dataSelect=$("#"+dataSelectId)[0];
	//在查询数据之前，先把之前select框里的数据清空
	dataSelect.options.length=0;
	//判断异常,如果拼音输入框没有输入数据,提示用户
	if(inputValue==""){
		dataSelect.add(new Option("输入不能为空",""),0);
		return;
	}
	
	if(!$.trim((likedColumn)))
	{
		likedColumn = 'PinYin';
	}
	
	if(!$.trim(subSql))
	{
		subSql = "Status=0";
	}
	//ajax调用公共方法获得数据
	$.ajax({
		url:"/gx/pb?disclass=allpublic&action=getDataByPYByName",
		type:"post",
		dataType:"json",
		data:{"inputValue":inputValue,"tableName":tableName,"queryColumn":queryColumn,"likedColumn":likedColumn,"subSql":subSql},
		success:function(data,textStatus){
			//result=0的情况下，没有查询到数据
			if(data.result==0){
				dataSelect.add(new Option("未查到数据",""),0);
			}
			//result=-1,表示程序错误
			else if(data.result==-1){
				alert("程序错误!\n请联系系统管理员！");
			}
			//程序正常，并且查到数据的情况下
			else{
			    dataSelect.add(new Option("--请选择--",""),0);
				//获得查询到的数据，从第二行开始附加到select框里
				var datas=eval(data.dataList);
				for(var i=0;i<datas.length;i++){
					var newOption=new Option(datas[i].Name,datas[i].ID);
					dataSelect.add(newOption,i+1);
					if(i==0){
						dataSelect.selectedIndex = 1;
					}
						$(dataSelectId).focus();
				}
				$("#"+dataSelectId).change();	
			}
		}
	});
}
/*
 * 用于供应商-商品-规格三级联动查询
 * 根据拼音查询数据:按名称排序
 * inputId:		拼音查询时拼音输入框input的id
 * dataSelectId:用于展示数据的Select标签的id
 * tableName:	将要查询的表名
 * queryColumn:	将要查询的字段
 * likedColumn：	sql语句like后的字段名
 * subSql:		附加查询条件，如status！=-1
 */
function getCascadeDataByProductID(parentSelectValue,childSelectID,tableName,queryColumn,subSql,itype){
	//查找前先清空当前司机下拉菜单里的数据	
	var childSelect = $("#"+childSelectID)[0];	  	
	childSelect.options.length=0;
		
	//父级菜单无值的情况下，直接返回
	if(parentSelectValue==""){
		childSelect.add(new Option("--请选择--",""),0);
		$("#"+childSelectID)[0].change();	
		return;
	}
	
	//查询数据
	else{
		$.ajax({
			url:"/gx/pb?disclass=allpublic&action=getCascadeDataAddClientOrderDetail",
			type:"post",
			dataType:"json",
			data:{"queryColumn":queryColumn,"tableName":tableName,"subSql":subSql},
			success:function(data,textStatus){
			  //result=0的情况下，没有查询到数据
				if(data.result==0){
					if(itype == 1){
						childSelect.add(new Option("未查到数据",""),0);
					}
				}//result=-1,表示程序错误
				else if(data.result==-1){
					alert("程序错误!\n请联系系统管理员！");
				}//程序正常，并且查到数据的情况下
				else{
					childSelect.add(new Option("--请选择--",""),0);
					//获得查询到的数据，从第二行开始附加到select框里
					var datas=eval(data.dataList);
					for(var i=0;i<datas.length;i++){
						var newOption=new Option(datas[i].CountryName+" "+datas[i].CNName+" "+datas[i].UserName+" "+datas[i].TitleRemark+" "+datas[i].MinPackage+datas[i].UnitName+" "+datas[i].CNPackingType,datas[i].ID);
						childSelect.add(newOption,i+1);
					}
				}
			}
		});
	}		
}
/**
 * 加载商品
 * @param SupplierID 供应商
 * @param type 1表示显示包括商品为-1的记录
 */
function loadProduct(SupplierID,type){
	if(type==1){
		getCascadeDataAndOrderDetail(SupplierID,"GXProductID","Product"," ID,CNProductName,Status ","SupplierID='"+SupplierID+"'",0);
	}else{
		getCascadeDataAndOrderDetail(SupplierID,"GXProductID","Product"," ID,CNProductName,Status  ","SupplierID='"+SupplierID+"' and Status !=-1 ",0);
	}
	
	loadBrandList(SupplierID);
}
/**
 * 加载包装规格
 * @param GXProductID 商品
 * @param type 1表示显示包括包装规格为-1的记录
 */
function loadPackSpec(GXProductID,type){
	if(type==1){
		getCascadeDataAndOrderDetail(GXProductID,"FirstSpecID","ProductPackingInfo","ID,CNPackingName,del","ProductID='"+GXProductID+"'",0);
//		getCascadeDataAndOrderDetail(GXProductID,"SpecID","ProductSpecification","ID,CNName,del","ProductID='"+GXProductID+"'",0);
		getCascadeDataAndOrderDetail(GXProductID,"SpecID","ProductSpecification","ID,CNName,del","id in (select productspecId from ProductSkuSeafoodProp where productId = '"+GXProductID+"')",0);
		getCascadeDataAndOrderDetail(GXProductID,"CategoryTypeID","ProductCategoryType","ID,CNName,del","CategoryID=(select ThirdClassID from Product where ID='"+GXProductID+"')",0);
	}else{
//		getCascadeDataAndOrderDetail(GXProductID,"SpecID","ProductSpecification","ID,CNName,del","ProductID='"+GXProductID+"' and del= 0 ",0);
		getCascadeDataAndOrderDetail(GXProductID,"SpecID","ProductSpecification","ID,CNName,del","id in (select productspecId from ProductSkuSeafoodProp where productId = '"+GXProductID+"') and del= 0 ",0);
		getCascadeDataAndOrderDetail(GXProductID,"FirstSpecID","ProductPackingInfo","ID,CNPackingName,del","ProductID='"+GXProductID+"' and del= 0 ",0);
		getCascadeDataAndOrderDetail(GXProductID,"CategoryTypeID","ProductCategoryType","ID,CNName,del","CategoryID=(select ThirdClassID from Product where ID='"+GXProductID+"')",0);
	}
}


//获取产品规格:供应商--》商品--》规格
function loadSpecthree(GXProductID){
	getCascadeDataAndOrderDetail(GXProductID,"SpecID","ProductSpecification","ID,CNName,del","ProductID='"+GXProductID+"'",0);
}

/*
 * 级联效果获得数据：
 * parentSelectValue:父级select选中的值
 * childSelectId:子select负责展示数据，此处为子select的的id，后续会把数据注入到此select
 * tableName:将要查询的表明
 * queryColumn:将要查询的列
 * subSql：附加条件，如status！=-1
 * itype: 0表示需要请选择这个选项，1表示不需要
 */
function getCascadeDataAndOrderDetail(parentSelectValue,childSelectID,tableName,queryColumn,subSql,itype){
	//查找前先清空当前下拉菜单里的数据	
	var childSelect = $("#"+childSelectID)[0];
	childSelect.options.length=0;
	//父级菜单无值的情况下，直接返回
	if(parentSelectValue==""){
		childSelect.add(new Option("--请选择--",""),0);
		return;
	}//查询数据
	else{
		$.ajax({
			url:"/gx/pb?disclass=allpublic&action=getCascadeData",
			type:"post",
			dataType:"json",
			data:{"queryColumn":queryColumn,"tableName":tableName,"subSql":subSql},
			success:function(data,textStatus){
			//itype=0表示需要有请选择
			if(data.result==0){
				if(itype == 1){
					childSelect.add(new Option("未查到数据",""),0);
				}
			}//result=-1,表示程序错误
			else if(data.result==-1){
				alert("程序错误!\n请联系系统管理员！");
			}//程序正常，并且查到数据的情况下
			else{
				childSelect.add(new Option("--请选择--",""),0);
				//获得查询到的数据，从第二行开始附加到select框里
				var datas=eval(data.dataList);
				for(var i=0;i<datas.length;i++){
					if(datas[i].Status<0){
						var newOption=new Option(datas[i].Status+"   "+datas[i].Name,datas[i].ID);
					}else{
						var newOption=new Option(datas[i].Name,datas[i].ID);
					}
					childSelect.add(newOption,i+1);
					/*if(i==0)
					{
						childSelect.selectedIndex = 1;
					}
					$(childSelect).focus();*/
				}
			}
			}
		});
	}		
}
/*
 * 所有页面的查询方法
 * itype: 0表示全新查询，1表示翻页查询
 */
function goSearch(itype,url) {
	if (itype == 0) {
		$("#curPage").val("1");
	}
	
	var theForm = $("#searchForm")[0];
		
	if(url != undefined && url.length > 0)
	{		
		theForm.action = url;
	}
	theForm.submit();
}

/*
 * 查询页面明细信息复选框点击事件
 * inputId:		存放已经选中的行标记，比如ID
 * newid: 用户点击行的标记，比如ID
 * ischeck:	用户点击复选框的选中状态
 */
function onCheck(inputId, newid, ischeck){	
	var strids = $("#"+inputId).val();
	if(ischeck){ //如果选中，就把选中行的表示ID添加到变量strids中
		if(strids.length == 0){ //长度为0说明前面没有行被选中
			strids=newid;
		}
		else{ //否者，判断新的标示ID是否以前已经在strids变量中，如果没有就放到strids变量中
			var strnewid1 = "," + strids + ",";			
			var strnewid2 = "," + newid + ",";	
			if(strnewid1.indexOf(strnewid2) < 0){//说明没有，增加到变量中
				strids = strids+","+newid;
			}
		}
	}
	else{ //如果没选中，就把本行的标示ID从strids变量中去掉
		if(strids == newid){ //如果相等，说明就一个值，直接设置为空串
			strids="";
		}
		else if(strids.length > 0){//说明被选中不只一行，需要判断本行的标示ID是否在strids中，如果在就去掉
			var strnewid1 = newid + ",";
			var strnewid2 = "," + newid;
			stridsd = strids+"";
			if(stridsd.indexOf(strnewid1) >= 0){ //在就去掉
				strids = stridsd.replace(strnewid1,"");
			}
			else if(stridsd.indexOf(strnewid2) >= 0){ //在就去掉
				strids = stridsd.replace(strnewid2,"");
			}
		}	
	}	
	//最后把新的标示ID字符串放到空间中保存。	
	$("#"+inputId).val(strids);
}


/*
 * 根据拼音查询数据
 * inputId:		拼音查询时拼音输入框input的id
 * dataSelectId:用于展示数据的Select标签的id
 * tableName:	将要查询的表名
 * queryColumn:	将要查询的字段
 * likedColumn：	sql语句like后的字段名
 * subSql:		附加查询条件，如status！=-1
 */
function getDataByPY(inputId,dataSelectId,tableName,queryColumn,likedColumn,subSql){
	//获得拼音输入框的id获得用户输入的查询数据
	var inputValue=$.trim($("#"+inputId).val());
	//根据传来的id获得select框
	var dataSelect=$("#"+dataSelectId)[0];
	//在查询数据之前，先把之前select框里的数据清空
	dataSelect.options.length=0;
	//判断异常,如果拼音输入框没有输入数据,提示用户
	if(inputValue==""){
		dataSelect.add(new Option("输入不能为空",""),0);
		return;
	}
	
	if(!$.trim(likedColumn))
	{
		likedColumn = 'PinYin';
	}
	
	if(!$.trim(subSql))
	{
		subSql = "Status=0";
	}
	//ajax调用公共方法获得数据
	$.ajax({
		url:"/gx/pb?disclass=allpublic&action=getDataByPY",
		type:"post",
		dataType:"json",
		data:{"inputValue":inputValue,"tableName":tableName,"queryColumn":queryColumn,"likedColumn":likedColumn,"subSql":subSql},
		success:function(data,textStatus){
			//result=0的情况下，没有查询到数据
			if(data.result==0){
				dataSelect.add(new Option("未查到数据",""),0);
			}
			//result=-1,表示程序错误
			else if(data.result==-1){
				alert("程序错误!\n请联系系统管理员！");
			}
			//程序正常，并且查到数据的情况下
			else{
				//select框第一行添加请选择
				dataSelect.add(new Option("--请选择--",""),0);
				//获得查询到的数据，从第二行开始附加到select框里
				var datas=eval(data.dataList);
				for(var i=0;i<datas.length;i++){
					var newOption=new Option(datas[i].Name,datas[i].ID);
					dataSelect.add(newOption,i+1);
					if(i==0)
					{
						dataSelect.selectedIndex = 1;
					}
					$(dataSelectId).focus();
				}
			}
		}
	});
}

/*
 * 根据拼音查询数据:按名称排序
 * inputId:		拼音查询时拼音输入框input的id
 * dataSelectId:用于展示数据的Select标签的id
 * tableName:	将要查询的表名
 * queryColumn:	将要查询的字段
 * likedColumn：	sql语句like后的字段名
 * subSql:		附加查询条件，如status！=-1
 */
function getDataByPYByName(inputId,dataSelectId,tableName,queryColumn,likedColumn,subSql){
	//获得拼音输入框的id获得用户输入的查询数据
	var inputValue=$.trim($("#"+inputId).val());
	//根据传来的id获得select框
	var dataSelect=$("#"+dataSelectId)[0];
	//在查询数据之前，先把之前select框里的数据清空
	dataSelect.options.length=0;
	//判断异常,如果拼音输入框没有输入数据,提示用户
	if(inputValue==""){
		dataSelect.add(new Option("输入不能为空",""),0);
		return;
	}
	if(!$.trim((likedColumn)))
	{
		likedColumn = 'PinYin';
	}
	if(!$.trim(subSql))
	{
		subSql = "Status=0";
	}
	//ajax调用公共方法获得数据
	$.ajax({
		url:"/gx/pb?disclass=allpublic&action=getDataByPYByName",
		type:"post",
		dataType:"json",
		data:{"inputValue":inputValue,"tableName":tableName,"queryColumn":queryColumn,"likedColumn":likedColumn,"subSql":subSql},
		success:function(data,textStatus){
			//result=0的情况下，没有查询到数据
			if(data.result==0){
				dataSelect.add(new Option("未查到数据",""),0);
			}
			//result=-1,表示程序错误
			else if(data.result==-1){
				alert("程序错误!\n请联系系统管理员！");
			}
			//程序正常，并且查到数据的情况下
			else{
				//select框第一行添加请选择
				dataSelect.add(new Option("--请选择--",""),0);

				//获得查询到的数据，从第二行开始附加到select框里
				var datas=eval(data.dataList);
				for(var i=0;i<datas.length;i++){
					var newOption=new Option(datas[i].Name,datas[i].ID);
					dataSelect.add(newOption,i+1);
					if(i==0)
					{
						dataSelect.selectedIndex = 1;
					}
					$(dataSelectId).focus();
				}
			}
		}
	});
}
/*
 * 级联效果获得数据：
 * parentSelectValue:父级select选中的值
 * childSelectId:子select负责展示数据，此处为子select的的id，后续会把数据注入到此select
 * tableName:将要查询的表明
 * queryColumn:将要查询的列
 * subSql：附加条件，如status！=-1
 * itype: 0表示需要请选择这个选项，1表示不需要
 */
function getCascadeData(parentSelectValue,childSelectID,tableName,queryColumn,subSql,itype){
	//查找前先清空当前司机下拉菜单里的数据		
	var childSelect = $("#"+childSelectID)[0];	  	
	childSelect.options.length=0;
	//父级菜单无值的情况下，直接返回
	if(parentSelectValue==""){
		return;
	}
	//查询数据
	else{
		$.ajax({
			url:"/gx/pb?disclass=allpublic&action=getCascadeData",
			type:"post",
			dataType:"json",
			data:{"queryColumn":queryColumn,"tableName":tableName,"subSql":subSql},
			success:function(data,textStatus){
				//itype=0表示需要有请选择
				if(itype == 0){
					var objOption = new Option("--请选择--","");
			 		childSelect.add(objOption);
			    }
			  //result=0的情况下，没有查询到数据
				if(data.result==0){
					if(itype == 1){
						childSelect.add(new Option("未查到数据",""),0);
					}
				}
				//result=-1,表示程序错误
				else if(data.result==-1){
					alert("程序错误!\n请联系系统管理员！");
				}
				//程序正常，并且查到数据的情况下
				else{
					var datas=eval(data.dataList);
					for(var i=0;i<datas.length;i++){
						var newOption=new Option(datas[i].Name,datas[i].ID);
						childSelect.add(newOption);
					}
				}
			}
		});
	}		
}

function getSeastarCascadeData(parentSelectValue,childSelectID,tableName,queryColumn,subSql,itype){
	//查找前先清空当前司机下拉菜单里的数据	
	var childSelect = $("#"+childSelectID)[0];	  	
	childSelect.options.length=0;
	//父级菜单无值的情况下，直接返回
	if(parentSelectValue==""){
		return;
	}
	//查询数据
	else{
		$.ajax({
			url:"/gx/pb?disclass=allpublic&action=getSeastarCascadeData",
			type:"post",
			dataType:"json",
			data:{"queryColumn":queryColumn,"tableName":tableName,"subSql":subSql},
			success:function(data,textStatus){
				//itype=0表示需要有请选择
				if(itype == 0){
					var objOption = new Option("--请选择--","");
			 		childSelect.add(objOption);
			  }
			  //result=0的情况下，没有查询到数据
				if(data.result==0){
					if(itype == 1){
						childSelect.add(new Option("未查到数据",""),0);
					}
				}
				//result=-1,表示程序错误
				else if(data.result==-1){
					alert("程序错误!\n请联系系统管理员！");
				}
				//程序正常，并且查到数据的情况下
				else{
					var datas=eval(data.dataList);
					for(var i=0;i<datas.length;i++){
						var newOption=new Option(datas[i].Name,datas[i].ID);
						childSelect.add(newOption);
					}
				}
			}
		});
	}		
}

/*
公共的停用某行数据的js方法,使用该方法的list页面需要有goSearch这个js查询函数
tableName 是要停用那个表的记录
ID 是要停用记录的ID
iType 是1表示彻底删除，其余表示停用
*/
function disableRow(ID, tableName, iType)
{
	if(!confirm("确定要删除/停用该行记录么？"))
	{
		return;
	}
	
	var URL = '/gx/pb?disclass=allpublic&action=disableRow';
	if(iType == 1)
	{
		URL = '/gx/pb?disclass=allpublic&action=deleteRow';
	}
	
	var JSONData={
		"ID":ID,
		"tableName":tableName
	};
	
	$.ajax({type: 'post', 
			url:URL,async:false, 
			data: JSONData,
			dataType:'json',
			success:function (data, textStatus){
				if(data.result==1)
				{
					alert('删除成功！');
					window.location.href=$("#searchForm")[0].action;
				}
				else
				{
					alert('删除失败！');
				}
		}});
}

//停用记录
function disableJQGridRow(rowID, tableName, iType)
{
	if(!confirm("确认要删除/停用该条记录么？"))
	{			
		return;
	}
	
	var URL = '/gx/pb?disclass=allpublic&action=disableRow';
	if(iType == 1)
	{
		URL = '/gx/pb?disclass=allpublic&action=deleteRow';
	}
		
	var rowData = jQuery("#gridList").jqGrid('getRowData', rowID); 
	var JSONData = {
		"ID":rowData.ID,
		"tableName":tableName
	};
	
	$.ajax({
		type : "post",
		url : URL,
		async : false,
		data : JSONData,
		dataType : "json",
		success : function(data, textStatus) {
			if (data.result == 1) {
				var su=jQuery("#gridList").jqGrid('delRowData',rowID);
				if(su)
				{
					alert("停用成功!");
				}
				else
				{				
					alert('停用页面数据失败!');
				}
			}else{
				alert("停用失败!");
			}
		}
	});
}

/**
 * 复制内容到剪贴板
 * @param text
 */
function copyToClipboard(copyText){
	if (window.clipboardData) 
	{ 
	window.clipboardData.setData("Text", copyText);
	} 
}

function doAjax(jsonData,url){
	$.ajax({
		type : "post",
		url : url+"type=1",
		async : false,
		data : jsonData,
		dataType : "json",
		success : function(data, textStatus) {
			return data.result;			
		}
	});
}


