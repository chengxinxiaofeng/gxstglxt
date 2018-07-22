<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社团管理团/校级管理员个人资料</title>
<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/jquery.step.css" />
<script src="<%=request.getContextPath() %>/resources/js/jquery.step.min.js"></script>
		<style>
			button {
				display: inline-block;
				padding: 6px 12px;
				font-size: 14px;
				line-height: 1.42857143;
				text-align: center;
				cursor: pointer;
				border: 1px solid transparent;
				border-radius: 4px;
				color: #fff;
				background-color: #5bc0de;
			}
			
			.main {
				width: 100%;
				margin-top:20px;
				margin-left: auto;
			}
			
			#step {
				margin:auto auto;
			}
			
			.btns {
				float: left;
			}
			
			.info {
				float: left;
				height: 34px;
				line-height: 34px;
				margin-left: 40px;
				font-size: 28px;
				font-weight: bold;
				color: #928787;
			}
			
			.info span {
				color: red;
			}

	/*获取验证码按钮开始*/
.div-button{
position: absolute;
float: right;
background-color: #009688; /* Green */
margin-left: 10px;
border: none;

color: white;

padding: 10px 10px;

text-align: center;
height: 20px;
line-height: 20px;

text-decoration: none;

display: inline-block;
cursor:pointer;
font-size: 11px;
}
.div-disabled{
   background-color: grey;
}
.div-last-bottom{
    float: right;
 /*   margin-right: 20px;*/
}
.layui-form{
    margin-top: 20px;
}
.layui-input-block{
	width: 200px;
}
.div-img-up{
  margin-left: 20px;
}
	/*获取验证码按钮结束*/
.btn-sumit{
		background-color:grey;
}
.btn-upload{
		background-color:grey;
}
		</style>
	</head>
	<body>
		<form class="layui-form form1" >
                 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">头像：</label>
                  <div class="layui-input-inline">
                    <img class="layui-upload-img layui-nav-img" style="width:100px;height:100px;" id="demo1">
                  </div>
                </div>
                 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">学号：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="student_id" id="student_id" onchange="fnSetPwd()" onblur="fnCheckStudentId()" lay-verify="required" autocomplete="off" class="layui-input" style="width:200px;" disabled="disabled">                 	
                  </div>
                </div>
                 <!-- 头像在服务器地址  隐藏结束-->
                <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">姓名：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="realname" id="realname" lay-verify="required"  autocomplete="off" class="layui-input" style="width:200px;"  disabled="disabled">
                  </div>
                </div>
                <div class="layui-form-inline" pane="" style="margin-top:15px;width:100%;" >
                  <label class="layui-form-label" style="padding-left:10px">性别:</label>
                  <div class="layui-input-block">
                    <input type="radio" name="gender" id="gender1" value="0" title="男" checked="" disabled="disabled">
                    <input type="radio" name="gender" id="gender2" value="1" title="女"  disabled="disabled">
                  </div>
                </div>    
                <div class="layui-inline" style="width:100%">
                  <label class="layui-form-label">手机号码：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="phone"  id="phone" lay-verify="phone" autocomplete="off" class="layui-input" style="width:200px;"  disabled="disabled">
                  </div>
                </div>
                <div class="layui-inline" style="width:100%;margin-top:15px;" >
                  <label class="layui-form-label">邮箱：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="email" id="email" lay-verify="email" autocomplete="off" class="layui-input" style="width:200px;"  disabled="disabled">
                  </div>
                </div>         
          </form>
<script type="text/javascript">
var myInfoMap = parent.myInfoMap;
$(document).ready(function(){
  		fnSetMsg();
});

layui.use('element', function(){
    var $ = layui.jquery
    ,element = layui.element; 
    //Tab的切换功能，切换事件监听等，需要依赖element模块
    });
layui.use(['form', 'layedit', 'laydate'], function(){
});

function fnSetMsg(){
		var imgurl =encodeURIComponent(myInfoMap.IMGURL); 
		imgurl = "<%=request.getContextPath() %>/back/getImg.action?imgurl="+imgurl;
		$("#demo1").attr("src",imgurl);
		$("#student_id").val(myInfoMap.STUDENT_ID);
		$("#realname").val(myInfoMap.REALNAME);
		$("#phone").val(myInfoMap.PHONE);
		$("#email").val(myInfoMap.EMAIL);
		if(myInfoMap.GENDER=="男"){
			$("#gender1").attr("checked", "checked");
		}
		if(myInfoMap.GENDER=="女"){
			$("#gender2").attr("checked", "checked");
		}
}
</script>
 </body>
</html>