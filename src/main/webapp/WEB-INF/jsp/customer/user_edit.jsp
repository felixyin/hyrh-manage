<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 2016/9/11
  Time: 13:22
  
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
  <title>完善用户信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">

    <div class="widget-box transparent">
      <div class="widget-header">
        <h4 class="lighter">修改个人信息</h4>
        <div class="widget-toolbar no-border">
          <ul class="nav nav-tabs" id="my_tabs_id">
            <li>
              <a data-toggle="tab" href="#account_info_id"
                 data-show-at-opened="${requestScope.viewName eq 'center/account_info_edit'?true:false}"
                 data-url="/center/goEditBizUser.do?viewName=center/account_info_edit&id=${requestScope.id}">
                个人资料
              </a>
            </li>
            <li>
              <a data-toggle="tab" href="#company_info_id"
                 data-show-at-opened="${requestScope.viewName eq 'center/company_edit'?true:false}"
                 data-url="/center/goEditBizUser.do?viewName=center/company_edit&id=${requestScope.id}">
                企业信息
              </a>
            </li>
            <li>
              <a data-toggle="tab" href="#contract_info_id"
                 data-show-at-opened="${requestScope.viewName eq 'center/contract_edit'?true:false}"
                 data-url="/center/goEditBizUser.do?viewName=center/contract_edit&id=${requestScope.id}">
                合同信息
              </a>
            </li>
            <li>
              <a data-toggle="tab" href="#bill_info_id"
                 data-show-at-opened="${requestScope.viewName eq 'center/bill_edit'?true:false}"
                 data-url="/center/goEditBizUser.do?viewName=center/bill_edit&id=${requestScope.id}">
                发票信息
              </a>
            </li>
            <li>
              <a id="my_address_tab_id" data-toggle="tab" href="#address_info_id"
                 data-show-at-opened="${requestScope.viewName eq 'scenter/address_info'?true:false}"
                 data-url="/center/listAddress.do?viewName=center/address_info&id=${requestScope.id}">
                收货地址
              </a>
            </li>
          </ul>
        </div>
      </div>
      <div class="widget-body">
        <div class="widget-main">
          <div class="tab-content padding-4">
            <div id="account_info_id" class="tab-pane in active">
            </div>

            <div id="company_info_id" class="tab-pane">
            </div>

            <div id="contract_info_id" class="tab-pane">
            </div>

            <div id="bill_info_id" class="tab-pane">
            </div>

            <div id="address_info_id" class="tab-pane">
            </div>

          </div>
        </div>
      </div>
    </div>


  </div>
</div>


<%@ include file="/include/script.jsp" %>


<script type="text/javascript">
  top.hangge();
  $('#my_tabs_id').myTab();
</script>

</body>
</html>

