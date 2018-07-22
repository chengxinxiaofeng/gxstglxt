var echartsTools = new Object();

/**
 * 获取指定属性名称的数据数组
 * chartData 图表数据
 * fieldName 属性名称
 */
echartsTools.getFieldData = function (chartData, fieldName) {
    var dataArray = new Array();
   // alert("什么鬼"+chartData);
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        //数据库查询出来有空值
        if (obj[fieldName] == null) {
            dataArray.push(0);
        } else {
            dataArray.push(obj[fieldName]);
        }
    }

    return dataArray;
};
/**
 * 获取指定属性名称的数据数组
 * chartData 图表数据
 * fieldName 属性名称
 */
echartsTools.getFieldDataArrayDivideBy10000 = function (chartData, fieldName) {
    var dataArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        //数据库查询出来有空值
        if (obj[fieldName] == null) {
            dataArray.push(0);
        } else {
            var floatvar = obj[fieldName];
            var f_x = parseFloat(floatvar);
            if (isNaN(f_x)) {
                alert('function:changeTwoDecimal->parameter error');
                return false;
            }
            var f_x = Math.round(floatvar / 100) / 100;
            dataArray.push(f_x);
        }
    }
    return dataArray;
};
echartsTools.getFieldDataDivideBy10000 = function (data) {
    var floatvar = data;
    var f_x = parseFloat(floatvar);
    if (isNaN(f_x)) {
        alert('function:changeTwoDecimal->parameter error');
        return false;
    }
    var f_x = Math.round(floatvar / 100) / 100;
    return f_x;
};
/**
 * 获取指定属性名称的数据数组  一般用于获取期别或者区划等维度信息
 * chartData 图表数据
 * fieldName 属性名称
 */
echartsTools.getFieldDataNoRepeat = function (chartData, fieldName) {
    var dataArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        var value = obj[fieldName];
        var flag = false;  //是否存在重复,false不存在
        for (var j = 0; j < dataArray.length; j++) {
            if (dataArray[j] == value) {
                flag = true;
                break;
            }
        }
        //数据库查询出来有空值
        if (flag == false) {
            dataArray.push(obj[fieldName]);
        }
    }
    //移除dataArray中的空值
    for (var i = 0, k = dataArray.length; i < k; i++) {
        if (dataArray[i] == null || dataArray[i] == "" || dataArray[i] == undefined || dataArray[i].trim() == "") {
            dataArray.splice(i, 1);
        }
    }
    return dataArray;
};
echartsTools.getFieldDataWithCondition = function (chartData, fieldName, conditionName, conditionValue) {
    var dataArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        if (obj[conditionName] == conditionValue) {
            var value = obj[fieldName] == null || obj[fieldName] == "" ? 0 : obj[fieldName];
            dataArray.push(value);
        }
    }
    return dataArray;
};
/**
 * 从指定的数据中获取的符合饼图的数据数组
 * nameFiled  饼图中展示数据名称的属性名
 * valueField 名称对应值的属性名
 */
echartsTools.getPieDataArray = function (chartData, nameField, valueField, chengshu,unit,dw) {
    if (!arguments[3]) chengshu = 1;
    if(!arguments[4]) unit="";
    if(!arguments[5]) dw="";
    var pieDataArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        if (obj[nameField] != "undefined" && obj[nameField] != null) {
            var dataObj = clone(obj);
            dataObj.value = obj[valueField] != null && obj[valueField] != "undefined" ? (Number(obj[valueField]) * chengshu) : '0';
            if (chengshu != 1) {
                dataObj.value = Number(Number(dataObj.value).toFixed(2));
            }
            dataObj.name = obj[nameField];
            if(!dataObj.unit)
                dataObj.unit=unit;
            if(!dataObj.dw)
                dataObj.dw=dw;
            pieDataArray.push(dataObj);
        }
    }
    return pieDataArray;
};
/**
 * 从指定的数据中获取的符合饼图的数据数组(不包括数值为0)
 * nameFiled  饼图中展示数据名称的属性名
 * valueField 名称对应值的属性名
 */
