//页面初始化时,设置table的边框高度颜色，以及选中变色
var oldbackcolor
var tableid
$(function(){
   $("table[id]").each(function(i){   	
      $('#tableList'+i).attr('border','1');
      $('#tableList'+i).attr('cellspacing','0');
      $('#tableList'+i+' tr:odd').attr('class','tableBodyOdd');
      $('#tableList'+i+' tr:even').attr('class','tableBodyEven');
      $('#tableList'+i+' tr:eq(0)').attr('class','tableHeader');
      $('#tableList'+i+' tr:not(:eq(0))').bind("click",
      function(){      	
      	if($(this).attr("id") != 'trid'+i)
      	{
      		$("#trid"+i).css('background-color',oldbackcolor);
	      	$("#trid"+i).removeAttr("id");
	      	$(this).attr("id","trid"+i);
	      	oldbackcolor = $(this).css('background-color');
      		$(this).css('background-color','gray');
      	}
      	else
    		{
    			$(this).css('background-color',oldbackcolor);
    		}
			});
   });
});
