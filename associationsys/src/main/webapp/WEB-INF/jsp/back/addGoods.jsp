<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>物资录入</title>
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
                  <label class="layui-form-label">物资名称：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="goods_name" id="goods_name"  lay-verify="required" autocomplete="off" class="layui-input" style="width:200px;">
                 	
                  </div>
                </div>
                 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">数量：</label>
                  <div class="layui-input-inline">
                    <input type="number"   name="goods_count" id="goods_count"  lay-verify="required" autocomplete="off" class="layui-input" style="width:200px;">
                 	
                  </div>
                </div>
                <!-- 协会ID  隐藏开始 -->
                 <div class="layui-inline" style="width:100%;margin-top:15px;display:none;">
                  <label class="layui-form-label">协会ID</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="association_id" id="associatio_id"  autocomplete="off" class="layui-input" style="width:200px;">
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
//协会ID
var associatio_id;
$(document).ready(function(){
		$("#goods_name").focus();
		//获取当前用户登陆的协会ID
		fnGetAssociationId();
});

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
  /*   layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    }); */
    $.ajax({
    	
        url: "addGoods.action",        //后台url
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
        	$(".btn-reset").trigger("click"); 
        	$("#goods_name").focus();
        	//给协会ID输入框赋值
        	fnGetAssociationId();
        	if(data==1){
        		//刷新数据
        		fnSetEnable();
        		window.parent.fnRefreshData();
        		layer.msg("物资录入成功", {icon: 1});
        	}else{
        		layer.msg("物资录入失败", {icon: 5});
        	}
        },
        error: function (er) {          //失败，回调函数
        	layer.msg("物资录入出错", {icon: 5});
        }
    });    
    return false;
  });
  
  
});

    layui.use(['form', 'layedit', 'laydate'], function(){
    	  var form = layui.form

    });
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
});
function fnGetAssociationId(){
	$.ajax({   	
        url: "getAssociationId.action",        //后台url
        type: "post",                   //类型，POST或者GET
        dataType: 'html',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        	associatio_id = data;	
        	$("#associatio_id").val(associatio_id);
        },
        error: function (er) {          //失败，回调函数
        	layer.msg("获取学院ID出错");
        }
    });
}
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