<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>前台首页</title>
  <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
  <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
  <link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/img/icon1.png" type="image/x-icon" />
</head>
<style>
.div-activity-content{
	float:left;
	margin-top:20px;
	width:30%;
	
}
.div-activity-content:hover{
	cursor:pointer;
	border:1px solid  #009688;
}
.div-activity-content-head{
	color:red;
	font-size:20px;
	max-width: 400px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}
.div-activity-body{
	
	margin-top:40px;
}
.div-activity-right{
	float:right;
}
.div-notic-left p:hover{
	cursor:pointer;
	color:#009688
}
.div-notic-right p:hover{
	cursor:pointer;
	color:#009688
}
.div-news-left p:hover{
	cursor:pointer;
	color:#009688;
}
.div-news-right p:hover{
	cursor:pointer;
	color:#009688;

}
.a-news-title{
	display:block;
	max-width:400px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float:left;
}
.a-news-title:hover{
cursor:pointer;
	color:#009688;
}
</style>
<body style="margin:0px;padding:0px;width:100%;min-width:1200px;">
     			  <div class="layui-carousel" id="test10" style="width:100%;">
                  <div carousel-item="">
                    <div  style="width:100%"><img  style="width:100%" src="<%=request.getContextPath() %>/resources/img/pic13.png"></div>
                    <div  style="width:100%"><img  style="width:100%" src="<%=request.getContextPath() %>/resources/img/pic4.png"></div>
                    <div  style="width:100%"><img  style="width:100%" src="<%=request.getContextPath() %>/resources/img/pic12.png"></div>
                    <div  style="width:100%"><img  style="width:100%" src="<%=request.getContextPath() %>/resources/img/pic11.png"></div>                     
                  </div>
                </div>
                <div class="div-activity" style="margin-top:5px">
                    <p  style="font-size: 24px;"><i class="layui-icon" style="font-size: 24px; ">&#xe637;</i>近期活动预告  <i style="font-size: 15px;">Activity Preview</i>
                    <a href="javascript:;" onclick="fnOpenDetailed2()" style="float:right;font-size: 15px;height：31px;line-height:31px">
                       
                        more
                         <i class="layui-icon" style="font-size: 15px; "> &#xe602;</i>
                    </a>
                    </p>
                    <hr>
                    <div class="layui-carousel" id="test3" lay-filter="test4">
                      <div carousel-item="" id="arousel-activity">
    					<div class="hide-activity  arousel0">
                           <div class="div-activity-content arousel-onclick0">
	                        	<div class="div-activity-content-head0 div-activity-content-head" >
	                        	03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time0">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place0">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>
                        	<div class="div-activity-content arousel-onclick0 div-activity-right arousel-right0  arousel-onclick1">
	                        	<div class="div-activity-content-head1 div-activity-content-head" >
	                        	2018年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time1">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place1">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>                      
                        </div>
						<div class="hide-activity arousel1">
                           <div class="div-activity-content arousel-onclick2">
	                        	<div class="div-activity-content-head2 div-activity-content-head" >
	                        	03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time2">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place2">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>
                        	<div class="div-activity-content div-activity-right  arousel-right1 arousel-onclick3">
	                        	<div class="div-activity-content-head3 div-activity-content-head" >
	                        	2018年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time3">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place3">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>                      
                        </div>
                        <div class="hide-activity arousel2">
                           <div class="div-activity-content arousel-onclick4">
	                        	<div class="div-activity-content-head4 div-activity-content-head" >
	                        	03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time4">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place4">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>
                        	<div class="div-activity-content div-activity-right  arousel-right2 arousel-onclick5">
	                        	<div class="div-activity-content-head5 div-activity-content-head" >
	                        	2018年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time5">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place5">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>                      
                        </div> 
                        <div class="hide-activity arousel3 ">
                           <div class="div-activity-content arousel-onclick6">
	                        	<div class="div-activity-content-head6 div-activity-content-head " >
	                        	03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time6">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place6">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>
                        	<div class="div-activity-content div-activity-right  arousel-right3 arousel-onclick7">
	                        	<div class="div-activity-content-head7 div-activity-content-head" >
	                        	2018年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time7">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place7">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>                      
                        </div>  
                        <div class="hide-activity arousel4 ">
                           <div class="div-activity-content arousel-onclick8">
	                        	<div class="div-activity-content-head8 div-activity-content-head " >
	                        	03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time8">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place8">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>
                        	<div class="div-activity-content div-activity-right  arousel-right4 arousel-onclick9">
	                        	<div class="div-activity-content-head9 div-activity-content-head" >
	                        	2018年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
	                        	</div> 
	                        	<div class="div-activity-body" >
	                        		<p class="p-activity-time9">时间：2018.03.05 16:00</p>
	                        		<br/>
	                        	    <p  class="p-activity-place9">地点：成都信息工程大学H4312</p>
	                        	</div> 
                        	</div>                      
                        </div>                     
                      </div>
                    </div> 
                </div>
                <div class="div-news" style="margin-top:10px;">
                        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" tyle="height: 300px;">
                          <ul class="layui-tab-title" id="ul-tab">
                          <!-- &#xe705; -->
                            <li class="layui-this" id="0" style="font-size: 24px; "><i class="layui-icon" style="font-size: 24px; "> &#xe705; </i>公告<i style="font-size: 15px;">&nbsp;Notice</i>
                            </li>
                          <li style="font-size: 24px;" id="1"><i class="layui-icon" style="font-size: 24px; "> &#xe660; </i>新闻<i style="font-size: 15px;">&nbsp;News</i></li>
                               <a href="javascript:;" onclick="fnOpenDetailed()" style="float:right;font-size: 15px;height：31px;line-height:31px">
                       
                        more
                         <i class="layui-icon" style="font-size: 15px; "> &#xe602;</i>
                    </a>
                          </ul>
                          <div class="layui-tab-content" style="height: 200px;">
                            <div class="layui-tab-item layui-show">
                            	
                            	<div class="div-notic-left" style="width:45%;float:left;margin-right:5px;">                      		
                            	</div>
                            	<div class="div-notic-right" style="width:45%;float:right;margin-left:5px;">
                     		
                            	</div>
                           </div>
                            <div class="layui-tab-item">
                            	<div class="div-news-left" style="width:45%;float:left;margin-right:5px;">                      		
                            	</div>
                            	<div class="div-news-right" style="width:45%;float:right;margin-left:5px;">                     		
                            	</div>                           
                            </div>
                        </div>
                    </div> 
                </div>
        </div>
 
