<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>高校社团管理系统—后台登录</title>
	<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
	<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101467112" data-redirecturi="http://localhost:8080/associationsys/adminLogin/openQqLoginWin.action" charset="utf-8"></script>
<style>
.div-page{
    position: absolute;
    width: 100%;
    height: 100%;
    background:url(<%=request.getContextPath() %>/resources/img/background_img.png);
    background-size:100% 100%;
    min-width: 768px;
}
.div-top-part {
    width: 100%;
    background-color:white;
}
.div-center-part {
    width: 100%;
    height: 75%;
}
.div-bottom-part{
    width: 100%;
    height: 10%;
}
.div-form{
    float: right;
    width: 27%;
    height: 80%;
    margin-right: 10%;
    border: 1px #009688 solid;
}
.div-button{
    position: absolute;
    float: right;
    background-color: #009688; 
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
.btn-shortmsg-login{
 	background-color: grey;
}
.div-last-bottom{
    float: right;

}



</style>


 
</head>

<body style="padding: 0px;margin: 0px;min-height:800px;">

    <div class="div-page">
        <div class="div-top-part">
         <img src="<%=request.getContextPath()%>/resources/img/logo_login4.png">
           <a style="float:right;height:74px;line-height:74px;
        margin-right:20px;color:#009688;cursor:pointer;font-size:15x"
         href="javascript:;" onclick="fnToIndex()"
        >返回</a>
        </div>
        <div class="div-center-part">
        <div class="div-form" style="min-width:367px;min-height:400px">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
              <ul class="layui-tab-title">
                <li class="layui-this" style="width:40%">账号密码登录</li>
                <li style="width:40%">短信验证码登录</li>
              </ul>
              <div class="layui-tab-content" style="height: auto;">
                <div class="layui-tab-item layui-show">
                <form class="layui-form" action="">
                                 <div class="layui-form-item" >
                <label class="layui-form-label" style="width:60px;">账号:</label>
                <div class="layui-input-block" >
                  <input type="text" name="username" id="username" lay-verify="required" autocomplete="off" placeholder="请输入账号" class="layui-input">
                </div>
             </div>
             <div class="layui-form-item" style="margin-bottom:0px">
             <label class="layui-form-label"  style="width:60px;">密码:</label>
             <div class="layui-input-block">
                 <input type="password" name="userpassword"  id="userpassword" lay-verify="pass" placeholder="请输入密码" autocomplete="off" class="layui-input">
            </div>
            </div>
               <div class="layui-inline" style="margin-top:15px">
                  <label class="layui-form-label" >验证码：</label>
                  <div class="layui-input-inline">
                    <input  name="usercode" id="usercode"   placeholder="请输入验证码" id="code" lay-verify="required" autocomplete="off" class="layui-input" style="width:150px;">
                  </div>

              </div>             
             <img id="imgSignCode"  style="margin-top:15px;margin-left:10px;height:auto; cursor:pointer;" src="get.action" onclick="reloadCode()" title="重新获取"/>
            <div class="layui-form-item" pane="">
                <label class="layui-form-label" style="width:60px;">记住密码</label>
                <div class="layui-input-block">
                    <input type="checkbox" id="checkbox" name="like1[write]" lay-skin="primary" title="" >
              </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">

                  <button class="layui-btn" lay-submit="" lay-filter="demo1" style="width:100%;">登录</button>
                </div>
          </div>
          </form>
            <span class="layui-breadcrumb div-last-bottom" lay-separator="|">
            	  <span id="qqLoginBtn"></span>
                  <a href="javascript:void(0);" onclick="fnForgetpwd()">忘记密码？</a>
                <!--   <a href="javascript:void(0);" onclick="fnRegiste()">注册账号</a> -->
                <!--   <img alt="QQ登录" id="qqLoginBtn" src="http://qzapp.qlogo.cn/qzapp/101467112/B9A9188577160AA61700566948F0519B/30"> -->
          		<!-- http://qzapp.qlogo.cn/qzapp/101467112/B9A9188577160AA61700566948F0519B/30 -->
                <!--  <a href="javascript:void(0);" onclick="qqLoginOut()">注销QQ</a> -->
                </span>
                </div>
                <div class="layui-tab-item">
                    
                         <div class="layui-tab-item layui-show">
                <form class="layui-form" >
                 <div class="layui-inline" style="width:100%">
                  <label class="layui-form-label">手机号码：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="phone" id="phoneNumber" lay-verify="required|phone" autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
              </div>
            <div class="layui-inline" style="margin-top:15px">
                  <label class="layui-form-label" >验证码：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="phone" id="code" lay-verify="required" autocomplete="off" class="layui-input" style="width:120px;">
                  </div>

              </div>
                <div class="div-button btnSendCode" style="margin-top:15px;height:auto">获取验证码</div>
          
        
            <div class="layui-form-item" style="margin-top:15px;">
                <div class="layui-input-block">

                  <button class="layui-btn btn-shortmsg-login" lay-submit="" lay-filter="demo2" style="width:100%;">登录</button>
                </div>
          </div>
          </form>

                </div>
                </div>
              </div>
            </div>       
        </div>
        </div>


        <div class="div-bottom-part">
        <div class="div-bottom" style="width:100%">
        </div>
        </div>
    </div>
<script type="text/javascript">
//QQ昵称
var nickname;
//QQ唯一标识，相当于QQ号
var openid;
//大小为30×30像素的QQ空间头像URL。
var figureurl;
//大小为50×50像素的QQ空间头像URL。
var figureurl_1;
//	大小为40×40像素的QQ头像URL
var figureurl_qq_1;
//QQ性别
var gender;
$(document).ready(function(){
		$("#username").focus();
    	fnGetImgCode();
    	fnResize();
    	fnChangeLoginStyle();
    	fnInitializeNamePwd();
    	fnPreLoginQQ();
 });
$(window).resize(function() {
     fnResize();
});
var InterValObj; //timer变量，控制时间 
var count = 120; //间隔函数，1秒执行 
var curCount;//当前剩余秒数 
function fnGetImgCode(){
    $(".btnSendCode").bind("click",function(){
    	
    	if($("#phoneNumber").val()==""){
 		   document.getElementById("phoneNumber").focus();
 		   layer.msg('请输入手机号码！',{icon:5});
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
 	        		 layer.tips('该账号还未注册！', '#phoneNumber');
 	        		 //layer.msg('该账号还未注册！');
 	        	 }else if(data.code == 1) {
 	        		 document.getElementById("code").focus();
 	        		  $(".btn-shortmsg-login").removeAttr("disabled");
 	        		  $(".btn-shortmsg-login").removeClass("btn-shortmsg-login");
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
}
  //请求后台发送验证码 TODO 
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
function fnForgetpwd(){
      layer.open({
            type: 2,
            title:['找回密码', 'font-size:16px;color:#0e375b;'],
            maxmin: false,
            shadeClose: true, //点击遮罩关闭层
            area : ['500px' , '320px'],
            content: 'openFindPwdWin.action'
          });
}
function fnRegiste(){
    layer.open({
            type: 2,
            title:['注册', 'font-size:16px;color:#0e375b;'],
            maxmin: false,
            shadeClose: true, //点击遮罩关闭层
            area : ['400px' , '600px'],
            content: 'register.html'
          });
}
function fnResize(){
  var heightmax =  $(".div-form").height(); 
    var heightmin =  $(".layui-tab").height(); 
    var avgMargin = (heightmax - heightmin)/2;
    $(".layui-tab-content").css("margin-top", avgMargin+'px');
    var  centerheight  =  $(".div-center-part").height();
    var avgcenter = (centerheight - heightmax)/2;
    $(".div-form").css("margin-top", avgcenter+'px');

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
    
  //监听提交
  form.on('submit(demo1)', function(data){
	//  alert(JSON.stringify(data.field));
	  $.ajax({
	    	
	        url: "userNameLogin.action",        //后台url
	        data:JSON.stringify(data.field),
	        contentType: "application/json",
	        type: "post",                   //类型，POST或者GET
	        dataType: 'json',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	        	
	        	//	alert("标志："+data);
	        		 if(data== 0){
	        		 document.getElementById("username").focus();
	        		 layer.tips('账号或密码错误', '#username', {
	        			  tips: [3, '#009688'],
	        			  time: 3000
	        			});
	        		 //社长登录
	        	 }else if(data == 1) {
	        		//layer.msg('登录成功');
	        		 //当勾选记住密码时
	        		 if($("input[type='checkbox']").is(':checked')){
	        			 //保存7天
	        			 setCookie('username1',escape($("#username").val()),7);
	        			 setCookie('userpassword1',escape($("#userpassword").val()),7);
	        		 }else{
	        			 //	alert("哈哈哈");
	        			  	delCookie('username1');
	        		        delCookie('userpassword1');
	        		 }
	        		window.location.href ="<%=request.getContextPath() %>/back/index.action";
	        	//超级管理员登录
	        	 }else if(data == 2) {
	        		//layer.msg('登录成功');
	        		 //当勾选记住密码时
	        		 if($("input[type='checkbox']").is(':checked')){
	        			 //保存7天
	        			 setCookie('username1',escape($("#username").val()),7);
	        			 setCookie('userpassword1',escape($("#userpassword").val()),7);
	        		 }else{
	        			 //	alert("哈哈哈");
	        			  	delCookie('username1');
	        		        delCookie('userpassword1');
	        		 }
	        		window.location.href ="<%=request.getContextPath() %>/admin/AdminIndex.action";
	        	
	        	 } else if(data == 3){
	        		 document.getElementById("usercode").focus();
	        		 layer.tips('验证码错误', '#usercode', {
	        			  tips: [3, '#009688'],
	        			  time: 3000,
	        			  icon:2
	        			});
	        	 }
	        		 //刷新验证码
	        		 reloadCode();
	        },
	        error: function (er) {          //失败，回调函数
	        
	        	layer.msg('登录出错', {icon: 5});
	        }
	    }); 

    return false;
  });
  //监听提交
  form.on('submit(demo2)', function(data){
	  $.ajax({
	    	
	        url: "shortMsgLogin.action",        //后台url
	        data: {                          //数据
	        	phoneNumber:$("#phoneNumber").val(),
	        	code:$("#code").val(),
	        },
	        type: "post",                   //类型，POST或者GET
	        dataType: 'html',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	        	
	        		//alert(data);
	        	if(data== 0){
	        		 document.getElementById("code").focus();
	        		 layer.tips('验证码错误', '#code');
	        	 }else if(data == 1) {
	        		 window.location.href = "<%=request.getContextPath() %>/back/index.action";
	        	 }else if(data == 2) {
	        		 window.location.href = "<%=request.getContextPath() %>/admin/AdminIndex.action";
	        	 }	        	
	        },
	        error: function (er) {          //失败，回调函数
	        
	        	layer.msg('短信验证码登录失败', {icon: 5});
	        }
	    });
	  
    return false;
  });
  
  
});
       
 function fnChangeLoginStyle(){
	  $(".btn-shortmsg-login").attr("disabled", "true"); 		
 }
 function reloadCode(){
		$("#imgSignCode").removeAttr("src");
		var haha = Math.random();
		$("#imgSignCode").attr("src","get.action"+haha);

	}
function  fnInitializeNamePwd(){
     if(decodeURIComponent(unescape(getCookie('username1')))!="" && decodeURIComponent(getCookie('userpassword1'))!=""){
   	 	 $("#username").val(decodeURIComponent(unescape(getCookie('username1'))));
		 $("#userpassword").val(getCookie('userpassword1'));
    }
 }
//设置cookie
function setCookie(name,value,day){
  var date = new Date();
  date.setDate(date.getDate() + day);
  document.cookie = name + '=' + value + ';expires='+ date;
};
//获取cookie
function getCookie(name){
  var reg = RegExp(name+'=([^;]+)');
  var arr = document.cookie.match(reg);
  if(arr){
    return arr[1];
  }else{
    return '';
  }
};
//删除cookie
function delCookie(name){
  setCookie(name,null,-1);
};
QC.Login({//按默认样式插入QQ登录按钮
		btnId:"qqLoginBtn"	//插入按钮的节点id
	});
function fnPreLoginQQ (){
	//从页面收集OpenAPI必要的参数。get_user_info不需要输入参数，因此paras中没有参数
	var paras = {};
	//用JS SDK调用OpenAPI
	QC.api("get_user_info", paras)
		//指定接口访问成功的接收函数，s为成功返回Response对象
		.success(function(s){
			//成功回调，通过s.data获取OpenAPI的返回数据
			//alert("获取用户信息成功！当前用户昵称为："+s.data.nickname);
			//window.location.href = "back.action";
			//alert("获取用户信息成功！当前用户头像为："+s.data.figureurl);
			//用户在QQ空间的昵称
			nickname = s.data.nickname;
			//大小为30×30像素的QQ空间头像URL。
			figureurl = s.data.figureurl;
			//大小为50×50像素的QQ空间头像URL。
			figureurl_1 = s.data.figureurl_1;
			//大小为40×40像素的QQ头像URL。
			figureurl_qq_1 = s.data.figureurl_qq_1;
			//QQ性别
			gender = s.data.gender
		
		})
		//指定接口访问失败的接收函数，f为失败返回Response对象
		.error(function(f){
			//失败回调
			alert("获取用户信息失败！");
		})
		//指定接口完成请求后的接收函数，c为完成请求返回Response对象
		.complete(function(c){
			//完成请求回调
		//	alert("哈哈哈");
			if(QC.Login.check()){//如果已登录  
			    QC.Login.getMe(function(openId, accessToken){  
					openid = openId;
					//alert(openid);
					fnAfterLoginQQ();
			        //alert(["当前用户的", "openId为："+openId, "accessToken为："+accessToken].join("\n"));  
			    });  
			    //OpenID是每个QQ唯一的，可用于绑定会员，请在本页配置数据库，写入用户表！ 
			    //同时先加入用户表查询判断，如果用户表里面存在OpenID,则无需重新授权也无需入库，登录后直接跳转后台，
			}  
	    //OpenID是每个QQ唯一的，可用于绑定会员，请在本页配置数据库，写入用户表！ 
	    //同时先加入用户表查询判断，如果用户表里面存在OpenID,则无需重新授权也无需入库，登录后直接跳转后
		});
		
}
function fnAfterLoginQQ(){
/* 	alert("openid:"+openid);
	alert("nickname:"+nickname);
	alert("figureurl:"+figureurl);
	alert("figureurl_1:"+figureurl_1);
	alert("figureurl_qq_1:"+figureurl_qq_1);
	alert("gender:"+gender); */
	//alert("openid:"+openid);
	var data = {                          //数据
    	openid:openid,
    	nickname:nickname,
    	figureurl:figureurl,
    	figureurl_1:figureurl_1,
    	figureurl_qq_1:figureurl_qq_1,
    	gender:gender
    };
	  $.ajax({
	    	
	        url: "qqLogin.action",        //后台url
	        data:JSON.stringify(data),
	        contentType: "application/json",
	        type: "post",                   //类型，POST或者GET
	        dataType: 'html',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	   
	        	//登录成功
	        	if(data == "1"){
	        		 window.location.href ="<%=request.getContextPath() %>/back/index.action";
	        	//登录失败	
	        	}else{
	        		layer.msg('QQ登录失败', {icon: 5});
	        	}
	        },
	        error: function (er) {          //失败，回调函数        
	        	layer.msg('QQ登录出错', {icon: 5});
	        }
	    });
}
function qqLoginOut(){
	QC.Login.signOut();
}

//跳转到首页
function fnToIndex(){
	 window.location.href ="<%=request.getContextPath() %>/index/first";
}
</script>		
</body>
</html>