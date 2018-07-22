<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>发布新闻</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/resources/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath() %>/resources/ueditor/lang/zh-cn/zh-cn.js"></script>

    <style type="text/css">
        .btn-news{
     			   background-color: grey;     
        }
    </style>
</head>
<body>
 <!--    <h1>完整demo</h1> -->
 <div style="margin-top:10px;">
		<form class="layui-form" >
		
             <div class="layui-inline" style="width:100%;margin-bottom:10px" >
        		            <div class="layui-input-inline" pane="" style="width:20%;" >
        		                 <label class="layui-input-inline">类别：</label>
                  <div class="layui-input-inline">
                    <input type="radio" name="news_type" value="1" title="新闻" checked="">
                    <input type="radio" name="news_type" value="0" title="公告">
                  </div>
                </div>   
                  <div class="layui-input-inline">
                    <input type="tel" name="news_title"  id="news_title" lay-verify="required" autocomplete="off" class="layui-input" placeholder="在此输入新闻标题" style="width:500px">
                  </div>     
                 
                        <button lay-filter="demo1" id="btn-news" class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal " lay-submit="" ><i class="layui-icon" style="font-size: 30px; ">&#xe609;</i>发布新闻  </button>
              </div>
              
       </form>
    
  <script id="editor" type="text/plain" style="width:99.8%;height:250px;""></script>
  
  <div class="layui-upload" style="margin-top:10px;">
  <button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button> 
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead>
        <tr><th>文件名</th>
        <th>大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
  <button type="button" class="layui-btn" id="testListAction">开始上传</button>
</div> 
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
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
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
    layui.use(['form'], function(){
   var form = layui.form;
    form.on('submit(demo1)', function(data){
    	 var news_type = $("input[name='news_type']:checked").val();
    	if(getContent()==""){
    		layer.tips('请输入新闻内容', '#editor', {
   			  tips: [1, '#009688'],
   			  time: 3000
   			});
    
    }else{
			$.ajax({
	    	
				        url: "reportNews.action",        //后台url
				        data: {                          //数据
				        	news_title:$("#news_title").val(),
				        	news_content:getContent(),
				        	news_id:news_id,
				        	news_type:news_type
				        },
				        type: "get",                   //类型，POST或者GET
				        dataType: 'html',              //数据返回类型，可以是xml、json等
				        beforeSend:function(){
				        	//提交按钮不可用
				        	$("#btn-news").attr("disabled", "true");
				    		$("#btn-news").addClass("btn-news");
				    		//上传文件按钮不可用 testList
				    		$("#testList").attr("disabled", "true");
				    		$("#testList").addClass("btn-news");
				        },
				        success: function (data) {      //成功，回调函数 	        	
				       		if(data==1){
				       			layer.msg("发布新闻成功,请等待管理员审批~", {icon: 1});
				       		}else{
				       			layer.msg("发布新闻失败", {icon: 5});
				       		}
				        },
				        error: function (er) {          //失败，回调函数
				        
				        	layer.msg("发布新闻出错", {icon: 5});
				        }
	  			  });
    	
    }
    	return false;
	  });
    });
  layui.use('upload', function(){
    	  var $ = layui.jquery
    	  ,upload = layui.upload;   
    //多文件列表示例
    var demoListView = $('#demoList')
    ,uploadListIns = upload.render({
      elem: '#testList'
      ,url: 'upLoadFiles.action?id='+guid()
      ,accept: 'file'
      ,multiple: true
      ,auto: false
      ,bindAction: '#testListAction'
      ,choose: function(obj){   
        var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
        //读取本地文件
        obj.preview(function(index, file, result){
          var tr = $(['<tr id="upload-'+ index +'">'
            ,'<td>'+ file.name +'</td>'
            ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
            ,'<td>等待上传</td>'
            ,'<td>'
              ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
              ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
            ,'</td>'
          ,'</tr>'].join(''));
          
          //单个重传
          tr.find('.demo-reload').on('click', function(){
            obj.upload(index, file);
          });
          
          //删除
          tr.find('.demo-delete').on('click', function(){
            delete files[index]; //删除对应的文件
            tr.remove();
            uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
          });
          
          demoListView.append(tr);
        });
      }
      ,done: function(res, index, upload){
        if(res.code == 1){ //上传成功
        	//给新闻ID赋值
        	news_id = res.parent_id;
          var tr = demoListView.find('tr#upload-'+ index)
          ,tds = tr.children();
          tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
          tds.eq(3).html(''); //清空操作
          return delete this.files[index]; //删除文件队列已经上传成功的文件
        }
        this.error(index, upload);
      }
      ,error: function(index, upload){
        var tr = demoListView.find('tr#upload-'+ index)
        ,tds = tr.children();
        tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
        tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
      }
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