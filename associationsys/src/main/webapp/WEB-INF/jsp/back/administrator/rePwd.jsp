<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>社团管理员/校级管理员修改密码</title>
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
                  <label class="layui-form-label">原密码：</label>
                  <div class="layui-input-inline">
                    <input type="password"   name="oldpwd" id="oldpwd"  lay-verify="required" autocomplete="off" class="layui-input" style="width:200px;">                 	
                  </div>
                </div>
                 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">新密码：</label>
                  <div class="layui-input-inline">
                    <input type="password"   name="newpwd1" id="newpwd1"  lay-verify="required|pass"  autocomplete="off" class="layui-input" style="width:200px;">
                 	
                  </div>
                </div>
                 <div class="layui-inline" style="width:100%;margin-top:15px;display:none;">
                  <label class="layui-form-label">学号：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="student_id" id="student_id"  lay-verify="required"  autocomplete="off" class="layui-input" style="width:200px;">          	
                  </div>
                </div>
                <div class="layui-inline" style="width:100%;margin-top:15px;display:none;">
                  <label class="layui-form-label">协会ID：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="association_id" id="association_id""  lay-verify="required"  autocomplete="off" class="layui-input" style="width:200px;">          	
                  </div>
                </div>
                <!-- 协会ID  隐藏开始 -->
                 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">确认密码：</label>
                  <div class="layui-input-inline">
                    <input type="password" name="newpwd2" id="newpwd2"  lay-verify="required|pass"  autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                </div>
            <div class="layui-form-item" style="margin-top:15px;">
                <div class="layui-input-block">
                  <button class="layui-btn btn-submit1" lay-submit=""  lay-filter="demo1" style="width:100%;">提交</button>
                  <button type="reset" class="layui-btn layui-btn-primary btn-reset" style="display:none">重置</button>
                </div>
          </div>
          </form>
<script type="text/javascript">
var myInfoMap = parent.myInfoMap;
$(document).ready(function(){
		$("#oldpwd").focus();
  		fnSetMsg();
});
function fnSetMsg(){
	$("#student_id").val(myInfoMap.STUDENT_ID);
	$("#association_id").val(myInfoMap.ASSOCIATION_ID);
}

layui.use('element', function(){
          var $ = layui.jquery
          ,element = layui.element; 
          //Tab的切换功能，切换事件监听等，需要依赖element模块
          });
       layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  //监听提交
  form.on('submit(demo1)', function(data){
	if($("#newpwd1").val().length<6){
		layer.msg("密码不能小于6位", {icon: 5});
		$("#newpwd1").focus();
		return false;
	}else if($("#newpwd1").val()!=$("#newpwd2").val()){
		layer.msg("密码不一致", {icon: 5});
		$("#newpwd1").focus();
		return false;
	}else if($("#newpwd1").val()==myInfoMap.PWD){
		layer.msg("新密码不能与旧密码一致", {icon: 5});
		$("#newpwd1").focus();
		return false;
	}else if(myInfoMap.PWD!=$("#oldpwd").val()){
		layer.msg("原密码不正确", {icon: 5});
		$("#oldpwd").focus();
		return false;
	}
    $.ajax({
    	
        url: "<%=request.getContextPath() %>/admin/updatePwd.action",        //后台url
        data:JSON.stringify(data.field),
        contentType: "application/json",
        type: "post",                   //类型，POST或者GET
        dataType: 'html',              //数据返回类型，可以是xml、json等
        beforeSend:function(){
        	//提交按钮不可用
        	$(".btn-submit1").attr("disabled", "true");
    		$(".btn-submit1").addClass("btn-sumit");
        },
        success: function (data) {      //成功，回调函数 	   
				if(data==1){
					layer.msg("修改密码成功", {icon: 1});
				
				}else{
					layer.msg("修改密码失败", {icon: 5});
				}
        },
        error: function (er) {          //失败，回调函数
        	layer.msg("修改密码出错", {icon: 5});
        }
    });    
    return false;
  });
  
  
});
function fnSetEnable(){
	  $(".btn-submit1").removeAttr("disabled"); 
	  $(".btn-submit1").removeClass("btn-sumit"); 
}

//提交按钮置灰
function fnSubmit(){
		$(".btn-submit1").attr("disabled", "true");
		$(".btn-submit1").addClass("btn-sumit");
}
</script>
 </body>
</html>