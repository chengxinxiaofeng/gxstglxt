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
  <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
  <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/icon1.png" type="image/x-icon" />
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js" data-appid="101467112" data-redirecturi="http://localhost:8080/associationsys/adminLogin/openQqLoginWin.action" charset="utf-8"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
 <div class="layui-logo" style="font-size:20px;cursor:pointer" onclick="fnTabChange(9)">高校社团管理系统&nbsp;<i class="layui-icon" style="font-size:20px">&#xe609;</i></div>
  <!--   头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;" id="myname">
          <img src="<%=request.getContextPath() %>/resources/img/img_head1.png"  id="demo1"  class="layui-nav-img">
        </a>
        <dl class="layui-nav-child">
       	  <dd><a href="javascript:;" onclick="fnPesonInfo()">个人资料</a></dd>
          <dd><a href="javascript:;" onclick="fnRePwd()">修改密码</a></dd>
          <dd><a href="javascript:;" onclick="fnLoginOut()">退出</a></dd>
        </dl>
      </li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
<!--       左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test1">
      <li class="layui-nav-item  layui-nav-itemed layui-this"><a href="javascript:;" onclick="fnTabChange(9)">&nbsp;<i class="layui-icon">&#xe68e;</i>&nbsp;首页</a>
        </li>
        <li class="layui-nav-item">          
          <a class="" href="javascript:;">&nbsp;<i class="layui-icon">&#xe614;</i>&nbsp;活动管理</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;" onclick="fnTabChange(1)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe63c;</i>&nbsp;发起活动</a></dd>
            <dd><a href="javascript:;" onclick="fnTabChange(2)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe631;</i>&nbsp;历史活动</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;"><i class="layui-icon">&#xe613;</i>&nbsp;成员管理</a>
          <dl class="layui-nav-child">
           <dd><a href="javascript:;" onclick="fnTabChange(3)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe629;</i>&nbsp;成员画像</a></dd>
           <dd><a href="javascript:;" onclick="fnTabChange(4)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe6b2;</i>&nbsp;新成员审批</a></dd>
           <dd><a href="javascript:;" onclick="fnTabChange(5)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe62c;</i>&nbsp;成员统计</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;"><i class="layui-icon">&#xe60a;</i>&nbsp;新闻管理</a>
          <dl class="layui-nav-child">
           <dd><a href="javascript:;" onclick="fnTabChange(8)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe629;</i>&nbsp;发布新闻</a></dd>
           <dd><a href="javascript:;" onclick="fnTabChange(7)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="layui-icon">&#xe6b2;</i>&nbsp;历史新闻</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">  <dd><a href="javascript:;" onclick="fnTabChange(6)"><i class="layui-icon">&#xe698;</i>&nbsp;物资管理</a></dd></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body" style="margin-left:10px;margin-top:10px;" >
          <span class="layui-breadcrumb span-bar">
            </span>
            <hr>
<iframe src=""  id="myframe" width="100%" height="92%" id="iframetest" scrolling="no" frameborder="0"> </iframe>
<!-- <iframe src="openCommonUserIframe.action"  id="myframe" width="100%" height="100%;" id="iframetest" scrolling="auto" frameborder="0"> </iframe> -->
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
layui.use('upload', function(){});
   var element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
layui.use('element', function(){
  var $ = layui.jquery
  ,element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
});
function fnTabChange(index){
	//发起活动
	if(index == "1"){
		$(".span-bar").empty();
		$(".span-bar").append("<a href='#' style='font-size:15px' >活动管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;发起活动</a>");
		$("#myframe").attr("src","openStartActivityIframe.action");
	}
	//成员画像
	if(index == "3"){
			$(".span-bar").empty();
			$("#myframe").attr("scrolling","no");
			$(".span-bar").append("<a href='#' style='font-size:15px' >成员管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;成员画像</a>");
			$("#myframe").attr("src","openCommonUserIframe.action");
	}
	//历史活动
	if(index == "2"){
		$(".span-bar").empty();
		$("#myframe").attr("scrolling","no");
		$(".span-bar").append("<a href='#' style='font-size:15px' >活动管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;历史活动</a>");
		$("#myframe").attr("src","openHistoryActivityIframe.action");
	    $("#myframe").attr("scrolling","no");
	}
	//成员审批
	if(index == "4"){
		$(".span-bar").empty();
		$(".span-bar").append("<a href='#' style='font-size:15px' >成员管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;新成员审批</a>");
		$("#myframe").attr("src","openCommonUserVerifyIframe.action");
	}
	//成员分布 
	if(index == "5"){
		$(".span-bar").empty();
		$("#myframe").attr("scrolling","no");
		$(".span-bar").append("<a href='#' style='font-size:15px' >成员管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;成员统计</a>");
		$("#myframe").attr("src","openCommonUserBarIframe.action");
	}
	//物资管理
	if(index == "6"){
		$(".span-bar").empty();
		$("#myframe").attr("scrolling","no");
		$(".span-bar").append("<a href='#' style='font-size:15px' >物资管理&nbsp;&nbsp;/</a>");
		$("#myframe").attr("src","opeGoodsIframe.action");
	}
	//历史新闻
	if(index == "7"){
		$(".span-bar").empty();
		$("#myframe").attr("scrolling","no");
		$(".span-bar").append("<a href='#' style='font-size:15px' >新闻管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;历史新闻</a>");
		$("#myframe").attr("src","opeNewsIframe.action");
	}
	//新闻管理——添加新闻
	if(index == "8"){
		$(".span-bar").empty();
		$("#myframe").attr("scrolling","auto");
		$(".span-bar").append("<a href='#' style='font-size:15px' >新闻管理</a><a href='#' style='font-size:15px'>&nbsp;&nbsp;/&nbsp;&nbsp;发布新闻</a>");
		$("#myframe").attr("src","announceNews.action");
	}
	//打开首页
	if(index == "9"){
		$(".span-bar").empty();
		$("#myframe").attr("scrolling","no");
		$(".span-bar").append("<a href='#' style='font-size:15px' >首页</a>");
		$("#myframe").attr("src","openMasterFirst.action");
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
	   			associationInfoMap=data.associationInfoMap;
	   			var imgurl =encodeURIComponent(myInfoMap.IMGURL); 
	   			imgurl = "<%=request.getContextPath() %>/back/getImg.action?imgurl="+imgurl;	
	   			$("#demo1").attr("src",imgurl);
	   			$("#myname").append(myInfoMap.REALNAME);
	   			fnTabChange(9);
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
        area : ['370px' , '550px'],
        content: 'openMasterInfo.action'
        
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