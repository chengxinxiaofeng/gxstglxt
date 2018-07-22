<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>校级管理员首页</title>
  <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
  <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
</head>
<body class="layui-layout-body">

<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th width="25%" align="center" >头像</th>
       <th width="25%">登陆时间</th>
       <th width="25%" align="center" >用户名</th>
       <th width="25%">角色</th>
    </tr> 
  </thead>
  <tbody>
    <tr>
     <td><img src="<%=request.getContextPath() %>/resources/img/img_head1.png" class="layui-nav-img" style="width:100px;height:100px;" id="demo1"></td>
     <td id="logintime">2018-06-12 18:08:08</td>
      <td id="myname">张永峰</td>
      <td>  <button class="layui-btn layui-btn-radius">校级管理员</button></td>
    </tr>
  </tbody>
</table>
<script>
var myInfoMap = parent.myInfoMap;
var associationInfoMap = parent.associationInfoMap;
$(document).ready(function(){   
	fnsetMyinfo();
 });
 function fnsetMyinfo(){
	 var imgurl =encodeURIComponent(myInfoMap.IMGURL); 
	 imgurl = "<%=request.getContextPath() %>/back/getImg.action?imgurl="+imgurl;
	 $("#demo1").attr("src",imgurl);
	 $("#myname").html(myInfoMap.REALNAME);
	 $("#logintime").html(associationInfoMap.LOGINTIME);
 }
</script>
</body>

</html>