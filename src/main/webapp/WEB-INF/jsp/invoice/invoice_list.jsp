<%--
  Created by IntelliJ IDEA.
  User: lichangde
  Date: 2016/9/13
  Time: 21:22
  
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
  <div id="page-content" class="clearfix ">
    <div class="row-fluid">

      <form method="post" id="invoiceForm">
        <table>
          <tr>
            <td>订单号：</td>
            <td>
              <input type="text" name="orderCode" placeholder="请输入订单号"/>
            </td>
            <td>发票号：</td>
            <td>
              <input type="text" name="invoiceCode" placeholder="请输入发票号"/>
            </td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>购买方:</td>
            <td>
              <input type="text" name="buyer" placeholder="请输入购买方">
            </td>
            <td>销售方：</td>
            <td>
              <input type="text" name="sellert" placeholder="请输入销售方">
            </td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>货物名称：</td>
            <td>
              <input type="text" name="name" placeholder="请输入货物名称"/>
            </td>
            <td>开票日期：</td>
            <td>
              <div class="input-append date" id="invoiceDate" data-date="${bizInvoice.invoiceDate}"
                   data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
                <input class="span2" type="text" name="invoiceDate" readonly style="width: 193px;">
                <span class="add-on"><i class="icon-calendar"></i></span>
              </div>
            </td>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>规格型号：</td>
            <td>
              <input type="text" name="materialDesc" placeholder="请输入规格型号"/>
            </td>
            <td>状态：</td>
            <td>
              <select name="stauts">
                <option value="-1">全部</option>
                <option value="0">无效</option>
                <option value="1">生效</option>
              </select>
            </td>

            <%--TODO--%>
            <%--<c:if test="${QX.cha == 1}">--%>
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
            <%--</c:if>--%>

          </tr>
        </table>
      </form>

    </div>

    <table id="my-table" class="display nowrap" cellspacing="0" width="100%">
      <thead>
      <tr>
        <th colspan="7">发票信息</th>
        <th colspan="11">产品信息</th>
        <th colspan="4">物流信息</th>
        <th colspan="2">其他</th>
      </tr>
      <tr>
        <th>发票号</th>
        <th>进销项合同标识</th>
        <th>订单号</th>
        <th>行号</th>
        <th>开票时期</th>
        <th>购买方</th>
        <th>销售方</th>
        <th>物料号</th>
        <th>货物名称（产品名称）</th>
        <th>规格型号（物料描述、产品描述）</th>
        <th>开票方</th>
        <th>单位</th>
        <th>数量</th>
        <th>单价</th>
        <th>金额</th>
        <th>税额</th>
        <th>税率</th>
        <th>总金额</th>
        <th>是否邮寄</th>
        <th>快递单号</th>
        <th>是否签收</th>
        <th>签收日期</th>
        <th>状态</th>
        <th>操作</th>
        <%--<th>创建时间</th>--%>
        <%--<th>更新时间</th>--%>
        <%--<th>0：表示无效  1：表示有效</th>--%>
      </tr>
      </thead>
    </table>

    <div class="position-relative">
      <table style="width:100%;">
        <tr>
          <td style="vertical-align:top;">
            <%--<c:if test="${QX.add == 1 }">--%>
            <a class="btn btn-small btn-success" onclick="addInvoice();">添加发票</a>
            <%--</c:if>--%>
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

<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/ColReorder/js/dataTables.colReorder.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/FixedColumns/js/dataTables.fixedColumns.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/FixedColumns/js/dataTables.rowsGroup.js"></script>
<script type="text/javascript" src="/static/js/invoice/invoice-list.js"></script>
<script type="text/javascript">
  //  function refresh() {
  //  $('#add_invoice_id').close(function (evt) {
  //    evt.stopPropagation();
  //    evt.preventDefault();
  //    window.location.reload();
  //  })
  //  }

</script>


</body>
</html>

