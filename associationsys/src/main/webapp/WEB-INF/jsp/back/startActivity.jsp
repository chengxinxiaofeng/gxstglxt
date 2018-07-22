<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>发布活动</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/resources/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/resources/ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
     /*    div{
            width:100%;
        } */
        .btn-news{
        background-color: grey;
        
        }
    </style>
</head>
<body>
 <!--    <h1>完整demo</h1> -->
 <div style="margin-top:10px;">
		<form class="layui-form" >
		  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">活动主题：</label>
      <div class="layui-input-inline">
        <input type="text" name="activity_theme" id="activity_theme" lay-verify="required" autocomplete="off" class="layui-input" onclick="setContent()">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">活动时间：</label>
      <div class="layui-input-inline">
        <input type="text" name="activity_time" id="activity_time" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">地点：</label>
      <div class="layui-input-inline">
        <input type="tel" name="activity_place" id="activity_place" lay-verify="required" autocomplete="off" class="layui-input">
      </div>
    </div>
     <div class="layui-inline">
      <label class="layui-form-label">负责人：</label>
      <div class="layui-input-inline">
        <input type="text"  name="activity_master_name" id="activity_master_name" lay-verify="required" autocomplete="off" class="layui-input">
      </div>
    </div>
     <div class="layui-inline">
      <label class="layui-form-label">联系方式：</label>
      <div class="layui-input-inline">
        <input type="text"   name="activity_master_phone" id="activity_master_phone"  lay-verify="required|phone" autocomplete="off" class="layui-input">
      </div>
    </div>
  <div class="layui-inline">
 <label class="layui-form-label"></label>
      <div class="layui-input-inline">
        <button  class="layui-btn layui-btn-normal layui-btn-radius" id="btn-news" lay-filter="demo1"  lay-submit=""  ><i class="layui-icon">&#xe623;</i>发起活动</button>
      </div>
    </div>
  </div>              
       </form>  
  <script id="editor" type="text/plain" style="width:99%;height:300px;"></script>
 
  </div>

<script type="text/javascript">
    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
	//新闻ID
	var news_id = "";
	//文件数量，限制上传文件的数量
	var files_num=0;
	//news_title
	$(document).ready(function(){
		$("#news_title").focus();
	 });
    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push(UE.getEditor('editor').getContent());
        return arr.join("\n");
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('在此输入活动简介...', isAppendTo);
       // alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱")
    }
    //表单
  layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#activity_time',
    type:'datetime',
    format:'yyyy-MM-dd HH:mm',
    min:'date'
  });

    form.on('submit(demo1)', function(data){
    	 var news_type = $("input[name='news_type']:checked").val();
    	if(getContent()==""){
    		layer.tips('请输入活动简介', '#editor', {
   			  tips: [1, '#009688'],
   			  time: 3000
   			});
    
    }else{
			$.ajax({
	    	
				        url: "addActivity.action",        //后台url
				        data: {                          //数据
				        	activity_theme:$("#activity_theme").val(),
				        	activity_time:$("#activity_time").val(),
				        	activity_place:$("#activity_place").val(),
				        	activity_master_name:$("#activity_master_name").val(),
				        	activity_master_phone:$("#activity_master_phone").val(),
				        	activity_content:getContent()
				        },
				        type: "get",                   //类型，POST或者GET
				        dataType: 'html',              //数据返回类型，可以是xml、json等
				        beforeSend:function(){
				        	//提交按钮不可用
				        	$("#btn-news").attr("disabled", "true");
				    		$("#btn-news").addClass("btn-news");
				        },
				        success: function (data) {      //成功，回调函数 	        	
				       		if(data==1){
				       			layer.msg("发起活动成功,请等待管理员审批~", {icon: 1});
				       		}else{
				       			layer.msg("发布活动失败", {icon: 5});
				       		}
				        },
				        error: function (er) {          //失败，回调函数
				        
				        	layer.msg("发布活动出错", {icon: 5});
				        }
	  			  });
    	
    }
    	return false;
	  });
    });


  //用于生成uuid
  function S4() {
      return (((1+Math.random())*0x10000)|0).toString(16).substring(1);
  }
  function guid() {
      return (S4()+S4()+"-"+S4()+"-"+S4()+"-"+S4()+"-"+S4()+S4()+S4());
  }

</script>
 </body>
</html>