echartsTools.getPieDataArray2 = function (chartData, nameField, valueField) {
    var pieDataArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        if (obj[nameField] != "undefined" && obj[nameField] != null
            && obj[valueField] != null && obj[valueField] != "undefined"
            && obj[valueField] != 0 && obj[valueField] != 0.00) {
            var dataObj = clone(obj);
            dataObj.value = obj[valueField];
            dataObj.name = obj[nameField];
            pieDataArray.push(dataObj);
        }
    }
    return pieDataArray;
};
/**
 * 从指定的数据中获取的符合饼图的数据数组(不包括数值为0)
 * nameFiled  饼图中展示数据名称的属性名
 * valueField 名称对应值的属性名
 */
echartsTools.getPieDataArrayWithCondition = function (chartData, nameField, valueField, conditionName, conditionValue, chengshu) {
    if (!arguments[5])chengshu = 1;
    var pieDataArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        if (obj[conditionName] == conditionValue) {
            var dataObj = {};
            dataObj.value = obj[valueField] ? obj[valueField] : 0;
            dataObj.value = Number(dataObj.value) * chengshu;
            if (chengshu != 1) {
                dataObj.value = Number(dataObj.value).toFixed(2);
            }
            dataObj.name = obj[nameField];
            dataObj.data = obj;
            pieDataArray.push(dataObj);
        }
    }
    return pieDataArray;
};
function clone(Obj) {
    var buf;
    if (Obj instanceof Array) {
        buf = [];  //创建一个空的数组 
        var i = Obj.length;
        while (i--) {
            buf[i] = clone(Obj[i]);
        }
        return buf;
    } else if (Obj instanceof Object) {
        buf = {};  //创建一个空对象 
        for (var k in Obj) {  //为这个对象添加新的属性 
            buf[k] = clone(Obj[k]);
        }
        return buf;
    } else {
        return Obj;
    }
}
/**
 * 获取一个数字字符串的最大整数+1000
 */
echartsTools.getMaxValue = function (str) {
    return Math.ceil(str) + 1000;
};

/**
 * 获取雷达图数据
 */
echartsTools.getIndicatorArray = function (chartData, fieldName) {
    var indicatorArray = new Array();
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        if (obj[fieldName] != undefined && obj[fieldName] != null) {
            var dataObj = new Object();
            dataObj.text = obj[fieldName];
            indicatorArray.push(dataObj);
        }
    }
    return indicatorArray;
};
/**
 * 数组排序
 * chartData 数据数组
 * fieldName 排序依据属性名称
 * sortType  排序方式  asc 顺序 desc 倒序
 */
echartsTools.sortArrayWithField = function (chartData, fieldName, sortType) {
    //默认为倒序
    if (!arguments[2]) sortType = "desc";
    for (var i = 0; i < chartData.length - 1; i++) {
        var obj1 = chartData[i];
        for (var j = i + 1; j < chartData.length; j++) {
            var obj2 = chartData[j];
            var obj1 = chartData[i];
            if (sortType == "desc") {
                if (Number(obj1[fieldName]) < Number(obj2[fieldName])) {
                    chartData[i] = obj2;
                    chartData[j] = obj1;
                }
            } else {
                if (Number(obj1[fieldName]) > Number(obj2[fieldName])) {
                    chartData[i] = obj2;
                    chartData[j] = obj1;
                }
            }
        }
    }
}


echartsTools.sumArrayObjectField = function (dataArray, fieldName) {
    var returnData = 0;
    for (var i = 0; i < dataArray.length; i++) {
        returnData += Number(dataArray[i][fieldName]);
    }
    return returnData;
}

/**
 * 将数组中存在的行政区划名添加对应的行政区划简称
 * @param dataArray  数据
 * @param aab301FieldName   行政区划对应的属性名称
 * @param shortFieldName    添加的简称的列属性
 */
