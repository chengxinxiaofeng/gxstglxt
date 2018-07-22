<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>成员画像</title>
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
                    <input type="tel" name="phone" onkeydown="keyDown(event)"  id="searchWord" lay-verify="required" autocomplete="off" class="layui-input" placeholder="姓名/学号/邮箱/电话号码" style="width:200px;">
                  </div>
                        <button class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal" onclick="fnSearchUser()" ><i class="layui-icon" style="font-size: 30px; ">&#xe615;</i>  </button>
              </div>
            <div style="margin-top:10px" class="demoTable">
               <button class="layui-btn  layui-btn-sm" data-type="getCheckData"><i class="layui-icon" style="font-size: 30px; ">&#xe640;</i>批量删除  </button>
                <button class="layui-btn layui-btn-sm" onclick="fnAddUser()"><i class="layui-icon" style="font-size: 30px; ">&#xe654;</i>新增  </button>
                <button class="layui-btn layui-btn-sm" onclick="fnRefreshData()" ><i class="layui-icon" style="font-size: 30px; ">&#x1002;</i>刷新  </button>
            </div> 
<table class="layui-table" lay-data="{height:'full-100', url:'getCommonUserInfo.action', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{type:'checkbox', fixed: 'left',width:'4%'}"></th>
      <th lay-data="{field:'STUDENT_ID', width:'11%', sort: true, align:'center',fixed: true}">学号</th>
      <th lay-data="{field:'REALNAME',  width:'10%',  align:'center',sort: true}">姓名</th>
      <th lay-data="{field:'GENDER',  width:'7%',  align:'center',sort: true ,templet: function(d){
       if(d.GENDER == '1'){ return  '<i class=layui-icon my-icon style = font-size: 30px; color: #1E9FFF;>&#xe661;</i>' }else{
       return  '<i class=layui-icon my-icon style = font-size: 30px; color: #1E9FFF;>&#xe662;</i>' }
      }}">性别</th>
      
      
           <th lay-data="{field:'IMGURL',  width:'9%',  align:'center' , event: 'setSign', style:'cursor: pointer;',templet: function(d){
    		if(d.IMGURL != '0'){ var url =encodeURIComponent(d.IMGURL); url = 'getImg.action?imgurl='+url;	 return   '<img src='+ url+' class=layui-nav-img>'}else{ return '' }
      }}">头像</th>
      
      
      
       <th lay-data="{field:'PHONE',  width:'13%',align:'center',sort: true}">手机号码</th>
       <th lay-data="{field:'EMAIL',  width:'16%',align:'center', sort: true}">邮箱</th>
       <th lay-data="{field:'REGISTERTIME',  width:'10%',align:'center', sort: true}">注册时间</th> 
       <th lay-data="{field:'INSTITUTE_NAME',  width:'10%',align:'center', sort: true}">所属学院</th> 
      <th lay-data="{fixed: 'right', width:'10%', align:'center', toolbar: '#barDemo'}">操作</th>
    </tr>
  </thead>
</table>
<script type="text/html" id="barDemo">

<i class="layui-icon my-icon" lay-event="edit" style="font-size: 30px; color: #1E9FFF;">&#xe642;</i>
&nbsp;
<i class="layui-icon my-icon"" lay-event="del" style="font-size: 30px; color: #1E9FFF;">&#xe640;</i>
</script>
<script>
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
    var student_id = data.STUDENT_ID;
    var association_id = data.ASSOCIATION_ID;
    var delData = {"student_id":student_id,"association_id":association_id};
    if(obj.event === 'detail'){
      layer.msg('ID：'+ data.id + ' 的查看操作');
    }else if(obj.event === 'setSign'){
    	if(data.IMGURL!=0){
    	var imgurl =encodeURIComponent(data.IMGURL); 
		imgurl = "getImg.action?imgurl="+imgurl;
    	var json ={
    			  "title": "头像", //相册标题
    			  "id": 123, //相册id
    			  "start": 0, //初始显示的图片序号，默认0
    			  "data": [   //相册包含的图片，数组格式
    			    {
    			      "alt": data.REALNAME+"的头像",
    			      "pid": 666, //图片id
    			      "src": imgurl, //原图地址
    			      "thumb": "" //缩略图地址
    			    }
    			  ]
    			};
    	//打开相册
    	 layer.photos({
    		    photos: json
    		    ,anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
    		  });
    	}
    }else if(obj.event === 'del'){
      layer.confirm('确认删除吗？', function(index){    	  
 	$.ajax({
 	    	
 	        url: "delCommonUser.action",        //后台url
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
          title:['编辑用户', 'font-size:16px;color:#0e375b;'],
          maxmin: false,
          shadeClose: true, //点击遮罩关闭层
          area : ['400px' , '550px'],
          content: 'openEditCommonUserWin.action'
        });
    }
  });
  //批量删除
  var $$ = layui.$, active = {
    getCheckData: function(obj){ //获取选中数据
      var checkStatus = table.checkStatus('idTest')
      ,data = checkStatus.data;
     if(data.length == 0){
    	 layer.msg('请选择要删除的数据', {icon: 5});
    	 return;
     }
     layer.confirm('确认批量删除选中数据吗？', function(index){  
		     $.ajax({
			    	
			        url: "delBatchCommonUser.action",        //后台url
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
			        				page: {
			      			          curr: 1 //重新从第 1 页开始
			      			       	},
			        				url:'getCommonUserInfo.action'
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
			page: {
		          curr: 1 //重新从第 1 页开始
		       	},
			url:'findGivenUser.action?searchWord='+searchWord
		});
	}
}
//刷新数据
function fnRefreshData(){
	var table = layui.table;
	table.reload('idTest', {
		page: {
	          curr: 1 //重新从第 1 页开始
	       	},
		url:'getCommonUserInfo.action'
	});
}
//添加用户
function fnAddUser(){
	 layer.open({
         type: 2,
         title:['新增用户', 'font-size:16px;color:#0e375b;'],
         maxmin: false,
         shadeClose: true, //点击遮罩关闭层
         area : ['400px' , '550px'],
         content: 'openAddCommonUserWin.action'
       });
}
</script>
</body>
</html>