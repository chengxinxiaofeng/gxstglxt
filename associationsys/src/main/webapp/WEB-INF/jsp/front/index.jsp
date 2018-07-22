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
</head>
<body style="margin:0px;padding:0px;width:100%;height:atuo;">
        <img src="<%=request.getContextPath()%>/resources/img/bar_logo3.png">
        <a  style="position:absolute;height:67px;line-height:67px;
       right:20px;color:#009688;cursor:pointer;font-size:15x"
         href="javascript:;" onclick="fnToLoin()"
        >登录<%-- /tomcat11111/**<%=session.getId() %>**/ --%></a>
        <div  id="div-main" style="min-width:1200px;" >    
                <ul class="layui-nav layui-bg-green ur_bar"  >
                  <li class="layui-nav-item layui-this"><a href="javascript:;" onclick="fnOpenPage(1)">首页</a></li>
                       <li class="layui-nav-item">
                    <a href="javascript:;">社团快讯</a>
                    <dl class="layui-nav-child">
                      <dd><a href="javascript:;" onclick="fnOpenPage(2)">公告</a></dd>
                      <dd><a href="javascript:;" onclick="fnOpenPage(3)">新闻</a></dd>
                    </dl>
                  </li>
                  <li class="layui-nav-item" ><a  href="javascript:;" onclick="fnOpenPage(4)">社团活动</a></li>
                  <li class="layui-nav-item"><a href="javascript:;" onclick="fnOpenPage(6)">社团检索</a></li>
                  <li class="layui-nav-item"><a  href="javascript:;" onclick="fnOpenPage(5)">社团申请</a></li>
                </ul>
                 <!--  <iframe src="openFirst.action"  id="myframe" width="100%" height="910px" id="iframetest" min-width="1200px"  scrolling="no" frameborder="0"> </iframe>   -->
                  <iframe src="openFirst.action"  id="myframe" width="100%" height="1200px"  min-height="1000px"  min-width="1200px"  scrolling="no" frameborder="0"> </iframe> 
        </div>
        <div class="div-bottom" style="width:100%;min-width:1200px">
              <hr  style="height:3px;border:none;border-top:2px ridge  #009688;"/>
              <div clas="div-botom-main" style="width:100%;height:100px;line-height:100px;background-color:#009688;text-align:center ;color:white; " >
            版权所有©高校社团管理系统&nbsp;&nbsp;<span>|</span>&nbsp;&nbsp;地址: 四川省成都市西南航空港经济开发区学府路一段24号&nbsp;&nbsp;<span>|&nbsp;&nbsp;</span>邮编：610225 <span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>邮箱：940824469@qq.com<span>
              </div>
        </div>
<script >
var mainWidth;
var news_id;
var activity_id
$(document).ready(function(){
            fnSetSize();
$(window).resize(function() {
     fnSetSize();
});
});


function fnSetSize(){
    var allWidth = document.documentElement.clientWidth;
    var avg_margin = 20;
    $("#div-main").css("margin","0 auto");
    mainWidth = allWidth-2*avg_margin;
    $("#div-main").css("width",mainWidth+"px");
   var allLiWidth = 0;
   for(var i = 0 ;i < $('ul li').length ; i++){
    allLiWidth+=$('ul>li').eq(i).width();
    }
      $(".ur_bar").css("padding-left",(mainWidth-allLiWidth)/2+"px");
      $('ul li').css("min-width","60px");
}

</script>
<script>
layui.use('element', function(){
  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
});

layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
   //图片轮播
  carousel.render({
    elem: '#test10'
    ,width: mainWidth+'px'
    ,height: '440px'
    ,interval: 4000
    ,anim: 'fade'
  });
     var ins3 = carousel.render({
    elem: '#test3'
    ,width: mainWidth+'px'
    ,height: '150px'
    ,interval: 4000
    ,anim: 'updown'
  });
  
  });
function fnOpenPage(flag){
  //首页
    if(flag==1){
        	  $("#myframe").attr("src","openFirst.action");
      //公告
    }else if(flag==2){
      		  $("#myframe").attr("src","<%=request.getContextPath() %>/notice/openNotice.action");
      //新闻 
    }else if(flag==3){
    	      $("#myframe").attr("src","<%=request.getContextPath() %>/notice/openNews.action");
    	      //社团活动
    }else if(flag==4){
    	      $("#myframe").attr("src","<%=request.getContextPath() %>/activity/openActivity.action");
    }
	  	//社团申请
	else if(flag==5){
	      $("#myframe").attr("src","<%=request.getContextPath() %>/association/openAddAssociation.action");
	}	//神团检索
    else if(flag==6){
	      $("#myframe").attr("src","<%=request.getContextPath() %>/association/openSearchAssociation.action");
	}
}
//跳转到登录
function fnToLoin(){
	 window.location.href ="<%=request.getContextPath() %>/adminLogin/login";
}
</script>


</body>

</html>