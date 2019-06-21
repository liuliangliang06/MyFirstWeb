<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/6/18z
  Time: 8:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>中建七局第二建筑有限公司1111</title>
    <%--引用CSS文档--%>
    <link href="<%=request.getContextPath() %>/css/admin.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
<div class="header">
    <div class="header">
        <%@ include file="../content/headerAdmin.jsp" %>
    </div>
</div>

<div class="left33">
    <ul>
        <li><a class="active" href="#home">客户管理</a></li>
        <li><a href="#news">新增客户</a></li>
        <li><a href="#contact">优质客户</a></li>
        <li><a href="#about">黑名单</a></li>
    </ul>
    </div>
<div class="right33">
    <%@ include file="providerMain.jsp" %>

    1111111
</div>
</body>

</html>