<script >
var mainWidth;
var ins3;
$(document).ready(function(){
			//活动信息
		   fngetActivityData();
			//公告信息
		   fngetNoticeData();
		 	//新闻信息
		   fngetNewsData();
		   fnSetTest();
		   //tab事件
		   fnGetTabId();
           fnSetSize();
		   $(window).resize(function() {
    			 fnSetSize();
		   });
 });
function fnSetTest(){
	parent.document.getElementById("myframe").height=1000+"px";
}
function   fngetActivityData(){	
	$.ajax({   	
        url: "getActivityData.action",        //后台url
        type: "post",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	
    		var $hide = $(".hide-activity");
        	if(data.length!=0){
        		
        		for(var i = 0 ; i < data.length ;i++){
      						$(".div-activity-content-head"+i).html(data[i].ACTIVITY_THEME);
      						$(".p-activity-time"+i).html("时间："+data[i].ACTIVITY_TIME);
      						$(".p-activity-place"+i).html("地点："+data[i].ACTIVITY_PLACE);
      						var temp = data[i].ACTIVITY_ID;
      						$(".arousel-onclick"+i).attr("onclick","fnGetGivenInfo("+"\""+temp+"\""+")");
        		}
        		for(var i = (data.length/2).toFixed(0) ; i < 5;i++){  
        				$(".arousel"+i).remove();
        		}
        		if(parseInt(data.length/2) !=  (data.length/2)){
			 		$(".arousel-right"+parseInt(data.length/2)).remove();
			 	}
					ins3.reload();
        	}
        },
        error: function (er) {          //失败，回调函数
        	layer.msg('获取活动信息出错', {icon: 5});
        
        }
    });
}
function fngetNoticeData(){
	 $.ajax({
	    	
	        url: "getNoticeData.action",        //后台url
	        type: "post",                   //类型，POST或者GET
	        dataType: 'json',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	        	
	        	for(var i = 0;i < data.length; i++){
	        		if(i<=5){
	        			$(".div-notic-left").append("<p  onclick="+"fnGetGivenNoticeInfo("+"\""+data[i].NEWS_ID+"\""+")"+"><a class='a-news-title'>"+data[i].NEWS_TITLE+"</a><a style='float:right'>"+"["+data[i].REPORT_TIME+"]"+" </a></p><br/><br/><br/>");
	        		}else{
	        			$(".div-notic-right").append("<p onclick="+"fnGetGivenNoticeInfo("+"\""+data[i].NEWS_ID+"\""+")"+"><a class='a-news-title'>"+data[i].NEWS_TITLE+"</a><a style='float:right'>"+"["+data[i].REPORT_TIME+"]"+" </a></p><br/><br/><br/>");
	        		}
	        	}
	        },
	        error: function (er) {          //失败，回调函数
	        
	        	layer.msg('获取公告信息出错', {icon: 5});
	        }
	    });
}

