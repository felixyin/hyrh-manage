<%--
  Created by IntelliJ IDEA.
  User: liuyaping
  Date: 2016/10/27
  Time: 9:56
  
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
  <title>发票列表</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>
  <link rel="stylesheet" type="text/css" href="/plugins/DataTables-1.10.12/extensions/ColReorder/css/colReorder.dataTables.css">
  <link rel="stylesheet" type="text/css" href="/plugins/DataTables-1.10.12/extensions/FixedColumns/css/fixedColumns.dataTables.css">

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form method="post" id="contractForm">
      <table>
      <tr>
        <td>
          合同号：
        </td>
        <td>
          <input type="text" name="contentNumber" placeholder="请输入合同号"/>
        </td>
        <td>
          订单号：
        </td>
        <td>
          <input type="text" name="orderCode" placeholder="请输入订单号"/>
        </td>
      </tr>
      <tr>
        <td>
          供应商：
        </td>
        <td>
          <input type="text" name="provider" placeholder="请输入供应商"/>
        </td>
        <td>
          客户：
        </td>
        <td>
          <input type="text" name="customer" placeholder="请输入客户"/>
        </td>
      </tr>
      <tr>
        <td>
          合同名称：
        </td>
        <td>
          <input type="text" name="fileName" placeholder="请输入合同名称"/>
        </td>
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
      </table>
    </form>
  </div>
  <table id="contract-table" class="display nowrap" cellspacing="0" width="100%">
    <thead>
    <tr>
      <th colspan="2" style="text-align: center">合同信息</th>
      <th colspan="18" style="text-align: center">产品信息</th>
      <th colspan="4" style="text-align: center">物流信息</th>
      <th colspan="1" style="text-align: center">编辑</th>
    </tr>
    <tr>
      <th>合同号</th>
      <th>进销项合同标识</th>
      <th>订单号</th>
      <th>行号</th>
      <th>物料号</th>
      <th>物料描述</th>
      <th>注释</th>
      <th>供应商</th>
      <th>原厂</th>
      <th>客户</th>
      <th>价格单位</th>
      <th>数量</th>
      <th>单位</th>
      <th>单价</th>
      <th>下单数量</th>
      <th>销售数量</th>
      <th>付款金额</th>
      <th>下单日期</th>
      <th>要求交付日期</th>
      <th>实际交付日期</th>
      <th>发货单号</th>
      <th>有发票运费</th>
      <th>无发票运费</th>
      <th>仓储费</th>
      <%--<th> 创建日期</th>
      <th>更新日期</th>--%>
      <th>操作</th>
    </tr>
  </table>
  <a class="btn btn-small btn-success " onclick="addContract();">新增</a>
</div>


<%@ include file="/include/script.jsp" %>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/ColReorder/js/dataTables.colReorder.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/FixedColumns/js/dataTables.fixedColumns.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/FixedColumns/js/dataTables.rowsGroup.js"></script>
<script type="text/javascript" src="/static/js/contract/contract-list.js"></script>
<script type="text/javascript">
</script>

</body>
</html>

