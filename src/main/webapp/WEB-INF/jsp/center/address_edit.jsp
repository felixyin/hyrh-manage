<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/8
  Time: 9:59
  
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
  <title></title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form action="/center/${msg}.do" name="AddressForm" class="form-horizontal" id="AddressForm" method="post">
      <input type="hidden" name="id" value="${editAddressInfo.id}"/>
      <input type="hidden" name="consigneeId" value="${consigneeId}"/>
      <div class="control-group">
        <label class="control-label" for="address_id">收货地址</label>
        <div class="controls">
          <input type="text" name="address" id="address_id" value="${editAddressInfo.address}"
                 placeholder="请输入收货地址"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="consignee_name_id">联系人</label>
        <div class="controls">
          <input type="text" name="consigneeName" id="consignee_name_id" value="${editAddressInfo.consignee_name}"
                 placeholder="请输入联系人姓名"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="consignee_phone_id">联系方式</label>
        <div class="controls">
          <input type="text" name="consigneePhone" id="consignee_phone_id" value="${editAddressInfo.consignee_phone}"
                 placeholder="请输入联系方式"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="form-actions">
        <button class="btn btn-info btn-small" type="submit"><i class="icon-ok"></i> 保存</button>
        &nbsp; &nbsp; &nbsp;
      </div>
    </form>
  </div>
</div>


<%@ include file="/include/script.jsp" %>


<script type="text/javascript">
  top.hangge();
</script>

</body>
</html>

