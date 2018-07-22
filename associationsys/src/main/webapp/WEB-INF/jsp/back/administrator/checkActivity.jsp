<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>活动审批</title>
<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.step.css" />
 </head>
 <style>
 .my-icon:hover{
 	cursor: pointer; 
 }
 </style>
<body > 
   <div style="margin-top:10px;">
    <form class="layui-form" >
             <div class="layui-inline" style="width:100%" >  
                  <div class="layui-input-inline">
                    <input type="tel" name="news_title"  id="searchWord" lay-verify="required" autocomplete="off" class="layui-input" placeholder="输入活动主题关键字搜索" style="width:200px;">
                  </div>                   
                        <button lay-filter="demo1" class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal" lay-submit="" ><i class="layui-icon" style="font-size: 30px; ">&#xe615;</i>  </button>
                         <button class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal" onclick="fnRefreshData()" ><i class="layui-icon" style="font-size: 30px; ">&#x1002;</i> </button>
              </div>
       </form>
            <div style="margin-top:10px" class="demoTable">
              
            </div>
<table class="layui-table" lay-data="{height:'full-100', url:'getcheckActivityInfo.action?activity_theme=all', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{field:'ACTIVITY_THEME', width:'15%', sort: true, align:'center',fixed: true}">活动主题</th>
      <th lay-data="{field:'ACTIVITY_TIME',  align:'center',width:'20%', sort: true}">举办时间</th>
      <th lay-data="{field:'ACTIVITY_PLACE',  width:'15%',  align:'center',sort: true}">地点</th>      
      <th lay-data="{field:'ACTIVITY_MASTER_NAME',  width:'15%',align:'center',sort: true}">负责人</th>
      <th lay-data="{field:'ACTIVITY_MASTER_PHONE',  width:'15%',align:'center', sort: true}">联系电话</th>
      <th lay-data="{width:'10%', align:'center', toolbar: '#barDemo2'}">活动简介</th>
      <th lay-data="{fixed: 'right', width:'10%', align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
  </thead>
</table>
<script type="text/html" id="barDemo">

<i class="layui-icon my-icon" lay-event="edit" style="font-size: 30px; color: #1E9FFF;">&#xe605;</i>
&nbsp;
<i class="layui-icon my-icon" lay-event="del" style="font-size: 30px; color: #1E9FFF;">&#x1006;</i>
</script>
<script type="text/html" id="barDemo2">
<i class="layui-icon my-icon" lay-event="setSign" style="font-size: 30px; color: #1E9FFF;">&#xe615;</i>
</script>
<script>
$(document).ready(function(){   
	$("#searchWord").focus();
 });
//编辑页面数据显示JSON
var editData;
layui.use('table', function(){
  var table = layui.table;
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    var association_id = data.ASSOCIATION_ID;
	if(obj.event === 'del'){
     layer.confirm('确认打回该活动吗？', function(index){    	  
 	$.ajax({
 	    	
 	        url: "updateActivityState.action",        
 	        data:{"activity_id":data.ACTIVITY_ID,"type":"0"},
 	        type: "post",                   //类型，POST或者GET
 	        dataType: 'html',              //数据返回类型，可以是xml、json等
 	        success: function (data) {      //成功，回调函数 	        	
 	        	if(data == "1"){
 	        		obj.del();
 	        		layer.close(index);
 	        		layer.msg('操作成功', {icon: 1});
 	        	}else{
 	        		layer.msg('操作失败', {icon: 5});
 	        	}
 	        },
 	        error: function (er) {          //失败，回调函数
 	        
 	        	layer.msg('操作出错', {icon: 5});
 	        }
 	    }); 
 	
      });
    } else if(obj.event === 'edit'){
        layer.confirm('确认通过该活动吗？', function(index){    	  
         	$.ajax({
         	    	
         	        url: "updateActivityState.action",        
         	        data:{"activity_id":data.ACTIVITY_ID,"type":"1"},
         	        type: "post",                   //类型，POST或者GET
         	        dataType: 'html',              //数据返回类型，可以是xml、json等
         	        success: function (data) {      //成功，回调函数 	        	
         	        	if(data == "1"){
         	        		obj.del();
         	        		layer.close(index);
         	        		layer.msg('操作成功', {icon: 1});
         	        	}else{
         	        		layer.msg('操作失败', {icon: 5});
         	        	}
         	        },
         	        error: function (er) {          //失败，回调函数
         	        
         	        	layer.msg('操作出错', {icon: 5});
         	        }
         	    }); 
         	
              });
            }else if(obj.event === 'setSign'){
        layer.open({
            type: 1,
            title:['活动简介', 'font-size:16px;color:#0e375b;'],
            maxmin: false,
            shadeClose: true, //点击遮罩关闭层
            area : ['400px' , '450px'],
            content: data.ACTIVITY_CONTENT
          });
    }
  });  
});
//刷新数据
function fnRefreshData(){
	var table = layui.table;
	table.reload('idTest', {
		url:'getAllNewsInfo.action'
	});
}
//添加新闻
function fnAddUser(){
	window.parent.fnTabChange(8);
}
//下拉选选中事件
layui.use(['form'], function(){
	var form = layui.form;
	//查询
	  form.on('submit(demo1)', function(data){
			var table = layui.table;	
			table.reload('idTest', {
				page: {
			          curr: 1 //重新从第 1 页开始
			       	},
				url:'getcheckActivityInfo.action?activity_theme='+$('#searchWord').val(),	
			});

		  return false;
	  });
});
</script>
</body>
</html>