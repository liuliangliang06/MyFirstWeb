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
<SCRIPT>
    //前后台传参办法
    function bpmBefore() {
        var xhr = new XMLHttpRequest();
        var back = null;
        var params = {
            'selectedState': "zhenglixia",
            'billCodeApply': 666
        };//传入后台的参数
        xhr.responseType = "json";
        xhr.open("POST", "http://localhost:8080/myFirst-Web/appoint/old", true);
        //xhr.open("POST", "http://localhost:8080/myFirst-Web/appointments/new", true);

        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function (event) {
            if (this.readyState == 4 && this.status == 200) {
                back = event.currentTarget.response;
                var data = back.backData;
                var table=document.getElementById("table");
                for(var i=0;i<data.length;i++){
                    var row=table.insertRow(table.rows.length);
                    var c1=row.insertCell(0);
                    c1.innerHTML=data[i].ID;
                    var c2=row.insertCell(1);
                    c2.innerHTML=data[i].Name;
                    var c3=row.insertCell(2);
                    c3.innerHTML=data[i].phone;
                    var c4=row.insertCell(3);
                    c4.innerHTML=data[i].remarks;
                    var c5=row.insertCell(4);
                    c5.innerHTML=data[i].textrue;
                }


            }
        };
        xhr.send(JSON.stringify(params));
    }
    bpmBefore();

</SCRIPT>
<table>


<table id="table" border="1" cellspacing="0" cellpadding="0" >
    <tr>
        <th>ID</th>
        <th>昵称</th>
        <th>联系方式</th>
        <th>级别</th>
        <th>备注</th>

    </tr>
</table>
<%--<%  ProviderController pc=new ProviderController();
out.print(pc.DF3());
%>--%>
<button type="button" onclick="bpmBefore();">执行AJAX</button>
<table>
<%
    request.setCharacterEncoding("UTF-8");
    News news = new News();
    String strPage = request.getParameter("intPage");
    String sPage = request.getContextPath() + request.getServletPath()+ "?";
    String sOK = news.ListNewsFront(sPage, strPage);
    if (sOK.equals("No")) {
        out.println("数据服务器出现错误！");
    } else {
        out.println(sOK);
    }
%>
</table>
</body>
</html>
