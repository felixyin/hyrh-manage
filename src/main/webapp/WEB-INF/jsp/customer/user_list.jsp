<%--
  Created by IntelliJ IDEA.
  User: lichangde
  Date: 2016/9/8
  Time: 9:50
  
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>客户列表</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>


  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" id="main-container">
  <div id="page-content" class="clearfix ">
    <div class="row-fluid">

      <form method="post" id="userForm">
        <table>
          <tr>
            <td>公司名称：</td>
            <td>
              <input type="text" name="companyName" placeholder="请输入公司名称"/>
            </td>
            <td>登录账号：</td>
            <td>
              <input type="text" name="username" placeholder="请输入登录账号"/>
            </td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>电话：</td>
            <td>
              <input type="text" name="phone" placeholder="请输入要搜索的电话"/>
            </td>
            <td>姓名：</td>
            <td>
              <input type="text" name="name" placeholder="请输入要搜索的姓名"/>
            </td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>注册时间：</td>
            <td>
              <div class="input-append date" id="establishedDate" data-date="${bizUser.establishedDate}"
                   data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
                <input class="span2" type="text" name="establishedDate" readonly style="width: 193px;">
                <span class="add-on"><i class="icon-calendar"></i></span>
              </div>
            </td>
            <td>状态：</td>
            <td>
              <select name="status">
                <option value="-1">全部</option>
                <option value="0">无效</option>
                <option value="1">未定价</option>
                <option value="2">价格已审批</option>
                <option value="3">价格未审批</option>
              </select>
            </td>
            <c:if test="${QX.cha == 1}">
              <td></td>
              <td>
                <button type="submit" class="btn btn-primary btn-small">
                  查询
                  <i class="icon-search"></i>
                </button>
                <button type="reset" class="btn btn-grey btn-small">
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

    <div class="position-relative">
      <table style="width:100%;">
        <tr>
          <td style="vertical-align:top;">
            <c:if test="${QX.add == 1 }">
              <a class="btn btn-small btn-success" onclick="addUser();">注册新用户</a>
            </c:if>
            <%--  <c:if test="${QX.FX_QX == 1 }">
                  <a title="批量发送电子邮件" class="btn btn-small btn-info" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="icon-envelope-alt"></i></a>
              </c:if>
              <c:if test="${QX.FW_QX == 1 }">
                  <a title="批量发送短信" class="btn btn-small btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="icon-envelope"></i></a>
              </c:if>
              <c:if test="${QX.del == 1 }">
                  <a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
              </c:if>--%>
          </td>
          <td style="vertical-align:top;">

          </td>
        </tr>
      </table>
      <div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${paging.pageStr}</div>
    </div>
  </div>
</div>


<%@ include file="/include/script.jsp" %>

<script type="text/javascript">
  //    预定义当前分页变量
  // var __currentPage = ${paging.currentPage};
</script>
<script type="text/javascript">

</script>
<script type="text/javascript" src="/static/js/center/bizUser-list.js"></script>

</body>
</html>

