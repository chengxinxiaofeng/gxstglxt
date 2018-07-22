<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>找回密码</title>
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
.btn-next-step{
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
	/*获取验证码按钮结束*/
	/* 确定按钮 */
.btn-confirm{
	   background-color: grey;
	}
		</style>

	</head>

	<body>
		<div class="main">
			<div id="step" style="width:400px;margin-top:0px;"></div>
		</div>
		<form class="layui-form form1" >
                 <div class="layui-inline" style="width:100%">
                  <label class="layui-form-label">手机号码：</label>
                  <div class="layui-input-inline">
                    <input type="tel"  id="phoneNumber" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
              </div>
            <div class="layui-inline" style="margin-top:15px">
                  <label class="layui-form-label" >验证码：</label>
                  <div class="layui-input-inline">
                    <input type="tel"  id="code" name="phone"  lay-verify="required" autocomplete="off" class="layui-input" style="width:120px;">
                  </div>

              </div>
                <div class="div-button btnSendCode " style="margin-top:15px;height:auto">获取验证码</div>
          
        
            <div class="layui-form-item" style="margin-top:15px;">
                <div class="layui-input-block">
                  <button class="layui-btn btn-next-step" lay-submit="" lay-filter="demo1" style="width:100%;">下一步</button>
                </div>
          </div>
          </form>

          <form class="layui-form form2" >
               <div class="layui-inline" style="width:100%">
                  <label class="layui-form-label">新密码：</label>
                  <div class="layui-input-inline">
                    <input  type="password" id="newpwd1"  onblur="checkNewPwd()" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input"
                    style="width:200px;">
                  </div>
              </div>
               <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">确认密码：</label>
                  <div class="layui-input-inline">
                   	   <input  type="password" id="newpwd2" name="password" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input"
                    style="width:200px;">
                  </div>
              </div>               
            <div class="layui-form-item" style="margin-top:15px;">
                <div class="layui-input-block">
                  <button class="layui-btn btn-confirm"  lay-submit="" lay-filter="demo2" style="width:100%;">确定</button>
                </div>
          </div>
          </form>
 </body>
		<script type="text/javascript">
			  $(document).ready(function(){
			  	$(".form2").hide();
			    $(".btn-next-step").attr("disabled", "true"); 
			    $(".btn-confirm").attr("disabled", "true"); 
			  	fnGetImgCode();
				});


			var $step = $("#step");
			var $index = $("#index");

			$step.step({
				index: 0,
				time: 500,
				title: ["校验身份", "设置新密码", "完成"],
			});

			$index.text($step.getIndex());

			$("#prevBtn").on("click", function() {
				$step.prevStep();
				$index.text($step.getIndex());
			});

			$("#nextBtn").on("click", function() {
				$step.nextStep();
				$index.text($step.getIndex());
			});

			$("#btn1").on("click", function() {
				$step.toStep(1);
				$index.text($step.getIndex());
			});

			$("#btn2").on("click", function() {
				$step.toStep(2);
				$index.text($step.getIndex());
			});
</script>
<script type="text/javascript">
	var InterValObj; //timer变量，控制时间 
var count = 120; //间隔函数，1秒执行 
var curCount;//当前剩余秒数 
function fnGetImgCode(){	
	
   $(".btnSendCode").bind("click",function(){
	   if($("#phoneNumber").val()==""){
		   document.getElementById("phoneNumber").focus();
		   layer.msg('请输入手机号码！', {icon: 5});
	   }else{
	    $.ajax({
	    	
	        url: "findPwdGetCode.action",        //后台url
	        data: {                          //数据
	        	phoneNumber:$("#phoneNumber").val(),
	        },
	        type: "post",                   //类型，POST或者GET
	        dataType: 'json',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数
	        	
	        	 if(data.code == 0){
	        		 document.getElementById("phoneNumber").focus();
	        		 layer.msg('该账号还未注册！');
	        	 }else if(data.code == 1) {
	        		 document.getElementById("code").focus();
	        		  $(".btn-next-step").removeAttr("disabled");
	        		  $(".btn-next-step").removeClass("btn-next-step");
	        		 layer.msg('验证码发送成功！');
	        	 }
	        	// alert("Ajax请求成功"+data.code);
	        },
	        error: function (er) {          //失败，回调函数
	        
	            alert("验证新密码失败！");
	        }
	    });   
       	　curCount = count; 
     　　	//设置button效果，开始计时 
        $(".btnSendCode").attr("disabled", "true"); 
        $(".btnSendCode").html(curCount + "秒后可重新发送"); 
        //让验证码不可点击
        $(".btnSendCode").unbind("click");
        $(".btnSendCode").addClass("div-disabled");
        $('.btnSendCode').css("cursor", "default");
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次 
     　　  
       //请求后台发送验证码 TODO 
	   }

});
}
//timer处理函数 
function SetRemainTime() { 
      if (curCount == 0) {         
        window.clearInterval(InterValObj);//停止计时器 
     $(".btnSendCode").removeClass("div-disabled");
     $('.btnSendCode').css("cursor", "pointer");
          fnGetImgCode();
        $(".btnSendCode").html("重新发送验证码"); 
      } 
      
      else { 
        curCount--; 
        $(".btnSendCode").html(curCount + "秒后可重新发送"); 
      } 
    }

   layui.use('element', function(){
          var $ = layui.jquery
          ,element = layui.element; 
          //Tab的切换功能，切换事件监听等，需要依赖element模块
          });
       layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit;
  
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听提交
  form.on('submit(demo1)', function(data){
    $.ajax({
    	
        url: "checkFindPwdCode.action",        //后台url
        data: {                          //数据
        	phoneNumber:$("#phoneNumber").val(),
        	code:$("#code").val()
        },
        type: "post",                   //类型，POST或者GET
        dataType: 'html',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
        		if(data==1){
        			$step.toStep(1);
        		  	$(".form1").hide();
        		  	$(".form2").show();
        		}else if(data==0){
        			document.getElementById("code").focus();
        			layer.msg("验证码错误！");
        		}
        },
        error: function (er) {          //失败，回调函数
        
            alert("验证码发送失败！");
        }
    });
    return false;
  });
  
  
  
