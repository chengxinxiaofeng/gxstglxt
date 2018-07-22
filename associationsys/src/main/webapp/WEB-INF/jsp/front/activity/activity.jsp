<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>社团活动</title>
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
.activity-detailed{
	width:100%;
	height:auto;
	margin:0 auto;
   text-align:center;
   cursor:pointer;
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
.div-activity-content{
	float:left;
	margin-top:20px;
	width:30%;
	
}
.div-activity-content:hover{
	cursor:pointer;
	border:1px solid  #009688;
}
.div-activity-content-head,.div-activity-content-head2{
	color:red;
	font-size:20px;
	text-align:left;
}
.div-activity-body{
	
	margin-top:40px;
	text-align:left;
}
.div-activity-right{
	float:right;
}

</style>
<body >
	    <div class="div-notice" style="margin-top:10px">
          <div class="notic-head" style="font-size:20px">
             	 当前位置:<a href="javascript:;" onclick="parent.fnOpenPage(1)" style="cursor:pointer">首页</a>&nbsp;/&nbsp;<a class="notice-onclick" href="javascript:;">社团活动</a>
              	<hr>
          </div>
      </div>
      <div>
          <div class="div-notice-main" style="width:78%;float:left;">                     
          </div>    
      </div>
      <div class="div-news" style="margin-top:10px;">
                        <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief" tyle="height: 300px;">
                          <ul class="layui-tab-title" id="ul-tab">
                          <!-- &#xe705; -->
                            <li class="layui-this" id="0" style="font-size: 24px; "><i class="layui-icon" style="font-size: 24px; "> &#xe637;</i>近期活动<i style="font-size: 15px;">&nbsp;Activity Preview</i>
                            </li>
                          <li style="font-size: 24px;" id="1"><i class="layui-icon" style="font-size: 24px; ">&#xe632; </i>往期活动<i style="font-size: 15px;">&nbsp;Past Activity</i></li>                  
                          </ul>
                          <div class="layui-tab-content" >
                            <div class="layui-tab-item layui-show ">
                            	<div class="activity-precontent" >
                            		<div class="activity-detailed" >
							  			<div class="div-activity-content-head" >
								                                                隐藏年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
								        </div> 
								        <div class="div-activity-body" >
								                 <p class="p-activity-time">时间：2018.03.05 16:00</p>
								                 <br/>
								                 <p  class="p-activity-place">地点：成都信息工程大学H4312</p>
								         </div> 
								           <hr/>
							    	  </div>
							    	
							   	</div>
							   	<div class="activity-main" style="display:none">
							   			<div style="font-size:20px">
							   				<a class="ACTIVITY_THEME"  style="font-size:20px">活动主题：阿达撒科技大厦</a>	&nbsp;<a style="font-size:14px;text-align:center;"  class="CLICK_COUNT">20</a>
							   			</div>
			
							   			<div class="ACTIVITY_TIME" style="margin-top:20px;font-size:17px">
							   				活动时间：2017-07-045
							   			</div>
							   			<div class="ACTIVITY_PLACE" style="margin-top:20px;font-size:17px">
							   				地点：成都信息工程大学
							   			</div>
							   			<div class="ASSOCIATION_NAME" style="margin-top:20px;font-size:17px">
							   				组织社团：爱心6++协会
							   			</div>
							   			<div class="ACTIVITY_MASTER_NAME" style="margin-top:20px;font-size:17px">
							   				负责人：张永峰
							   			</div>
							   			<div class="ACTIVITY_MASTER_PHONE" style="margin-top:20px;font-size:17px">
							   				负责人联系电话：1848362075
							   			</div>
							   			<div class="ACTIVITY_CONTENT" style="margin-top:20px;font-size:17px">
											das
							   			</div>
							   		
							   	</div>
							    	  
                           </div>
                            <div class="layui-tab-item">
                         		<div class="activity-precontent2" >
                            		<div class="activity-detailed" >
							  			<div class="div-activity-content-head2" >
								                                                隐藏年03月26日四川大学艺术学院插画艺术研究协会与指导老师连超老师开学研讨会
								        </div> 
								        <div class="div-activity-body" >
								                 <p class="p-activity-time2">时间：2018.03.05 16:00</p>
								                 <br/>
								                 <p  class="p-activity-place2">地点：成都信息工程大学H4312</p>
								         </div> 
								           <hr/>
							    	  </div>
							    	
							   	</div>
							   	<div class="activity-main2" style="display:none">
							   			<div style="font-size:20px">
							   				<a class="ACTIVITY_THEME2"  style="font-size:20px">活动主题：阿达撒科技大厦</a>	&nbsp;<a style="font-size:14px;text-align:center;"  class="CLICK_COUNT2">20</a>
							   			</div>
			
							   			<div class="ACTIVITY_TIME2" style="margin-top:20px;font-size:17px">
							   				活动时间：2017-07-045
							   			</div>
							   			<div class="ACTIVITY_PLACE2" style="margin-top:20px;font-size:17px">
							   				地点：成都信息工程大学
							   			</div>
							   			<div class="ASSOCIATION_NAME2" style="margin-top:20px;font-size:17px">
							   				组织社团：爱心6++协会
							   			</div>
							   			<div class="ACTIVITY_MASTER_NAME2" style="margin-top:20px;font-size:17px">
							   				负责人：张永峰
							   			</div>
							   			<div class="ACTIVITY_MASTER_PHONE2" style="margin-top:20px;font-size:17px">
							   				负责人联系电话：1848362075
							   			</div>
							   			<div class="ACTIVITY_CONTENT2" style="margin-top:20px;font-size:17px">
											das
							   			</div>
							   		
							   	</div>                    
                            </div>
                        </div>
                    </div> 
                         <div id="demo1" ></div>   
                         <div id="demo2" ></div>   
          </div>
<script >
var tab_flag=0;
$(document).ready(function(){
		fnGetNoticCout(1);
		//首页点击活动处理
		fnSetIndexInfo();
});
function fnSetIndexInfo(){
	if(parent.activity_id!=""&&parent.activity_id!=undefined){
		fnGetGivenNoticeInfo(parent.activity_id);
		parent.activity_id="";
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
function Test2(count){
    layui.use(['laypage', 'layer'], function(){
   	  var laypage = layui.laypage
   	  ,layer = layui.layer;
   	   //总页数大于页码总数
   	    lyauiPage = laypage.render({
   	    elem: 'demo2'
   	    ,limit:12
   	    ,count: count //数据总数
   	     ,layout: ['count', 'prev', 'page', 'next',  'skip']
   	    ,jump: function(obj){

   	    			page = obj.curr;
   	    			fnGetNoticeData2(page)
   	    }
   	  });
 });
}

function fnGetNoticeData(page){	
	$.ajax({   	
        url: "getAllActivityPreviewData.action?page="+page+"&type=0",        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        	var data = data.list;
        	//alert(data.length);
        	$(".activity-precontent").empty();
        	for(var i = 0;i < data.length; i++){
				$(".activity-precontent").append("<div class='activity-detailed' onclick=fnGetGivenNoticeInfo("+"\""+data[i].ACTIVITY_ID+"\""+") ><div class='div-activity-content-head ' >"+ data[i].ACTIVITY_THEME+"</div> <div class='div-activity-body' ><p class='p-activity-time'>时间："+ data[i].ACTIVITY_TIME+"</p><br/><p  class='p-activity-place'>地点："+ data[i].ACTIVITY_PLACE+"</p></div><hr/> </div> ");
        	}
        	fnSetTest1($("html").height());
        },
        error: function (er) {          //失败，回调函数       
        	layer.msg('获取近期活动信息出错', {icon: 5});
        }
    });
}
function fnGetNoticeData2(page){	
	$.ajax({   	
        url: "getAllActivityPreviewData.action?page="+page+"&type=1",        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        	var data = data.list;
        	$(".activity-precontent2").empty();
        	for(var i = 0;i < data.length; i++){
				$(".activity-precontent2").append("<div class='activity-detailed' onclick=fnGetGivenNoticeInfo2("+"\""+data[i].ACTIVITY_ID+"\""+") ><div class='div-activity-content-head ' >"+ data[i].ACTIVITY_THEME+"</div> <div class='div-activity-body' ><p class='p-activity-time'>时间："+ data[i].ACTIVITY_TIME+"</p><br/><p  class='p-activity-place'>地点："+ data[i].ACTIVITY_PLACE+"</p></div><hr/> </div> ");
        	}
    	    fnSetTest1($("html").height());
        },
        error: function (er) {          //失败，回调函数       
        	layer.msg('获取近期活动信息出错', {icon: 5});
        }
    });
}
function fnGetNoticCout(page){	
	$("#demo2").css("display","none");
	$.ajax({   	
        url: "getAllActivityPreviewData.action?page="+page+"&type=0",        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
         	var count =data.count;
         	Test(count);
        },
    });
	$.ajax({   	
        url: "getAllActivityPreviewData.action?page="+page+"&type=1",        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
         	var count =data.count;
         	Test2(count);
        },
    });
}
function fnGetGivenNoticeInfo(activity_id){
	//alert("asddas "+news_id);
	$.ajax({   	
        url: "getGivenActivityPreviewData.action?activity_id="+activity_id,        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	   
        		$(".activity-precontent").css("display","none");
        		$("#demo1").css("display","none");  
        		$(".activity-main").css("display","");
        		$(".notic-head").empty();
        		var temp = "当前位置:<a href='javascript:;' onclick='parent.fnOpenPage(1)' style='cursor:pointer'>首页</a>&nbsp;/&nbsp;<a  href='javascript:;' onclick='fnChangeNoticeUrl()' >社团活动</a>&nbsp;/&nbsp;活动正文<hr>"
        		$(".notic-head").append(temp);
        		fnSetNoticeData(data);
        },
        error: function (er) {          //失败，回调函数       
        	layer.msg('获取活动信息出错', {icon: 5});
        }
    });
}
function fnGetGivenNoticeInfo2(activity_id){
	$.ajax({   	
        url: "getGivenActivityPreviewData.action?activity_id="+activity_id,        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	   
        	//	alert("长度"+data.length);
        		$(".activity-precontent2").css("display","none");
        		$("#demo2").css("display","none");  
        		$(".activity-main2").css("display","");
        		$(".notic-head").empty();
        		var temp = "当前位置:<a href='javascript:;' onclick='parent.fnOpenPage(1)' style='cursor:pointer'>首页</a>&nbsp;/&nbsp;<a  href='javascript:;' onclick='fnChangeNoticeUrl()' >社团活动</a>&nbsp;/&nbsp;活动正文<hr>"
        		$(".notic-head").append(temp);
        		fnSetNoticeData2(data);
        },
        error: function (er) {          //失败，回调函数       
        	layer.msg('获取活动信息出错', {icon: 5});
        }
    });
}
function fnChangeNoticeUrl(){
	
	$(".activity-precontent").css("display","");
	$(".activity-precontent2").css("display","");
	$(".activity-main").css("display","none");
	$(".activity-main2").css("display","none");
	if(tab_flag==0){
		$("#demo1").css("display","");
	}else if(tab_flag==1){
		$("#demo2").css("display","");
	}
	
	$(".notic-head").empty();
	var temp = "当前位置:<a href='javascript:;' onclick='parent.fnOpenPage(1)' style='cursor:pointer'>首页</a>&nbsp;/&nbsp;<a  href='javascript:;'  >社团活动</a><hr>"
	$(".notic-head").append(temp);
	 fnSetTest();
}
function fnSetNoticeData(data){
	$(".CLICK_COUNT").html("浏览量：["+data[0].CLICK_COUNT+"]");
	$(".ACTIVITY_THEME").html("活动主题："+data[0].ACTIVITY_THEME);
	$(".ACTIVITY_TIME").html("活动时间:"+data[0].ACTIVITY_TIME);
	$(".ACTIVITY_PLACE").html("地点:"+data[0].ACTIVITY_PLACE);
	$(".ASSOCIATION_NAME").html("组织社团:"+data[0].ASSOCIATION_NAME);
	$(".ACTIVITY_CONTENT").html("活动简介:"+data[0].ACTIVITY_CONTENT);
	$(".ACTIVITY_MASTER_NAME").html("负责人:"+data[0].ACTIVITY_MASTER_NAME);
	$(".ACTIVITY_MASTER_PHONE").html("负责人联系电话:"+data[0].ACTIVITY_MASTER_PHONE);
	setTimeout("fnSetTest1($('html').height())",1000);	
}
function fnSetNoticeData2(data){
	$(".CLICK_COUNT2").html("浏览量：["+data[0].CLICK_COUNT+"]");
	$(".ACTIVITY_THEME2").html("活动主题："+data[0].ACTIVITY_THEME);
	$(".ACTIVITY_TIME2").html("活动时间:"+data[0].ACTIVITY_TIME);
	$(".ACTIVITY_PLACE2").html("地点:"+data[0].ACTIVITY_PLACE);
	$(".ASSOCIATION_NAME2").html("组织社团:"+data[0].ASSOCIATION_NAME);
	$(".ACTIVITY_CONTENT2").html("活动简介:"+data[0].ACTIVITY_CONTENT);
	$(".ACTIVITY_MASTER_NAME2").html("负责人:"+data[0].ACTIVITY_MASTER_NAME);
	$(".ACTIVITY_MASTER_PHONE2").html("负责人联系电话:"+data[0].ACTIVITY_MASTER_PHONE);
	setTimeout("fnSetTest1($('html').height())",1000);	
}
layui.use('element', function(){
	  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块	  
	  //监听导航点击
	  element.on('nav(demo)', function(elem){
	    layer.msg(elem.text());
	  });
	  
	  element.on('tab(docDemoTabBrief)', function(data){
		  //console.log(this); //当前Tab标题所在的原始DOM元素
		  //console.log(data.index); //得到当前Tab的所在下标
		  //console.log(data.elem); //得到当前的Tab大容器
		  tab_flag = data.index;
		  if(data.index==0){
			  $("#demo1").css("display","");
			  $("#demo2").css("display","none");	  
		  }else{
			  $("#demo1").css("display","none");
			  $("#demo2").css("display","");	
		  }
		  fnSetTest1($("html").height());
		});
	});


</script>
</body>
</html>