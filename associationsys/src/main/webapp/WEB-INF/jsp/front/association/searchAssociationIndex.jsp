<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>社团检索</title>
<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
<style>
.btn-sumit{
		background-color:grey;
}
</style>
<body >
 		<div class="div-notice" style="margin-top:10px">
          <div class="notic-head" style="font-size:20px">
             	 当前位置:<a href="javascript:;" onclick="parent.fnOpenPage(1)" style="cursor:pointer">首页</a>&nbsp;/&nbsp;<a class="notice-onclick" href="javascript:;">社团检索</a>
              	<hr>
          </div>
   	    </div>
   	   	<form class="layui-form form1" >     
   	   		 <div class="layui-inline" style="margin-top:15px; ">
                    <label class="layui-form-label">社团性质：</label>
                    <div class="layui-input-inline">
                      <select name="association_type" id="association_type" lay-verify="required" lay-search="" lay-filter="select-fliter1" >
                    		<option value='all'>全部</option>
                    		<option value='0'>学术社团</option>
                    	    <option value='1'>非学术社团</option>
                      </select>
                    </div>
             </div>
             <div class="layui-inline" style="margin-top:15px; ">
                    <label class="layui-form-label">挂靠单位：</label>
                    <div class="layui-input-inline">
                      <select name="institute_id" id="institute_id" lay-verify="required" lay-search="" lay-filter="select-fliter2"  >
                      </select>
                    </div>
             </div> 
           	 <div class="layui-inline" style="margin-top:15px">
                  <label class="layui-form-label">社团名称：</label>
                  <div class="layui-input-inline">
                    <input type="tel"   name="association_name" id="association_name" placeholder="输入社团名称关键字搜索" id="association_name" lay-verify="required" autocomplete="off" class="layui-input" style="width:300px;">
                 	
                  </div>
             </div> 
              <div class="layui-inline" style="margin-top:15px">
                  <div class="layui-input-inline">
                  <!-- &#x1002; -->
              	<button class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal"  lay-submit=""  lay-filter="demo1" ><i class="layui-icon" style="font-size: 30px; ">&#xe615;</i>  </button>          
                 <button class="layui-btn ayui-btn-sm  layui-btn-radius layui-btn-normal"  ><i class="layui-icon" style="font-size: 30px; "> &#x1002;</i>  </button>          
                  </div>
             </div> 
 			
        </form>
         
<table class="layui-table" lay-data="{height:'', url:'getAllAssociationInfo.action?association_type=all&institute_id=all&association_name=all', page:true, id:'idTest'}" lay-filter="demo">
  <thead>
    <tr>
      <th lay-data="{field:'ASSOCIATION_NAME', width:'18%', sort: true, align:'center',fixed: true}">名称</th>
      <th lay-data="{field:'ASSOCIATION_TYPE',  align:'center',width:'18%', sort: true}">性质</th>
      <th lay-data="{field:'INSTITUTE_NAME',  width:'18%',  align:'center',sort: true}">挂靠单位</th>
      <th lay-data="{field:'START_TIME',  width:'18%',  align:'center',sort: true}">成立时间</th>
      <th lay-data="{field:'GENDER',  width:'18%',  align:'center',sort: true ,templet: function(d){
      if(d.FILE_URL==0){return ''}else{ 
      
      var url =encodeURIComponent(d.FILE_URL); 
      var fileName=encodeURIComponent(d.FILE_NAME);
      url = '<%=request.getContextPath() %>/notice/getFile.action?fileUrl='+url+'&fileName='+fileName;
      
      return '<a href='+url+'  >'+d.FILE_NAME+'</a>' }
      }}">简介</th>         

      <th lay-data="{fixed: 'right', width:'10%', align:'center', toolbar: '#barDemo'}">加入社团</th>
    </tr>
  </thead>
</table>
<script type="text/html" id="barDemo">
<i class="layui-icon my-icon" lay-event="add" style="font-size: 30px; color: #1E9FFF;cursor:pointer;">&#xe61f;</i>
</script>
<script>
var association_id;
$(document).ready(function(){
	$("#association_name").focus();
	fnGetSelectData();
});

layui.use(['form', 'layedit', 'laydate','table'], function(){
	  var table = layui.table;
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit;
	 form.render('select');
	  form.on('submit(demo1)', function(data){
		var table = layui.table;
		//搜索重新加载数据
		table.reload('idTest', {
			page: {
		          curr: 1 //重新从第 1 页开始
		       	},
			url:'getAllAssociationInfo.action?association_type='+$('#association_type').val()+'&institute_id='+$('#institute_id').val()+'&association_name='+$('#association_name').val()
		});
		  return false;
	  });
	  
		form.on('select(select-fliter1)', function(data){
			var association_name = $('#association_name').val();
			if(association_name==""){
				association_name ="all"
			}
			table.reload('idTest', {
				page: {
			          curr: 1 //重新从第 1 页开始
			       	},
				url:'getAllAssociationInfo.action?association_type='+$('#association_type').val()+'&institute_id='+$('#institute_id').val()+'&association_name='+association_name
			});
			
		});
		form.on('select(select-fliter2)', function(data){
			var association_name = $('#association_name').val();
			if(association_name==""){
				association_name ="all"
			}
			table.reload('idTest', {
				page: {
			          curr: 1 //重新从第 1 页开始
			       	},
				url:'getAllAssociationInfo.action?association_type='+$('#association_type').val()+'&institute_id='+$('#institute_id').val()+'&association_name='+association_name
			});
			
		});
		
		  table.on('tool(demo)', function(obj){
			   var data = obj.data;
			   var association_name = data.ASSOCIATION_NAME;
			  if(obj.event === 'add'){
				  //alert(data.ASSOCIATION_ID)
				  association_id= data.ASSOCIATION_ID;
				  layer.open({
				         type: 2,
				         title:['申请加入'+association_name, 'font-size:16px;color:#0e375b;'],
				         maxmin: false,
				         shadeClose: true, //点击遮罩关闭层
				         area : ['400px' , '550px'],
				         offset: 't',
				         content: 'openAddCommonUserWin.action'
				       });
			    }
		  });

		  
	
});


function fnGetSelectData(){
	$.ajax({
    	
        url: "<%=request.getContextPath() %>/back/getSelectData.action",        //后台url
        type: "post",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        		var selDom = $("#institute_id");
        	     $("#institute_id").empty();
        	     selDom.append(" <option value='all'>全部</option>");
        		for(var i = 0; i < data.length; i++){
        			  	　 selDom.append("<option value="+data[i]["ID"]+">"+data[i]["INSTITUTE_NAME"]+"</option>");
        		}
        		//刷新下拉选
        		 var form = layui.form
        		form.render('select');
        },
        error: function (er) {          //失败，回调函数
        	layer.msg("获取学院下拉选出错");
        }
    });
}
</script>

</body>
</html>