echartsTools.addAAB301ShortName = function (dataArray, aab301FieldName, shortFieldName) {
    var shortNameList = parent.shortNameList;
    for (var j = 0; j < dataArray.length; j++) {
        for (var i = 0; i < shortNameList.length; i++) {
            if (shortNameList[i]["vab567"] == dataArray[j][aab301FieldName]) {
                dataArray[j][shortFieldName] = shortNameList[i]["vab568"]
                break;
            }
        }
    }
}
/**
 * 自动计算单位
 */
echartsTools.getUnitForList = function (chartdata, fieldName) {
    var dataArr = new Array();
    for (var i = 0; i < chartdata.length; i++) {
        if (chartdata[i][fieldName] < 0) {
            dataArr[i] = (chartdata[i][fieldName]) * (-1);
        } else {
            dataArr[i] = chartdata[i][fieldName];
        }
    }
    var max = Math.max.apply(null, dataArr);
    if (max < 10000) {
        return "";
    } else if (max >= 10000 && max < 100000000) {
        return "万";
    } else {
        return "亿";
    }
}
echartsTools.getDataWithUnit = function (valueArray) {
    var  returnArray=[];
    for (var i = 0; i < valueArray.length; i++) {
        var obj={};
        var value=0;
        var dw="";
        var data = Number(valueArray[i]);
        if (data < 10000) {
            value = data;
        } else if (data >= 10000 && data < 100000000) {
            data = data * 0.0001;
            value = data.toFixed(2);
            dw="万";
        } else {
            data = data * 0.00000001;
            value = data.toFixed(2);
            dw="亿";
        }
        obj.value=value;
        obj.dw=dw;
        returnArray.push(obj);
    }
    return returnArray;
}

echartsTools.getDataWithUnitReturn = function (valueArray) {
    var returnArray = [];
    for (var i = 0; i < valueArray.length; i++) {
        var obj = {};
        var dw = "";
        var data;
        if (isNaN(valueArray[i])) {
            data = 0;
        } else {
            data = parseFloat(valueArray[i]);
        }
        if (data < 10000) {
            valueArray[i] = data;
        } else if (data >= 10000 && data < 100000000) {
            data = data * 0.0001;
            valueArray[i] = data.toFixed(2);
            dw = "万";
        } else {
            data = data * 0.00000001;
            valueArray[i] = data.toFixed(2);
            dw = "亿";
        }
        obj.value = data.toFixed(2);
        obj.dw = dw;
        returnArray.push(obj);
    }
    return returnArray;
}
/**
 * 计算乘数
 */
echartsTools.getChengshuForList = function (unit) {
    if (unit == "") {
        return 1;
    } else if (unit == "万") {
        return 0.0001;
    } else {
        return 0.00000001;
    }
}

echartsTools.getUnitObjWithNumber=function(value){
    var data;
    var returnObj={};
    var dw="";
    if (isNaN(value)) {
        data = 0;
    } else {
        data = parseFloat(value);
    }
    if (data < 10000) {
        value = data;
    } else if (data >= 10000 && data < 100000000) {
        data = data * 0.0001;
        value = data.toFixed(2);
        dw = "万";
    } else {
        data = data * 0.00000001;
        value = data.toFixed(2);
        dw = "亿";
    }
    returnObj.value = data.toFixed(2);
    returnObj.dw = dw;
    return returnObj;
}

echartsTools.getUnitOfValue=function(value){
    var data;
    var returnObj={};
    var dw="";
    if (isNaN(value)) {
        data = 0;
    } else {
        data = parseFloat(value);
    }
    if (data < 10000) {
        value = data;
    } else if (data >= 10000 && data < 100000000) {
        data = data * 0.0001;
        value = data.toFixed(2);
        dw = "万";
    } else {
        data = data * 0.00000001;
        value = data.toFixed(2);
        dw = "亿";
    }
    return dw;
}

/**
 * 从传过来的数组中取平均值
 * @param chartData
 * @param valueField
 * @returns {number}
 */
echartsTools.getAverageData = function (chartData, valueField) {
    var total = 0;
    var averageData = 0;
    for (var i = 0; i < chartData.length; i++) {
        var obj = chartData[i];
        total += obj[valueField] ? Number(obj[valueField]) : 0;
    }
    if (chartData.length > 0)
        averageData = (total / chartData.length).toFixed(2);
    return averageData;
}

