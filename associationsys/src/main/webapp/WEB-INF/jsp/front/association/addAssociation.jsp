<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>社团申请</title>
<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
<style>
.btn-sumit {
	background-color:grey;
}
</style>
<body >
	    <div class="div-notice" style="margin-top:10px">
          <div class="notic-head" style="font-size:20px">
             	 当前位置:<a href="javascript:;" onclick="parent.fnOpenPage(1)" style="cursor:pointer">首页</a>&nbsp;/&nbsp;<a class="notice-onclick" href="javascript:;">社团申请</a>
              	<hr>
          </div>
   	   </div>
   	   	<form class="layui-form form1" >
        	 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">社团名称：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="association_name" id="association_name" lay-verify="required" autocomplete="off" class="layui-input" style="width:300px;">
                 	
                  </div>
             </div>
             <div class="layui-inline" style="width:100%;margin-top:15px;display:none">
                  <label class="layui-form-label">社团ID：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="association_id" id="association_id" lay-verify="required" autocomplete="off" class="layui-input" style="width:300px;">
                 	
                  </div>
             </div>
             <div class="layui-form-inline" pane="" style="margin-top:15px;width:100%;" >
                  <label class="layui-form-label" style="padding-left:10px">社团类别:</label>
                  <div class="layui-input-block">
                    <input type="radio" name="association_type" value="0" title="学术社团" checked="">
                    <input type="radio" name="association_type" value="1" title="非学术社团">
                  </div>
             </div>
             <div class="layui-form-inline" style="margin-top:15px; ">
                    <label class="layui-form-label">挂靠单位：</label>
                    <div class="layui-input-inline">
                      <select name="institute_id" id="institute_id" lay-verify="required" lay-search="" >
    <!--                     <option value="">直接选择或搜索选择</option>
                        <option value="1">软件工程学院</option>
                        <option value="2">大气科学学院</option>
                        <option value="3">数学学院</option>
                        <option value="4">电子工程学院</option> -->
                      </select>
                    </div>
             </div>
              <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">社长姓名：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="realname" id="realname" lay-verify="required" autocomplete="off" class="layui-input" style="width:300px;">                 	
                  </div>
             </div>
             <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">社长学号：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="student_id" id="student_id" lay-verify="required" autocomplete="off" class="layui-input" style="width:300px;">                 	
                  </div>
             </div>
              <div class="layui-form-inline" pane="" style="margin-top:15px;width:100%;" >
                  <label class="layui-form-label" style="padding-left:10px">性别:</label>
                  <div class="layui-input-block">
                    <input type="radio" name="gender" value="0" title="男" checked="">
                    <input type="radio" name="gender" value="1" title="女">
                  </div>
             </div>
             <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">联系电话：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="phone" id="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width:300px;">                 	
                  </div>
             </div>
             <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">电子邮箱：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="email" id="email" lay-verify="required|email" autocomplete="off" class="layui-input" style="width:300px;">                 	
                  </div>
             </div>
                <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">社团简介：</label>
                  <div class="layui-input-inline">
                 <div class="layui-upload">
 				 <button type="button"  class="layui-btn layui-btn-normal" id="test8">选择文件</button>
  				 <button type="button"  class="layui-btn" id="test9">开始上传</button>
			</div>  
                  </div>
             </div>
              <div class="layui-form-item" style="margin-top:15px;">
                <div class="layui-input-block">
                  <button class="layui-btn  btn-submit1" lay-submit=""  lay-filter="demo1" style="width:300px;">提交</button>
                </div>
          </div>
                 
        </form>
<script>

$(document).ready(function(){
	$("#association_name").focus();
	fnSetUnEnable();
	fnGetSelectData();
});

layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  form.render('select');
	  //日期
	  laydate.render({
	    elem: '#date'
	  });
	  laydate.render({
	    elem: '#date1'
	  });
	  
	  
	  form.on('submit(demo1)', function(data){
		  $.ajax({
		    	
		        url: "addAssociation.action",        //后台url
		        data:JSON.stringify(data.field),
		        contentType: "application/json",
		        type: "post",                   //类型，POST或者GET
		        dataType: 'html',              //数据返回类型，可以是xml、json等
		        beforeSend:function(){
		        	//提交按钮不可用
		        	//$(".btn-submit1").attr("disabled", "true");
		    		//$(".btn-submit1").addClass("btn-sumit");
		        },
		        success: function (data) {      //成功，回调函数 	   
		        	//alert("？？"+data);
		        	if(data==0){
		        		layer.msg("该社团已存在", {icon: 5});
		        		fnSetUnEnable();
		        	}else if(data==1){
		        		layer.msg("您已创建了一个社团，不能再创建", {icon: 5});
		        		fnSetUnEnable();
		        	}else if(data==2){
		        		layer.msg("创建社团失败，请稍候再试", {icon: 5});
		        		fnSetUnEnable();
		        	}else if(data==3){
		        		layer.msg("创建社团成功，请耐心等待管理员审核", {icon: 1});
		        		fnSetUnEnable();
		        	}else{
		        		layer.msg("该学号加入社团数已超过3个，不能创建新社团", {icon: 5});
		        		fnSetUnEnable();
		        	}
		        	
		        },
		        error: function (er) {          //失败，回调函数
		        	layer.msg("添加用户出错", {icon: 5});
		        }
		    }); 
		  return false;
	  });
});
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;
	  //选完文件后不自动上传
	  upload.render({
	    elem: '#test8'
	    ,url: 'upLoadFiles.action'
	    ,auto: false
	    ,accept: 'file' 
	    //,multiple: true
	    ,bindAction: '#test9'
	    ,size: 1500 //限制文件大小，单位 KB
	    ,done: function(res){
	     	if(res.code==1){
	     		layer.msg('上传简介文件成功', {icon: 1});
	     		$("#association_id").val(res.parent_id);
	     		fnSetEnable();
	     	}else{
	     		layer.msg('上传简介文件失败，请稍候再试', {icon: 5});
	     	}
	    }
	  });
});

function fnGetSelectData(){
	$.ajax({
    	
        url: "<%=request.getContextPath() %>/back/getSelectData.action",        //后台url
        type: "post",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        		var selDom = $("#institute_id");
        	     $("#institute_id").empty();
        	     selDom.append(" <option value=>直接选择或搜索选择</option>");
        		for(var i = 0; i < data.length; i++){
        			  	　 selDom.append("<option value="+data[i]["ID"]+">"+data[i]["INSTITUTE_NAME"]+"</option>");

        		}
        		//刷新下拉选
      		  var form = layui.form
      		  form.render('select');
 
        },
        error: function (er) {          //失败，回调函数
        	layer.msg('获取学院下拉选出错', {icon: 5});
        }
    });
}
function fnSetUnEnable(){
	$(".btn-submit1").attr("disabled", "true");
	$(".btn-submit1").addClass("btn-sumit");
	
}
function fnSetEnable(){
	$(".btn-submit1").removeAttr("disabled");
	$(".btn-submit1").removeClass("btn-sumit");
	$("#test8").attr("disabled", "true");
	$("#test9").attr("disabled", "true");
	$("#test8").addClass("btn-sumit");
	$("#test9").addClass("btn-sumit");
	
}
</script>

</body>
</html>