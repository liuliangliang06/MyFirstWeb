<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/21
  Time: 8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--头部-->
<div class="toplogo">
    <%--<a href="index.jsp"><img src="img/logo.png" alt=""> </a>--%>
    <h1> 中建七局第二建筑有限公司</h1>
    <%--    <h1> 妖怪梦幻西游五开租号平台</h1>--%>
    <%--引用CSS文档--%>
    <link href="<%=request.getContextPath() %>/css/index.css" rel="stylesheet" type="text/css" media="all">
</div>


<ul>
    <li><a href="<%=request.getContextPath() %>/main" href="#home">主页</a></li>
    <li><a href="#news">公司新闻</a></li>
    <li class="dropdown">
        <a href="#" class="dropbtn">产品概览</a>
        <div class="dropdown-content">
            <a href="#">铝合金防火窗</a>
            <a href="#">塑钢防火窗</a>
            <a href="#">耐火窗</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="#" class="dropbtn">客户管理</a>
        <div class="dropdown-content">
            <a href="#">五开号</a>
            <a href="#">单开号</a>
            <a href="#">精品号</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="#" class="dropbtn">订单管理</a>
        <div class="dropdown-content">
            <a href="#">新建订单</a>
            <a href="#">管理订单</a>
            <a href="#">废除订单</a>
        </div>

    </li>
    <li class="dropdown">
        <a href="#" class="dropbtn">合作案例</a>
        <div class="dropdown-content">
            <a href="#">重要案例</a>
            <a href="#">精品案例</a>
            <a href="#">其他案例</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="#" class="dropbtn">了解我们</a>
        <div class="dropdown-content">
            <a href="#">盛世一角</a>
            <a href="#">施工车间</a>
            <a href="#">战略规划</a>
        </div>
    </li>
    <li class="dropdown">
        <a href="#" class="dropbtn">资讯动态</a>
    </li>
    <li class="dropdown">
        <a href="#" class="dropbtn">联系我们</a>
    </li>
    <li class="dropdown">
        <a href="<%=request.getContextPath() %>/admin" class="dropbtn">后台管理</a>
    </li>
</ul>

</body>
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
</html>
