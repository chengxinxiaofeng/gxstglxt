<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>高校社团管理系统</title>
 
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
  <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/icon1.png" type="image/x-icon" />
  <script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101467112" data-redirecturi="http://localhost:8080/associationsys/adminLogin/openQqLoginWin.action" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo" style="font-size:20px;cursor:pointer" onclick="fnTabChange(8)">高校社团管理系统&nbsp;<i class="layui-icon" style="font-size:20px">&#xe609;</i></div>
  <!--   头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;" id="myname">
          <img src="<%=request.getContextPath() %>/resources/img/img_head1.png" class="layui-nav-img" id="demo1">
   			
        </a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;" onclick="fnPesonInfo()">个人资料</a></dd>
          <dd><a href="javascript:;" onclick="fnRePwd()">修改密码</a></dd>
          <dd><a href="javascript:;" onclick="fnLoginOut()">退出</a></dd>
        </dl>
      </li>
    <!--   <li class="layui-nav-item"><a href="">退出</a></li> -->
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
<!--       左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test1">
      <li class="layui-nav-item  layui-nav-itemed layui-this"><a href="javascript:;" onclick="fnTabChange(8)">&nbsp;<i class="layui-icon">&#xe68e;</i>&nbsp;首页</a>
        </li>
        <li class="layui-nav-item ">
          
          <a class="" href="javascript:;">&nbsp;<i class="layui-icon">&#xe614;</i>&nbsp;社团管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="fnTabChange(1)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe63c;</i>&nbsp;社团审批</a></dd>
              <dd><a href="javascript:;" onclick="fnTabChange(2)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe631;</i>&nbsp;社团统计</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;"><i class="layui-icon">&#xe613;</i>&nbsp;活动管理</a>
          <dl class="layui-nav-child">
           <dd><a href="javascript:;" onclick="fnTabChange(3)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe629;</i>&nbsp;活动审批</a></dd>
           <dd><a href="javascript:;" onclick="fnTabChange(4)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe6b2;</i>&nbsp;活动统计</a></dd>
         </dl>
        </li>
        <li class="layui-nav-item"><a href="javascript:;" onclick="fnTabChange(7)"><i class="layui-icon">&#xe60a;</i>&nbsp;新闻管理</a>
        
         <dl class="layui-nav-child">
      		 	    <dd><a href="javascript:;" onclick="fnTabChange(5)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe629;</i>&nbsp;新闻审批</a></dd>
           	     	<dd><a href="javascript:;" onclick="fnTabChange(7)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe6b2;</i>&nbsp;新闻统计</a></dd>
        </dl>
        </li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body" style="margin-left:10px;margin-top:10px;" >
          <span class="layui-breadcrumb span-bar">
            </span>
            <hr>
<!-- <iframe src="openCommonUserIframe.action"  id="myframe" width="100%" height="92%" id="iframetest" scrolling="no" frameborder="0"> </iframe> -->
<iframe src="openAdminFirst.action"  id="myframe" width="100%" height="100%;" id="iframetest" scrolling="auto" frameborder="0"> </iframe>
<!--     内容主体区域
    <div style="padding: 15px;">内容主体区域</div> -->
  </div>
  
  <div class="layui-footer">
<!--     底部固定区域 -->
    Copyright 2014-2018 高校社团管理系统
  </div>
</div>
<script type="text/javascript">
var myInfoMap;
var associationInfoMap;
$(document).ready(function(){ 
	$(".span-bar").append("<a href='#' style='font-size:15px' >首页</a>");
	fnGetMyinfo();
 });

var news_id;

layui.use('upload', function(){});
/*  var $ = layui.jquery*/
   var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
});
function fnTabChange(index){
	//alert("??");
	//新社团审批
	if(index == "1"){
		$(".span-bar").empty();
		$(".span-bar").append("<a href='#' style='font-size:15px' >社团管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;新社团审批</a>");
		$("#myframe").attr("src","opencheckAssociationIframe.action");
	}
	//社团统计
	if(index == "2"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >社团管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;社团统计</a>");
			$("#myframe").attr("src","openCountAssociationIframe.action");
	}
	//活动审批
	if(index == "3"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >活动管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;活动审批</a>");
			$("#myframe").attr("src","opencheckActivityIframe.action");
	}
	//活动统计
	if(index == "4"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >活动管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;活动统计</a>");
			$("#myframe").attr("src","openCountActivityIframe.action");
	}
	//新闻审批
	if(index == "5"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >新闻管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;新闻审批</a>");
			$("#myframe").attr("src","opencheckNewsIframe.action");
	}
	//新闻统计
	if(index == "7"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >新闻管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;新闻统计</a>");
			$("#myframe").attr("src","openCountNewsIframe.action");
	}
	//打开新闻详情页面
	if(index == "6"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >新闻管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;新闻详情</a>");
			$("#myframe").attr("src","openNewsDetailIframe.action");
	}
	//打开首页
	if(index == "8"){
			$(".span-bar").empty();
			$(".span-bar").append("<a href='#' style='font-size:15px' >首页</a>");
			$("#myframe").attr("src","openAdminFirst.action");
	}
}

//获取个人身份信息
function fnGetMyinfo(){
	$.ajax({
	    	
	        url: "<%=request.getContextPath() %>/common/getMyInfo.action",        //后台url
	        type: "get",                   //类型，POST或者GET
	        dataType: 'json',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	        	
	        	myInfoMap = data.userInfoMap;
	        	associationInfoMap = data.associationInfoMap;
	   			var imgurl =encodeURIComponent(myInfoMap.IMGURL); 
	   			imgurl = "<%=request.getContextPath() %>/back/getImg.action?imgurl="+imgurl;	
	   			$("#demo1").attr("src",imgurl);
	   			$("#myname").append(myInfoMap.REALNAME);
	        },
	        error: function (er) {          //失败，回调函数
	        
	        }
	    }); 
	
}
function fnPesonInfo(){
	 layer.open({
         type: 2,
         title:['个人资料', 'font-size:16px;color:#0e375b;'],
         maxmin: false,
         shadeClose: true, //点击遮罩关闭层
         area : ['370px' , '480px'],
         content: 'openPersonInfo.action'
         
       });
	
}
function fnRePwd(){
	 layer.open({
         type: 2,
         title:['修改密码', 'font-size:16px;color:#0e375b;'],
         maxmin: false,
         shadeClose: true, //点击遮罩关闭层
         area : ['400px' , '300px'],
         content: 'openRePwd.action'         
       });
}
function fnLoginOut(){
	QC.Login.signOut();
	$.ajax({ 	
        url: "<%=request.getContextPath() %>/admin/loginOut.action",        //后台url
        type: "post",                   //类型，POST或者GET
        dataType: 'html',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        	window.location.href ="<%=request.getContextPath() %>/adminLogin/login.action";	
        },
        error: function (er) {          //失败，回调函数        
        	layer.msg('注销失败', {icon: 5});
        }
    }); 
}
</script>

</body>

</html>