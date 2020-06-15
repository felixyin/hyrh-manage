<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 2016/8/22
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>产品编辑</title>
    <base href="<%=basePath%>">

        <%@ include file="/include/css.jsp" %>


</head>
<body>
<div class="container-fluid">
    <div id="page-content" class="clearfix">
        <h2 class="center">${production.name}</h2>
        <h6 class="center"><fmt:formatDate value="${production.udate}" pattern="yyyy-MM-dd"></fmt:formatDate></h6>
        <p class="lead">
            ${production.content}
        </p>
    </div>
</div>

<%@ include file="/include/script.jsp" %>



<script type="text/javascript">
    top.hangge();
</script>
</body>
</html>
