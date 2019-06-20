<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/18
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<SCRIPT>
    //前后台传参办法
    function bpmBefore() {
        var xhr = new XMLHttpRequest();
        var back = null;
        //var selectedState = page.findUI("baseForm").api.getFieldValue("selectedState");//获取单据参照状态
        //var billCode = page.findUI("baseForm").api.getFieldValue("billCode");//获取单据编号
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
<p id="demo">这是一个段落</p>

<button type="button" onclick="bpmBefore();">执行AJAX</button>
<button type="button" onclick="displayDate();">显示时间</button>
<button type="button" onclick="displayDate1();">跳转登录界面</button>
</body>
</html>