echartsTools.getSumDataArrayWidthNameAndValue=function(chartData,nameField,valueField){
    var returnArray=[];
    for(var i=0;i<chartData.length;i++){
        var obj=echartsTools.getDataObjWidthCondition(returnArray,"name",chartData[i][nameField]);
        if(!obj){
            obj={
                name:chartData[i][nameField],
                value:chartData[i][valueField]
            };
            returnArray.push(obj);
        }else{
            obj.value=Number(obj.value)+(chartData[i][valueField]?Number(chartData[i][valueField]):0)
        }
    }
    return returnArray;
}
echartsTools.getDataObjWidthCondition=function(dataList,conditionName,conditionValue){
    for(var i=0;i<dataList.length;i++){
        if(dataList[i][conditionName]==conditionValue)
            return dataList[i];
    }
    return null;
}
//针对超过10块儿内容的饼图进行处理
echartsTools.getPieDataWidthMoreThan10Part = function (chartData, nameField, valueField) {
    echartsTools.sortArrayWithField(chartData, valueField, "asc");
    var sum = 0;
    for (var i = 0; i < chartData.length; i++) {
        sum += chartData[i][valueField] ? Number(chartData[i][valueField]) : 0;
    }
    if (sum == 0)
        return chartData;
    for (var i = 0; i < chartData.length; i++) {
        var value = chartData[i][valueField] ? Number(chartData[i][valueField]) : 0;
        if (sum != 0) {
            chartData[i]["piepercent"] = (value / sum * 100).toFixed(2);
        }
    }

    var otherPercent = 0;
    var otherDataCnt = 0;
    for (var i = 0; i < chartData.length; i++) {
        var dataObj = chartData[i];
        var piepercent = dataObj.piepercent;
        otherPercent += Number(piepercent);
        if (piepercent > 10) {
            if (i == 0)
                break;
            else {
                if (otherPercent > 30 || (chartData.length - i - 1) <= 5) {
                    otherDataCnt = i;
                    break;
                } else {
                    otherDataCnt = i + 1;
                    break;
                }
            }
        } else {
            if (otherPercent > 20 || (chartData.length - i - 1) <= 5) {
                otherDataCnt = i + 1;
                break;
            }
        }
    }

    var otherObj = {};
    var otherArray = [];
    var returnArray = [];
    var otherSum = 0;
    for (var i = 0; i < chartData.length; i++) {
        if (otherDataCnt >= 2) {
            if (i < otherDataCnt) {
                otherSum += Number(chartData[i][valueField]);
                otherArray.push(chartData[i]);
            } else {
                returnArray.push(chartData[i]);
            }
        } else {
            returnArray.push(chartData[i]);
        }
    }
    if (otherDataCnt >= 2) {
        otherObj[nameField] = "其他";
        otherObj[valueField] = otherSum;
        otherObj.piepercent = Number(otherSum / sum * 100).toFixed(2);
        otherObj.otherData = otherArray;
        var obj=chartData[0];
        for(e in obj){
            if(!otherObj[e]){
                otherObj[e]=obj[e];
            }
        }
        returnArray.push(otherObj);
    }
    return returnArray;
}

echartsTools.showActualTime=function($obj){
    var date=new Date();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var hour=date.getHours();
    var minute=date.getMinutes();
    var second=date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if(minute>=0&&minute<=9)
        minute="0"+minute;
    if(second>=0&&second<=9)
        second="0"+second;
    var currentdate = date.getFullYear() + " 年 " + month + " 月 " + strDate+" 日  "+hour+":"+minute+":"+second;
    $obj.text(currentdate);
}
//将名字都第二个字贴换为*
echartsTools.changeName=function(name){
	if(name.length < 2){
		return name;
	}else if(name.length == 2){
		return name.substr(0,1) + "*";
	}else{
		return name.substr(0,1) + "*" + name.substr(2); 
	}
}