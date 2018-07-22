<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>新增成员</title>
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
                <div class="layui-upload div-img-up">
                      <button type="button" class="layui-btn" id="test1"><i class="layui-icon">&#xe64a;</i>选择头像</button>
                      <img class="layui-upload-img layui-nav-img" style="width:100px;height:100px;" id="demo1">
                      <button type="button" class="layui-btn"id="test9"><i class="layui-icon">&#xe67c;</i>上传</button>
                      <div class="layui-upload-list">             
                        <p id="demoText"></p>
                      </div>
                </div> 
                 <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">学号：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="student_id" id="student_id" onchange="fnSetPwd()" onblur="fnCheckStudentId()" lay-verify="required" autocomplete="off" class="layui-input" style="width:200px;">
                 	
                  </div>
                </div>
                  <!-- 初始密码  隐藏开始 -->
                 <div class="layui-inline" style="width:100%;margin-top:15px;display:none;">
                  <label class="layui-form-label">初始密码:</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="pwd" id="pwd"  autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                 <!-- 初始密码    隐藏结束-->
                <!-- 协会ID  隐藏开始 -->
                 <div class="layui-inline" style="width:100%;margin-top:15px;display:none;">
                  <label class="layui-form-label">协会ID</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="association_id" id="associatio_id"  autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                 <!-- 协会ID  隐藏结束-->
                     <!-- 头像在服务器地址 隐藏开始 -->
                 <div class="layui-inline" style="width:100%;margin-top:15px;display:none;">
                  <label class="layui-form-label">头像在服务器地址</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="imgurl" id="imgurl"   autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                 <!-- 头像在服务器地址  隐藏结束-->
                <div class="layui-inline" style="width:100%;margin-top:15px;">
                  <label class="layui-form-label">姓名：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="realname" lay-verify="required"  autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                <div class="layui-form-inline" pane="" style="margin-top:15px;width:100%;" >
                  <label class="layui-form-label" style="padding-left:10px">性别:</label>
                  <div class="layui-input-block">
                    <input type="radio" name="gender" value="0" title="男" checked="">
                    <input type="radio" name="gender" value="1" title="女">
                  </div>
                </div>    
                <div class="layui-inline" style="width:100%">
                  <label class="layui-form-label">手机号码：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="phone" lay-verify="phone" autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                <div class="layui-inline" style="width:100%;margin-top:15px;" >
                  <label class="layui-form-label">邮箱：</label>
                  <div class="layui-input-inline">
                    <input type="tel" name="email" lay-verify="email" autocomplete="off" class="layui-input" style="width:200px;">
                  </div>
                </div>
                <div class="layui-inline" style="margin-top:15px;">
                    <label class="layui-form-label">学院：</label>
                    <div class="layui-input-inline">
                      <select name="institute_id" id="association" lay-verify="required" lay-search="">
                        <option value="">直接选择或搜索选择</option>
                        <option value="1">软件工程学院</option>
                        <option value="2">大气科学学院</option>
                        <option value="3">数学学院</option>
                        <option value="4">电子工程学院</option>
                        <option value="5">物理学院</option>
                        <option value="6">化学学院</option>
                        <option value="7">外国语学院</option>
                        <option value="8">什么</option>
                        <option value="9">flow</option>
                        <option value="10">util</option>
                        <option value="11">code</option>
                        <option value="12">tree</option>
                        <option value="13">layedit</option>
                        <option value="14">nav</option>
                        <option value="15">tab</option>
                        <option value="16">table</option>
                        <option value="17">select</option>
                        <option value="18">checkbox</option>
                        <option value="19">switch</option>
                        <option value="20">radio</option>
                      </select>
                    </div>
             </div>         
            <div class="layui-form-item" style="margin-top:15px;">
                <div class="layui-input-block">
                  <button class="layui-btn btn-sumit btn-submit1" lay-submit=""  lay-filter="demo1" style="width:100%;">提交</button>
                  <button type="reset" class="layui-btn layui-btn-primary btn-reset" style="display:none">重置</button>
                </div>
          </div>
          </form>
