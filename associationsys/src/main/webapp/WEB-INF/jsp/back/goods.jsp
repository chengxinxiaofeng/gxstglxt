<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物资管理</title>
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
             <div class="layui-inline" style="width:100%" style="margin-top:10px">
                  <div class="layui-input-inline">
                    <input type="tel" name="phone" onkeydown="keyDown(event)"  id="searchWord" lay-verify="required" autocomplete="off" class="layui-input" placeholder="输入物资名称搜索..." style="width:200px;">
                  </div>
                        <button class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal" onclick="fnSearchUser()" ><i class="layui-icon" style="font-size: 30px; ">&#xe615;</i>  </button>
              </div>
            <div style="margin-top:10px" class="demoTable">
               <button class="layui-btn  layui-btn-sm" data-type="getCheckData"><i class="layui-icon" style="font-size: 30px; ">&#xe640;</i>批量删除  </button>
                <button class="layui-btn layui-btn-sm" onclick="fnAddUser()"><i class="layui-icon" style="font-size: 30px; ">&#xe654;</i>物资录入 </button>
                <button class="layui-btn layui-btn-sm" onclick="fnRefreshData()" ><i class="layui-icon" style="font-size: 30px; ">&#x1002;</i>刷新  </button>
            </div>
<table class="layui-table" lay-data="{ height:'full-100', url:'getGoodsInfo.action', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left',width:'5%',align:'center'}"></th>
      <th lay-data="{field:'GOODS_NAME', width:'25%', sort: true, align:'center'}">名称</th>
      <th lay-data="{field:'GOODS_COUNT',  align:'center',width:'25%', sort: true}">数量</th>
      <th lay-data="{field:'LAST_EDIT_TIME',  align:'center',width:'25%', sort: true}">最后更新时间</th>
      <th lay-data="{fixed: 'right', width:'20%', align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
  </thead>
</table>
<script type="text/html" id="barDemo">

<i class="layui-icon my-icon" lay-event="edit" style="font-size: 30px; color: #1E9FFF;">&#xe642;</i>
&nbsp;
<i class="layui-icon my-icon"" lay-event="del" style="font-size: 30px; color: #1E9FFF;">&#xe640;</i>
</script>
<script>

$(document).ready(function(){
	 $(window).resize(function () {
    //     fnResize();
     });
});
//编辑页面数据显示JSON
var editData;
layui.use('table', function(){
	$(document).ready(function(){   
		$("#searchWord").focus();
	 });
  var table = layui.table;
  //监听表格复选框选择
  table.on('checkbox(demo)', function(obj){
    console.log(obj)
  });
  //监听工具条
  table.on('tool(demo)', function(obj){
    var data = obj.data;
    var GOODS_ID = data.GOODS_ID;
    var delData = {"goods_id":GOODS_ID};
	if(obj.event === 'del'){
      layer.confirm('确认删除吗？', function(index){    	  
 	$.ajax({
 	    	
 	        url: "delGoods.action",        //后台url
 	        data:JSON.stringify(delData),
 	       	contentType: "application/json",
 	        type: "post",                   //类型，POST或者GET
 	        dataType: 'html',              //数据返回类型，可以是xml、json等
 	        success: function (data) {      //成功，回调函数 	        	
 	        	if(data == "1"){
 	        		obj.del();
 	        		layer.close(index);
 	        		layer.msg('删除成功', {icon: 1});
 	        	}else{
 	        		layer.msg('删除失败', {icon: 5});
 	        	}
 	        },
 	        error: function (er) {          //失败，回调函数
 	        
 	        	layer.msg('删除失败', {icon: 5});
 	        }
 	    }); 
 	
      });
    } else if(obj.event === 'edit'){
      editData = data;
      layer.open({
          type: 2,
          title:['编辑物资', 'font-size:16px;color:#0e375b;'],
          maxmin: false,
          shadeClose: true, //点击遮罩关闭层
          area : ['400px' , '300px'],
          content: 'openEditGoodsWin.action'
        });
    }
  });
  //批量删除
  var $$ = layui.$, active = {
    getCheckData: function(obj){ 
    	//获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
     if(data.length == 0){
    	 layer.msg('请选择要删除的数据', {icon: 5});
    	 return;
     }
     layer.confirm('确认批量删除选中数据吗？', function(index){  
		     $.ajax({			    	
			        url: "delBatchGoods.action",        //后台url
			        data:JSON.stringify(data),
			        contentType: "application/json;character:utf-8",
			        type: "post",                   //类型，POST或者GET
			        dataType: 'html',              //数据返回类型，可以是xml、json等
			        success: function (data) {      //成功，回调函数 	        	
			        		if(data == 1){
			        			layer.msg('批量删除成功', {icon: 1});
			        			//重新加载数据
			        			var table = layui.table;
			        			table.reload('idTest', {
			        				url:'getGoodsInfo.action'
			        			});
			        		}else{
			        			layer.msg('批量删除失败', {icon: 5});
			        		}
			        },
			        error: function (er) {          //失败，回调函数
			        
			        	layer.msg('批量删除失败', {icon: 5});
			        }
			    });
		     layer.close(index);
     	});
    }
    ,getCheckLength: function(){ //获取选中数目
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
      layer.msg('选中了：'+ data.length + ' 个');
    }
    ,isAll: function(){ //验证是否全选
      var checkStatus = table.checkStatus('idTest');
      layer.msg(checkStatus.isAll ? '全选': '未全选')
    }
  };
  
  $('.demoTable .layui-btn').on('click', function(){
    var type = $(this).data('type');
    active[type] ? active[type].call(this) : '';
  });
});
function keyDown(e) {
	  var ev= window.event||e;

	//13是键盘上面固定的回车键
	  if (ev.keyCode == 13) {
		  fnSearchUser();
	  }
	  }
//查询
function fnSearchUser(){
	var searchWord = $("#searchWord").val();
	if(searchWord==""){
		layer.msg('请输入内容', {icon: 5});
		document.getElementById("searchWord").focus();
	}else{
		var table = layui.table;
		//搜索重新加载数据
		table.reload('idTest', {
			url:'findGivenGoods.action?searchWord='+searchWord
		});
	}
}
//刷新数据
function fnRefreshData(){
	var table = layui.table;
	table.reload('idTest', {
		url:'getGoodsInfo.action'
	});
}
//添加用户
function fnAddUser(){
	 layer.open({
         type: 2,
         title:['录入物资', 'font-size:16px;color:#0e375b;'],
         maxmin: false,
         shadeClose: true, //点击遮罩关闭层
         area : ['400px' , '300px'],
         content: 'openAddGoodsWin.action'
       });
}

</script>
</body>
</html>