function fngetNewsData(){
	 $.ajax({
	    	
	        url: "getNewsData.action",        //后台url
	        type: "post",                   //类型，POST或者GET
	        dataType: 'json',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	        	
	        	for(var i = 0;i < data.length; i++){
	        		if(i<=5){
	        			$(".div-news-left").append("<p onclick="+"fnGetGivenNesInfo("+"\""+data[i].NEWS_ID+"\""+")"+"><a class='a-news-title'>"+data[i].NEWS_TITLE+"</a><a style='float:right'>"+"["+data[i].REPORT_TIME+"]"+" </a></p><br/><br/><br/>");
	        		}else{
	        			$(".div-news-right").append("<p onclick="+"fnGetGivenNesInfo("+"\""+data[i].NEWS_ID+"\""+")"+"><a class='a-news-title'>"+data[i].NEWS_TITLE+"</a><a style='float:right'>"+"["+data[i].REPORT_TIME+"]"+" </a></p><br/><br/><br/>");
	        		}
	        	}
	        },
	        error: function (er) {          //失败，回调函数
	        
	        	layer.msg('获取新闻信息出错', {icon: 5});
	        }
	    });
}


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
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
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
    ,width: '100%'
    ,height: '440px'
    ,interval: 4000
    ,anim: 'fade'
  });
 	 ins3 = carousel.render({
    elem: '#test3'
    ,width: '100%'
    ,height: '150px'
    ,interval: 4000
    ,anim: 'updown'
    ,arrow:'none'
    ,indicator:'none'
  });
  
  });
  //打开活动详情页面
  function fnGetGivenInfo(tes){
	  parent.activity_id = tes;
	  parent. fnOpenPage(4);
	 //alert("ad"+ tes);
  }
  function fnGetGivenNesInfo(temp){
	  parent.news_id = temp;
	  parent. fnOpenPage(3);
  }
  function fnGetGivenNoticeInfo(temp){
	  
	  parent.news_id = temp;
	  parent. fnOpenPage(2);
  }
function fnGetTabId(){
	var $tab = $("#ul-tab");
	var $find = $tab.find(".layui-this"); // 选中项	
	return $($find).attr("id")	
}
function fnOpenDetailed(){
	var id = fnGetTabId();
	if(id == 0){
		 parent. fnOpenPage(2);
	}else{
		 parent. fnOpenPage(3);
	}
	
}
function fnOpenDetailed2(){
	 parent. fnOpenPage(4);
}
</script>


</body>

</html>