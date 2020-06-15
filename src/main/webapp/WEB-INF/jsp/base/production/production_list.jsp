<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 2016/8/22
  Time: 10:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
  <title></title>
  <base href="<%=basePath%>">

  <link rel="stylesheet" href="plugins/zTree/3.5.19/zTreeStyle.css" type="text/css">

  <%@ include file="/include/css.jsp" %>


</head>
<body>

<div class="container-fluid " id="main-container">
  <div id="page-content" class="clearfix ">
    <div class="row-fluid">

      <!-- 检索  -->
      <form id="productionForm">
        <table>
          <tr>
            <td>产品分类：</td>
            <td>
              <input name="categoryId" id="categoryIptId" class="hide">
              <input id="categoryNameIpt" type="text" readonly value="" style="width:134px;"/>
              &nbsp;<a id="menuBtn" class="btn btn-primary btn-mini" href="#" onclick="showMenu(); return false;" style="margin-bottom: 7px;">选择
            </a>
              <div id="menuContent" class="menuContent"
                   style="position: absolute; z-index: 4545; left: 74.85px; top: 29px; display: none; background: white none repeat scroll 0% 0%; border: 1px solid lightgray;">
                <ul id="treeDemo" class="ztree" style="margin-top:0; width:168px;"></ul>
              </div>
            </td>
            <td>
              产品编号：
            </td>
            <td>
              <input type="text" name="number" placeholder="请输入产品编号"/>
            </td>
            <td>产品名称：</td>
            <td>
              <input type="text" name="name" placeholder="请输入产品名称"/>
            </td>
            <td></td>
          </tr>
          <tr>
            <td>产品说明：</td>
            <td>
              <input type="text" name="content" placeholder="请输入要搜索的产品说明"/>
            </td>
            <td>状态：</td>
            <td>
              <select name="status">
                <option value="-1">全部</option>
                <option value="0">失效</option>
                <option value="1">有效</option>
              </select>
            </td>
            <td></td>

            <c:if test="${QX.cha == 1}">
              <td>
                <button type="submit" class="btn  btn-primary btn-small">
                  查询
                  <i class="icon-search"></i>
                </button>
                <button type="reset" class="btn  btn-grey btn-small">
                  重置
                  <i class="icon-remove"></i>
                </button>
              </td>
              <%-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='<%=basePath%>/user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td>
               <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i class="icon-download-alt"></i></a></td>
               <c:if test="${QX.edit == 1 }"><td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td></c:if>--%>
            </c:if>
          </tr>
        </table>
      </form>
    </div>

    <table id="my-table" ></table>
    <%--下面已经废弃--%>

    <hr>
    <a class="btn btn-small btn-success " onclick="add();">新增</a>
    <!-- PAGE CONTENT ENDS HERE -->

  </div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
  <i class="icon-double-angle-up icon-only"></i>
</a>

<%@ include file="/include/script.jsp" %>


<script type="text/javascript" src="/plugins/zTree/3.5.19/jquery.ztree.all.min.js"></script>
<script type="text/javascript">
  //    预定义产品分类树变量
  var __zNodes = ${categoryList};
</script>
<script type="text/javascript" src="/static/js/base/production-list.js"></script>
</body>
</html>
