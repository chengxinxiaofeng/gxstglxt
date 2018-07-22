<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <title>社团统计</title>
<script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/echarts4new.min.js"></script>
<script type="text/javascript" src="http://echarts.baidu.com/dist/echarts-gl.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/js/echartsTools.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">

	
<body >
	
      <div id="chart1" style="width:100%;height:500px;"></div>
<script type="text/javascript">
var chart1;
var colors = ["#009688","#5DA7F1","#F37F64","#424E69","#2CC75F","#2096BA"];
$(document).ready(function() {
   		 getData1();

    });


function  getData1(){  
    var dataList;
    if(chart1) {
        chart1.clear();
    }  

    $.ajax({			    	
        url: "getAssociationBarData.action",        //后台url
        type: "get",                   //类型，POST或者GET
        dataType: 'json',              //数据返回类型，可以是xml、json等
        success: function (data) {      //成功，回调函数 	        	
        		var associationData = echartsTools.getFieldData(data.associationNameList,"ASSOCIATION_NAME");
        		var instituteData = echartsTools.getFieldData(data.instituteNameList,"INSTITUTE_NAME");
        		var listData = data.listData;     		        		
        		var treeCol=new Array();
        		for(var i=0;i<listData.length;i++){
        		treeCol[i]=new Array(); 
        		for(var j=0;j<3;j++){
        			treeCol[i][j]=1;
        			}
        		}       		       		
        		for(var j = 0 ;j < listData.length; j++ ){
        			treeCol[j][0]=instituteData.indexOf(listData[j].INSTITUTE_NAME);
        			treeCol[j][1]=associationData.indexOf(listData[j].ASSOCIATION_NAME);
        			treeCol[j][2]=listData[j].VALUE
        		}       		 
        		     option = {
        		     	title: {
        		     	       text: "各社团人数分布情况",
        		     	       x: "center"
        		     	 },
        		     	  tooltip : {
	        	         
	        	                formatter:function(param){
	        	                	instituteData[param.data.value[0]]
	        	                    return "社团："+instituteData[param.data.value[0]]+"/"+associationData[param.data.value[1]]
	        	                	+"<br/>人数："+param.data.value[2]+"人";
	        	                }
	        	            },
        		         visualMap: {
        		             max: 100,
        		             align:'auto', 
        		             inRange: {
        		                 color: ['#313695', '#4575b4', '#74add1', '#abd9e9', '#e0f3f8', '#ffffbf', '#fee090', '#fdae61', '#f46d43', '#d73027', '#a50026']
        		             }
        		         },
        		         xAxis3D: {
        		        	 name:'学院',
        		             type: 'category',
        		             data: instituteData,
        		             axisLabel: {
        		            	 textStyle: {
        		            		    color: function (value, index) {
        		            		        return index%2==0 ? '#009688' : 'grey';
        		            		    }
        		            		},
        		            	  /*   interval:'0' */
        		             },
        		         
        		         },
        		         yAxis3D: {
        		        	 name:'协会',
        		             type: 'category',
        		             data: associationData,
        		             axisLabel: {
        		            	 textStyle: {
        		            		    color: function (value, index) {
        		            		        return index%2==0 ? '#009688' : 'grey';
        		            		    }
        		            		},
        		            	  /*   interval:'0' */
        		             },
        		         },
        		         zAxis3D: {
        		        	 name:'人数',
        		             type: 'value'
        		         },
        		         grid3D: {
        		             boxWidth: 200,
        		             boxDepth: 80,
        		             viewControl: {
        		                 // projection: 'orthographic'
        		             },
        		             light: {
        		                 main: {
        		                     intensity: 1.2,
        		                     shadow: true
        		                 },
        		                 ambient: {
        		                     intensity: 0.3
        		                 }
        		             }
        		         },
        		         series: [{
        		             type: 'bar3D',
        		             data: treeCol.map(function (item) {
        		                 return {
        		                     value: [item[0], item[1], item[2]],
        		                 }
        		             }),
        		             shading: 'lambert',

        		             label: {
        		                 textStyle: {
        		                     fontSize: 16,
        		                     borderWidth: 1
        		                 }
        		             },

        		             emphasis: {
        		                 label: {
        		                     textStyle: {
        		                         fontSize: 20,
        		                         color: '#900'
        		                     }
        		                 },
        		                 itemStyle: {
        		                     color: '#900'
        		                 }
        		             }
        		         }]
        		     }


        		             
        		                 chart1= echarts.init(document.getElementById("chart1"));
        		                 chart1.setOption(option);  
        },
        error: function (er) {          //失败，回调函数
        
        	layer.msg('获取3D柱状图数据出错', {icon: 5});
        }
    });   
    
    
    
    
    
           
}
</script>
</body>
</html>