<script type="text/javascript">
//协会ID
var associatio_id;
$(document).ready(function(){
		$("#student_id").focus();
		//下拉选
		fnGetSelectData();
		//获取当前用户登陆的协会ID
		fnGetAssociationId();
		//提交按钮标为灰色
		fnSetUnEnable();
		//上传按钮置为灰色
		fnSetUpBtnUnenable();
		//上传按钮点击事件
		fnClickUpBtn();
});

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
	//刷新下拉选
	form.render('select');
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
  /*   layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'
    }); */
    $.ajax({
    	
        url: "addCommonUser.action",        //后台url
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
        	$("#student_id").focus();
        	//给协会ID输入框赋值
        	fnGetAssociationId();
        	if(data==1){
        		//刷新数据
        		window.parent.fnRefreshData();
        		layer.msg("添加用户成功", {icon: 1});
        	}else{
        		layer.msg("添加用户失败", {icon: 5});
        	}
        },
        error: function (er) {          //失败，回调函数
        	layer.msg("添加用户出错", {icon: 5});
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
  
  //普通图片上传
  var uploadInst = upload.render({
    elem: '#test1'
    ,url: 'upLoadPic.action'
    ,auto: false
    ,size: 1000 //限制文件大小，单位 KB
    ,data:{id: '1452'}
    ,bindAction: '#test9'
    ,choose: function(obj){
    		//上传按钮可用
    		fnSetUpBtnEnable();
    	   obj.preview(function(index, file, result){
    	        $('#demo1').attr('src', result); //图片链接（base64）
    	      });
    }
    ,done: function(res){
    	layer.msg('头像上传成功', {icon: 1});
    	$("#imgurl").val(res.dirName);
    }
    ,error: function(){
    	layer.msg("上传头像失败");
    }
  });
});
function fnCheckStudentId(){
	if($("#student_id").val()==""){
		 document.getElementById("student_id").focus();
		 $(".btn-submit1").attr("disabled", "true");
		 $(".btn-submit1").addClass("btn-sumit");
		 layer.tips('请输入学号', '#student_id', {
			  tips: [3, '#009688'],
			  time: 3000
			});
	}else{
		$.ajax({
	    	
	        url: "checkCommonStudentNumber.action",        //后台url
	        data: {                          //数据
	        	STUDENT_ID:$("#student_id").val(),
	        	association_id:associatio_id
	        },
	        type: "post",                   //类型，POST或者GET
	        dataType: 'html',              //数据返回类型，可以是xml、json等
	        success: function (data) {      //成功，回调函数 	        	
	        		if(data != 0){
	        			document.getElementById("student_id").focus();
	        		  	layer.msg("该学号已注册~", {icon: 5});
	        		    $(".btn-submit1").attr("disabled", "true");
	        		    $(".btn-submit1").addClass("btn-sumit");
	        		}else{
	        			//提交按钮可用
	        			$(".btn-submit1").removeAttr("disabled");
	        			$(".btn-submit1").removeClass("btn-sumit");
	        		}
	        },
	        error: function (er) {          //失败，回调函数
	        	layer.msg("校验学号出错");
	        }
	    });
	}
}
function fnGetSelectData(){
	$.ajax({
    	
        url: "getSelectData.action",        //后台url
        type: "post",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        		var selDom = $("#association");
        	     $("#association").empty();
        	     selDom.append(" <option value=>直接选择或搜索选择</option>");
        		for(var i = 0; i < data.length; i++){
        			  	　 selDom.append("<option value="+data[i]["ID"]+">"+data[i]["INSTITUTE_NAME"]+"</option>");
        		}
        },
        error: function (er) {          //失败，回调函数
        	layer.msg("获取学院下拉选出错");
        }
    });
}
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
function fnSetUnEnable(){
	  $(".btn-sumit1").attr("disabled", "true"); 
}
function fnSetUpBtnUnenable(){
		$("#test9").addClass("btn-upload");
		$("#test9").attr("disabled", "true"); 
}
function fnSetUpBtnEnable(){
	$("#test9").removeClass("btn-upload");
	$("#test9").removeAttr("disabled");
}
function fnClickUpBtn (){
	$("#test9").click(function(){
		//上传按钮不可用
		 fnSetUpBtnUnenable();
		});
}
//给密码框设置初始密码(学号)
function fnSetPwd(){
	$("#pwd").val($("#student_id").val());
}
//提交按钮置灰
function fnSubmit(){
		$(".btn-submit1").attr("disabled", "true");
		$(".btn-submit1").addClass("btn-sumit");

}
</script>
 </body>
</html>