<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.skill.controller.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        table,th,td
        {
            border:1px solid black;
        }
    </style>
</head>
<body>
<table>
<tr class="tt_bg">

    <td>
        新闻标题
    </td>
    <td>
        发布人
    </td>
    <td>
        发布时间
    </td>
    <td>
        详情
    </td>

</tr>

<tr>
    <td>公司成立啦！！！</td>
    <td>mr</td>
    <td>2019-03-22 16:55</td>
    <td><a style="color:#3F862E" target="_blank" href="newsFrontDetail.jsp?newsId=3">详情</a></td>
</tr>
<tr>
    <td>徐晓智</td>
    <td>主管</td>
    <td>2016-02-01</td>
    <td><a style="color:#3F862E" target="_blank" href="newsFrontDetail.jsp?newsId=2">详情</a></td>
</tr>
<tr>
    <td>刘亮亮</td>
    <td>管理员</td>
    <td>2016-01-01</td>
    <td><a style="color:#3F862E" target="_blank" href="newsFrontDetail.jsp?newsId=1">详情</a></td>
</tr>

</table>
<SCRIPT>
    //前后台传参办法
    function bpmBefore() {
        var xhr = new XMLHttpRequest();
        var back = null;
        var params = {
            'selectedState': "郑立霞",
            'billCodeApply': 666
        };//传入后台的参数
        xhr.responseType = "json";
        xhr.open("POST", "http://localhost:8080/myFirst-Web/appointments/new", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function (event) {
            if (this.readyState == 4 && this.status == 200) {
                back = event.currentTarget.response;
                var backData = back.backData;
            }
        };
        xhr.send(JSON.stringify(params));
    }


    function displayDate(){
        document.getElementById("demo").innerHTML=Date();
    }
    function displayDate1(){
        window.open('content/login.jsp');
    }
</SCRIPT>

<%   out.println("111111dddfff");
Hello hello=new Hello();



%>
<button type="button" onclick="bpmBefore();">执行AJAX</button>
</body>
</html>
