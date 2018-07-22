<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新闻审批</title>
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
                   <div class="layui-inline">
                    <label class="layui-form-label">类别：</label>
                    <div class="layui-input-inline">
                      <select name="news_type" id="news_type" lay-verify="required"   lay-filter="select-fliter" lay-search="">
                        <option value="2">全部</option>
                        <option value="0">公告</option>
                        <option value="1">新闻</option>
                      </select>
                    </div>
            	 </div>     
                  <div class="layui-input-inline">
                    <input type="tel" name="news_title"  id="news_title" lay-verify="required" autocomplete="off" class="layui-input" placeholder="输入新闻标题关键字搜索" style="width:200px;">
                  </div>                   
                        <button lay-filter="demo1" class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal" lay-submit="" ><i class="layui-icon" style="font-size: 30px; ">&#xe615;</i>  </button>
                         <button class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal"  ><i class="layui-icon" style="font-size: 30px; ">&#x1002;</i> </button>
              </div>
       </form>
<table class="layui-table" lay-data="{height:'full-100', url:'getcheckedNewsInfo.action?news_title=all&news_type=2', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{field:'NEWS_TITLE', width:'35%', sort: true, align:'center',fixed: true}">标题</th>
      <th lay-data="{field:'NEWS_WRITER',  align:'center',width:'15%', sort: true}">作者</th>
      <th lay-data="{field:'REPORT_TIME',  width:'20%',  align:'center',sort: true}">发表时间</th>      
      <th lay-data="{field:'NEWS_TYPE',  width:'10%',align:'center', sort: true}">类别</th>
      <th lay-data="{fixed: 'right', width:'20%', align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
  </thead>
</table>
<script type="text/html" id="barDemo">
<i class="layui-icon my-icon" lay-event="detail" style="font-size: 30px; color: #1E9FFF;">&#xe615;</i>
&nbsp;
<i class="layui-icon my-icon" lay-event="edit" style="font-size: 30px; color: #1E9FFF;">&#xe605;</i>
&nbsp;
<i class="layui-icon my-icon" lay-event="del" style="font-size: 30px; color: #1E9FFF;">&#x1006;</i>
</script>
<script>
$(document).ready(function(){   
	$("#news_title").focus();
 });
//编辑页面数据显示JSON
var editData;
layui.use('table', function(){
  var table = layui.table;
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    var student_id = data.STUDENT_ID;
    var association_id = data.ASSOCIATION_ID;
    var delData = {"student_id":student_id,"association_id":association_id};
	if(obj.event === 'del'){
     layer.confirm('确认打回该新闻吗？', function(index){   
 	$.ajax({
 	    	
 	        url: "updateNewsCheckFlag.action",        //后台url
 	        data:{"news_id":data.NEWS_ID,"check_flag":"2"},
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
    	  layer.confirm('确认通过该新闻吗？', function(index){   
    	 	$.ajax({
    	 	    	
    	 	        url: "updateNewsCheckFlag.action",        //后台url
    	 	        data:{"news_id":data.NEWS_ID,"check_flag":"1"},
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
    }else if(obj.event === 'detail'){
    	parent.news_id = data.NEWS_ID;
    	parent.fnTabChange(6);
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
	form.on('select(select-fliter)', function(data){
		var table = layui.table;
		var news_title = $("#news_title").val();
		if(news_title==""){
			news_title="all"
		}
			table.reload('idTest', {
				url:'getcheckedNewsInfo.action?news_title='+news_title+'&news_type='+data.value
			});
		
	});
	//查询
	  form.on('submit(demo1)', function(data){
			var table = layui.table;	 
			table.reload('idTest', {
				page: {
			          curr: 1 //重新从第 1 页开始
			       	},
				url:'getcheckedNewsInfo.action?news_type='+data.field.news_type+'&news_title='+data.field.news_title		
			});
		  
		  return false;
	  });
});
</script>
</body>
</html>