//监听提交
  form.on('submit(demo2)', function(data){
	  if($("#newpwd1").val() != $("#newpwd2").val()){
	    	document.getElementById("newpwd1").focus();
	    	layer.tips('两次密码不一致', '#newpwd1');
	        return false;	
	    }
    $.ajax({
    	
        url: "commitNewPwdController.action",        //后台url
        data: {                          //数据
        	newpwd1:$("#newpwd1").val(),
        },
        type: "post",                   //类型，POST或者GET
        dataType: 'html',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数
        		if(data==1){
        			$step.toStep(2);
        			layer.msg("修改密码成功！");
        		  	$(".form2").hide();
        		}else{
        			
        			layer.msg("重置密码失败！");
        		}
        },
        error: function (er) {          //失败，回调函数
        
            alert("重置密码发生错误！");
        }
    });
    return false;
  });
  
});
 
function checkNewPwd(){
	 $.ajax({
	    	
	        url: "checkNewPwdController.action",        //后台url
	        data: {                          //数据
	        	newpwd1:$("#newpwd1").val(),
	        },
	        type: "post",                   //类型，POST或者GET
	        dataType: 'html',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数
	        		if(data==1){
	        			document.getElementById("newpwd2").focus();
	        			$(".btn-confirm").removeAttr("disabled");
	        			$(".btn-confirm").removeClass("btn-confirm");
	        		}else if(data==0){
	        			document.getElementById("newpwd1").focus();
	        			layer.tips('新密码不能与旧密码相同', '#newpwd1');
	        		}
	        },
	        error: function (er) {          //失败，回调函数
	        
	            alert("验证新密码失败！");
	        }
	    });
		
}
</script>
</html>