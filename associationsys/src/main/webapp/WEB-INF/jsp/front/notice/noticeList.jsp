<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>公告列表与公告详情</title>
<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
<style>
.a-news-title{
	display:block;
	max-width:600px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float:left;
	font-size:16px;
	
}
.a-news-title:hover{
	cursor:pointer;
	color:#009688;
}
.p-bg1{
	height:45px;
	line-height:45px;
	background-color:#f8f8f8;	
}
.p-bg2{
	height:45px;
	line-height:45px;
}
.notice-detailed{
	width:100%;
	height:auto;
	margin:0 auto;
   text-align:center;
}
.notice-detailed-title{
	width:100%;
	text-align:center;
	margin:10px auto;
	font-size:30px;
}
.notice-detailed-time,.notice-count,.notice-time,.notice-writer{
	font-size:14px;
	color:#999;
}
.notice-detailed-content{
	text-align:left;
	float:left;
}
.notice-detailed-flie{
	position:absolute;
	bottom:0px;
}
</style>
<body >
	    <div class="div-notice" style="margin-top:10px">
          <div class="notic-head" style="font-size:20px">
             	 当前位置:<a href="javascript:;" onclick="parent.fnOpenPage(1)" style="cursor:pointer">首页</a>&nbsp;/&nbsp;<a class="notice-onclick" href="javascript:;">公告</a>
              	<hr>
          </div>
      </div>
      <div>
          <div class="div-notice-main" style="width:78%;float:left;">                     
          </div>
           <div id="demo1" ></div>             
      </div>
      <div class="notice-detailed" style="display:none">
  			<div class="notice-detailed-title">
  			成都信息2016-2017学年学生社团精品项目评选结果公示
  			</div>
  			<div class="notice-detailed-time">
  					发布时间:<a class="notice-time">2017-08-12-11</a>&nbsp;&nbsp;作者：<a class="notice-writer">未知</a>&nbsp;&nbsp;浏览量：<a class="notice-count">10</a>
  			</div>
  			<div class="notice-detailed-content">
  				1<br/>
  				2<br/>
  				3<br/>
  				3<br/>
  				4<br/>
  				5<br/>
  				6<br/>
  			</div>
  			<div class="notice-detailed-flie">
  				
  			</div>
      </div>
<script >
$(document).ready(function(){
		fnGetNoticCout(1);
		//首页点击新闻处理
		fnSetIndexInfo();
});
function fnSetIndexInfo(){
	if(parent.news_id!=""&&parent.news_id!=undefined){
		fnGetGivenNoticeInfo(parent.news_id);
		parent.news_id="";
	}
}
function fnSetTest(){
	parent.document.getElementById("myframe").height=document.body.scrollHeight+"px";
}
function fnSetTest1(height){
		if(height<850){		
		height=850
		}
	parent.document.getElementById("myframe").height=height+"px";
}
function Test(count){
     layui.use(['laypage', 'layer'], function(){
    	  var laypage = layui.laypage
    	  ,layer = layui.layer;
    	   //总页数大于页码总数
    	    lyauiPage = laypage.render({
    	    elem: 'demo1'
    	    ,limit:12
    	    ,count: count //数据总数
    	     ,layout: ['count', 'prev', 'page', 'next',  'skip']
    	    ,jump: function(obj){

    	    			page = obj.curr;
    	    			fnGetNoticeData(page)
    	    }
    	  });
  });
}

function fnGetNoticeData(page){	
	$.ajax({   	
        url: "getAllNoticeData.action?page="+page,        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        	var data = data.list;
        	$(".div-notice-main").empty();
        	for(var i = 0;i < data.length; i++){
        			if(i%2==0){
        				$(".div-notice-main").append("<p  class='p-bg1' onclick="+"fnGetGivenNoticeInfo("+"\""+data[i].NEWS_ID+"\""+")"+"><a class='a-news-title'>"+data[i].NEWS_TITLE+"</a><a style='float:right'>"+"["+data[i].REPORT_TIME+"]"+" </a></p><br/>");  
        			}else{
        				$(".div-notice-main").append("<p  class='p-bg2'   onclick="+"fnGetGivenNoticeInfo("+"\""+data[i].NEWS_ID+"\""+")"+"><a class='a-news-title'>"+data[i].NEWS_TITLE+"</a><a style='float:right'>"+"["+data[i].REPORT_TIME+"]"+" </a></p><br/>");  
        			}
        	}
    	    fnSetTest();
        },
        error: function (er) {          //失败，回调函数       
        	layer.msg('获取公告信息出错', {icon: 5});
        }
    });
}
function fnGetNoticCout(page){	
	$.ajax({   	
        url: "getAllNoticeData.action?page="+page,        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
         	var count =data.count;
         	Test(count);
        },
    });
}
function fnGetGivenNoticeInfo(news_id){
	$.ajax({   	
        url: "getGivenNoticeData.action?news_id="+news_id,        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	     
        		$(".div-notice-main").css("display","none");
        		$("#demo1").css("display","none");  
        		$(".notice-detailed").css("display","");
        		$(".notic-head").empty();
        		var temp = "当前位置:<a href='javascript:;' onclick='parent.fnOpenPage(1)' style='cursor:pointer'>首页</a>&nbsp;/&nbsp;<a  href='javascript:;' onclick='fnChangeNoticeUrl()' >公告</a>&nbsp;/&nbsp;公告正文<hr>"
        		$(".notic-head").append(temp);
        		fnSetNoticeData(data,news_id);
        },
        error: function (er) {          //失败，回调函数       
        	layer.msg('获取公告信息出错', {icon: 5});
        }
    });
}
function fnChangeNoticeUrl(){
	$(".div-notice-main").css("display","");
	$(".notice-detailed").css("display","none");
	$("#demo1").css("display","");
	$(".notic-head").empty();
	var temp = "当前位置:<a href='javascript:;' onclick='parent.fnOpenPage(1)' style='cursor:pointer'>首页</a>&nbsp;/&nbsp;<a  href='javascript:;'  >公告</a><hr>"
	$(".notic-head").append(temp);
	 fnSetTest();
}
function fnSetNoticeData(data,news_id){
    var  Url;
    var fileName;
    $(".notice-detailed-flie").empty();
    for(var i = 0; i < data.fileList.length;i++){   
    	    url =encodeURIComponent(data.fileList[i].FILE_URL);
    	    fileName=encodeURIComponent(data.fileList[i].FILE_NAME);
    	    url = "getFile.action?fileUrl="+url+"&fileName="+fileName;
    		$(".notice-detailed-flie").append("<a href="+url+" style='float:left;display:block;' >"+"附："+data.fileList[i].FILE_NAME+"</a><hr>");
    }
	$(".notice-detailed-title").html(data.newsList[0].NEWS_TITLE);
	$(".notice-time").html(data.newsList[0].REPORT_TIME);
	$(".notice-writer").html(data.newsList[0].NEWS_WRITER);
	$(".notice-count").html(data.newsList[0].CLICK_COUNT);
	$(".notice-detailed-content").html(data.newsList[0].NEWS_CONTENT);
	setTimeout("fnSetTest1($('html').height())",600);	
}

</script>
</body>
</html>