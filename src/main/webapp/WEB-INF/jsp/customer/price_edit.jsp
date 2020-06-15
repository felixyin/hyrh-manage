<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2016/9/8
  Time: 10:00
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

  <style type="text/css">
    .my-price-ipt {
      width: 80px;
      height: 30px !important;
    }
  </style>

</head>
<body>

<div class="container-fluid " id="main-container">
  <div id="page-content" class="clearfix ">
    <div class="row-fluid">

      <!-- 检索  -->
      <form id="priceForm">
        <input type="hidden" name="bizUserId" value="${bizUserId}">
        <table class="my-seartch-table">
          <tr>
            <td>产品分类：</td>
            <td>
              <input name="dicProduction.categoryId" id="categoryIptId" class="hide">
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
              <input autocomplete="off" type="text" name="dicProduction.number" value="${p.dicProduction.number }" placeholder="请输入产品编号"/>
            </td>
            <td>产品名称：</td>
            <td>
              <input autocomplete="off" type="text" name="dicProduction.name" value="${p.dicProduction.name }" placeholder="请输入产品名称"/>
            </td>
            <td></td>
          </tr>
          <tr>
            <td>产品说明：</td>
            <td>
              <input autocomplete="off" type="text" name="dicProduction.content" value="${p.dicProduction.content }" placeholder="请输入要搜索的产品说明"/>
            </td>
            <td>状态：</td>
            <td>
              <select name="dicProduction.status">
                <option value="-1" ${p.dicProduction.status == -1 ? "selected":""}>全部</option>
                <option value="0" ${p.dicProduction.status == 0 ? "selected":""}>失效</option>
                <option value="1" ${p.dicProduction.status == 1 ? "selected":""}>有效</option>
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

    <table id="my-table"></table>

    <%--<table id="table_report" class="table table-striped table-bordered table-hover">
      <thead>
      <tr>
        <th>产品名称</th>
        <th>人民币价格</th>
        <th>美金价格</th>
        <th>价格单位</th>
        <th>开始有效期</th>
        <th>结束有效期</th>
        <th>状态</th>
        <th class="center">操作</th>
      </tr>
      </thead>

      <tbody>
      <!-- 开始循环 -->
      <c:choose>
        <c:when test="${not empty bizPriceList}">

          <c:forEach items="${bizPriceList}" var="p" varStatus="vs">
            <tr>
              <td class="my-text-hide">
                <a title="查看产品详情" style="cursor: pointer;max-width: 100px;" onclick="viewProduction(${p.dicProduction.id})">
                    ${p.dicProduction.name}
                </a>
              </td>
              <td><input id="rmbjg_id_${p.productionId}" type="text" class="my-price-ipt" placeholder="人民币价格" value="${p.rmbPrice}"></td>
              <td><input id="mjjg_id_${p.productionId}" type="text" class="my-price-ipt" placeholder="美金价格" value="${p.dollarPrice}"></td>
              <td><input id="jgdw_id_${p.productionId}" type="text" class="my-price-ipt" placeholder="价格单位" value="${p.priceUnit}"></td>
              <td>
                <div class="input-append date" data-date="${pd.effectiveStartDate}"
                     data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
                  <input id="ksyxq_id_${p.productionId}" class="span2 my-price-ipt" placeholder="开始有效期"
                         type="text" readonly value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${p.effectiveStartDate}"></fmt:formatDate>"
                         style="width: 85px;">
                  <span class="add-on"><i class="icon-calendar"></i></span>
                </div>
              </td>
              <td>
                <div class="input-append date" data-date="${pd.effectiveEndDate}"
                     data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
                  <input id="jsyxq_id_${p.productionId}" class="span2 my-price-ipt" placeholder="结束有效期"
                         type="text" readonly value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${p.effectiveEndDate}"></fmt:formatDate>"
                         style="width:
                   85px;">
                  <span class="add-on"><i class="icon-calendar"></i></span>
                </div>
              <td>
                <c:if test="${p.dicProduction.status == 0}">
                  失效
                </c:if>
                <c:if test="${p.dicProduction.status == 1}">
                  有效
                </c:if>
              </td>
              <td>
                <c:if test="${p.id == null}">
                  <a class='btn btn-mini btn-info' title="保存" onclick="addOrEditPrice('${p.dicProduction.id}');">
                    保存<i class='icon-edit'></i>
                  </a>
                </c:if>
                <c:if test="${p.id != null}">
                  <a class='btn btn-mini btn-info' title="修改" onclick="addOrEditPrice('${p.dicProduction.id}','${p.id}');">
                    修改<i class='icon-edit'></i>
                  </a>
                </c:if>
              </td>
            </tr>

          </c:forEach>
          <c:if test="${QX.cha == 0 }">
            <tr>
              <td colspan="10" class="center">您无权查看</td>
            </tr>
          </c:if>
        </c:when>
        <c:otherwise>
          <tr class="main_info">
            <td colspan="10" class="center">没有相关数据</td>
          </tr>
        </c:otherwise>
      </c:choose>
      </tbody>
    </table>--%>

    <div class="position-relative ">
      <table style="width:100%;" class="hide">
        <tr>
          <td style="vertical-align:top;">
            <c:if test="${QX.add == 1 }">
              <a class="btn btn-small btn-success" onclick="add();">新增</a>
            </c:if>
          </td>
          <td style="vertical-align:top;">
          </td>
        </tr>
      </table>
      <div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${paging.pageStr}</div>
    </div>

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
  //  标示（区别）那个用户的产品定价
  var __bizUserId = ${bizUserId};
  //  当前操作人
  var __operatorId = ${operatorId};
</script>
<script type="text/javascript">


</script>
<script type="text/javascript" src="/static/js/customer/price_list.js"></script>
</body>
</html>
