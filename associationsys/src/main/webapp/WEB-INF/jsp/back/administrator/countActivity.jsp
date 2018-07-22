<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>活动统计</title>
  <script src="<%=request.getContextPath() %>/resources/js/jquery-3.3.1.min.js"></script>
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/layui/css/layui.css">
  <script src="<%=request.getContextPath() %>/resources/layui/layui.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/echarts.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/js/echartsTools.js"></script>
</head>
<body class="layui-layout-body">
			<div id="chart1" style="width:100%;height:600px;"></div>
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
 	        url: "getActivityBarData.action",        //后台url
 	        type: "post",                   //类型，POST或者GET
 	        dataType: 'json',              //数据返回类型，可以是xml、json等
 	        success: function (dataList) {      //成功，回调函数 	        	    		
 	        		    chart1= echarts.init(document.getElementById("chart1"));
 	        	        var option = {
 	        	            color: colors,
 	        	         	  title: {
 	        	              text: "活动点击量TOP10",
 	        	              x: "center"
 	        	        	  },
 	        	            tooltip : {
 	        	                trigger: 'axis',
 	        	                formatter:function(param){
 	        	                    var str="活动主题："+param[0].name+"</br>";
 	        	                    for(var i=0;i<param.length;i++){
 	        	                        str+=param[i].seriesName+"："+(param[i].value)+"次</br>";
 	        	                    }
 	        	                    return str;
 	        	                }
 	        	            },
 	        	            grid : {
 	        	                x : 60,
 	        	                y : 40,
 	        	                x2 : 50,
 	        	                y2 : 30,
 	        	                bottom:'35%'
 	        	            },
 	        	           toolbox: {
 	        	              show : true,
 	        	              feature : {
 	        	                  mark : {show: true},
 	        	                  dataView : {show: true, readOnly: false},
 	        	                  magicType : {show: true, type: ['line', 'bar']},
 	        	                  restore : {show: true},
 	        	                  saveAsImage : {show: true}
 	        	              }
 	        	          },
 	        	            calculable : true,
 	        	            xAxis : [
 	        	                {
 	        	                    type : 'category',
 	        	                    axisTick:{
 	        	                        show:false
 	        	                    },
 	        	                    data :echartsTools.getFieldData(dataList,"NAME"),
 	        	                  	 /*   data:[10,20,30,50,100], */
 	        	                    axisLabel:{
 	        	                        interval:0,
 	        	                        rotate:40,
 	        	                        clickable : false,
 	        	                        textStyle:{
 	        	                            color:'#333',
 	        	                            fontFamily:'微软雅黑',
 	        	                            fontSize:10,
 	        	                        },
 	        	                        formatter:function(param){
 	        	                            return param;
 	        	                        }

 	        	                    },
 	        	                    splitLine : {show:false}
 	        	                }
 	        	            ],
 	        	            yAxis : [
 	        	                {
 	        	                    type : 'value',
 	        	                    name : '点击量/次',
 	        	                    axisLabel:{
 	        	                        formatter:function(param){
 	        	                            return param;
 	        	                        }
 	        	                    },
 	        	                    splitLine : {
 	        	                        show : true,
 	        	                        lineStyle:{
 	        	                            color: ['#ECEFF2'],
 	        	                            width: 1,
 	        	                            type: 'dashed'
 	        	                        }
 	        	                    },
 	        	                    splitArea : {show : false}
 	        	                }
 	        	            ],
 	        	            series : [
 	        	                {
 	        	                    name: '点击量',
 	        	                    type:'bar',
 	        	                    barWidth:15,
 	        	                    data: echartsTools.getPieDataArray(dataList,"NAME","VALUE","","",""),
 	        	                  	/* data:[10,20,30,50,100], */
 	        	                }
 	        	            ],
 	        	            itemStyle: {
 	        	                emphasis: {
 	        	                    barBorderRadius: 0
 	        	                },
 	        	            }
 	        	        };
 	        	        chart1.setOption(option);	        		
 	        },
 	        error: function (er) {          //失败，回调函数

 	        }
 	    }); 
    
    

}
</script>
</body>
</html>