<%--
客户管理界面  能进行增删除改查
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/25
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="org.skill.controller.*" %>
<html>
<head>
    <%--引用CSS文档--%>
    <link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet" type="text/css" media="all">
    <title>Title</title>
    <style>
        table, th, td {
            padding: 5px;
            border: 1px solid #371a24;
        }
        #tablebox{  left: 500px;
            top:230px;}
    </style>
</head>
<script>
    function fun3() {
        //下拉框设置值
        var oSelect = document.getElementById("select1");
        var xhr = new XMLHttpRequest();
        var params = {
            'oSelectType': oSelect.value,  //获取下拉选择框的值
            'oSelectPrice': document.getElementById("select2").value,   //获取金额值
            'all':1
        };//传入后台的参数
        xhr.responseType = "json";
        xhr.open("POST", "http://localhost:8080/myFirst-Web/appoint/select", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function (event) {
            if (this.readyState == 4 && this.status == 200) {
                back = event.currentTarget.response;
                if (back) {
                    var jsonArray = back.backData;
                    removeDivSelectTable('selectTable', 'tablebox')
                    var headArray = [];
                    appendTable(jsonArray);
                }else{
                    alert("无数据！")
                }
            }
        }
        xhr.send(JSON.stringify(params));
    }
</script>
<div class="buttonArea" style="height: 50px">
    <div class="buttonArea1">
        <button type="button" onclick="black();">新增客户</button>
    </div>
    <div class="buttonArea2">
        <select id="select1">
            <option value="3">五开号</option>
            <option value="1">化圣号</option>
            <option value="2">单开跑环号</option>
            <option value="4">群主推荐</option>
        </select>
        <select id="select2">
            <option value="1">0-300</option>
            <option value="2">300-500</option>
            <option value="3">500-1000</option>
            <option value="4">1000-2000</option>
            <option value="5">2000以上</option>
        </select>
        <button id="button1" type="button" onclick="fun3();">查询</button>
        <button id="button2" type="button" onclick="bpmBefore()">查询所有</button>
        <button type="button" onclick="removeDivSelectTable('selectTable','tablebox')">移除</button>
        <button type="button" onclick="bpmBefore222()">js测试</button>
        <button type="button" onclick="bpmBefore233()">js测试</button>
    </div>
</div>

<div id="selectTable">
</div>

</body>
<!--js引用-->
<script language="JAVASCRIPT" src='<%=request.getContextPath() %>/js/function.js'></script>
</html>