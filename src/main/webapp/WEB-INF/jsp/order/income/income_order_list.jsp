<%--
  Created by IntelliJ IDEA.
  User: david
  Date: 2016/9/23
  Time: 10:44
  
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
  <title>进项订单管理</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>
  <link rel="stylesheet" type="text/css" href="/plugins/DataTables-1.10.12/extensions/ColReorder/css/colReorder.dataTables.css">
  <link rel="stylesheet" type="text/css" href="/plugins/DataTables-1.10.12/extensions/FixedColumns/css/fixedColumns.dataTables.css">


</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form id="incomeOrderForm">
      <table>
        <tr>
          <td>订货月份：</td>
          <td>
            <div class="input-append date" id="bookMonth" data-date="${bizOrder.bookMonth}"
                 data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
              <input class="span2" type="text" name="bookMonth" placeholder="请选择订货月份" readonly style="width: 193px;">
              <span class="add-on"><i class="icon-calendar"></i></span>
            </div>
          </td>
          <td>下单日期：</td>
          <td>
            <div class="input-append date" id="placeDate" data-date="${bizOrder.placeDate}"
                 data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
              <input class="span2" type="text" name="placeDate" placeholder="请选择下单日期" readonly style="width: 193px;">
              <span class="add-on"><i class="icon-calendar"></i></span>
            </div>
          </td>
        </tr>

        <tr>
          <td>实际交付日期：</td>
          <td>
            <div class="input-append date" id="realityDate" data-date="${bizOrder.realityDate}"
                 data-date-format="yyyy-mm-dd" data-date-viewmode="years" data-date-minviewmode="months">
              <input class="span2" type="text" name="realityDate" placeholder="请选择实际交付日期" readonly style="width: 193px;">
              <span class="add-on"><i class="icon-calendar"></i></span>
            </div>
          </td>

          <td>
            客户：
          </td>
          <td>
            <input type="text" name="customer" value="${bizOrder.customer}" placeholder="请输入客户名称"/>
          </td>
        </tr>

        <tr>
          <td>
            原厂：
          </td>
          <td>
            <input type="text" name="original" value="${bizOrder.original}" placeholder="请输入原厂名称"/>
          </td>
          <td>
            供应商：
          </td>
          <td>
            <input type="text" name="provider" value="${bizOrder.provider}" placeholder="请输入供应商"/>
          </td>
        </tr>

        <tr>
          <td>
            是否付款：
          </td>
          <td>
            <input type="text" name="isPayment" value="${bizOrder.isPayment}" placeholder="请输入是否付款"/>
          </td>
          <td>
            订单是否完结：
          </td>
          <td>
            <input type="text" name="isOrderEnd" value="${bizOrder.isOrderEnd}" placeholder="请输入订单是否完结"/>
          </td>
        </tr>

        <tr>
          <td>
            是否开具发票：
          </td>
          <td>
            <input type="text" name="isInvoice" value="${bizOrder.isInvoice}" placeholder="请输入是否开具发票"/>
          </td>
          <td>状态：</td>
          <td>
            <select name="status">
              <option value="-1">全部</option>
              <option value="0">无效</option>
              <option value="1">有效</option>
            </select>
          </td>

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

  <table id="income_order_table_id" class="display nowrap" cellspacing="0" width="100%">
    <thead>
    <tr>
      <th colspan="3">发票信息</th>
      <th colspan="17">货物信息</th>
      <th colspan="3">快递信息</th>
      <th colspan="8">发票信息</th>
      <th colspan="2">其他</th>
    </tr>
    <tr>
      <th>订单号</th>
      <th>行号</th>
      <th>进销项合同标识</th>
      <th>订货月份</th>
      <th>物料号</th>
      <th>物料描述</th>
      <th>地址</th>
      <th>注释</th>
      <th>供应商</th>
      <th>原厂</th>
      <th>客户</th>
      <th>价格单位</th>
      <th>单位</th>
      <th>数量单位</th>
      <th>下单数量</th>
      <th>销售数量</th>
      <th>付款金额</th>
      <th>下单日期</th>
      <th>要求交付日期</th>
      <th>实际交付日期</th>
      <th>发货单号</th>
      <th>运费</th>
      <th>运费</th>
      <th>仓储费</th>
      <th>合同号</th>
      <th>是否付款</th>
      <th>订单是否完结</th>
      <th>是否开具发票</th>
      <th>发票号</th>
      <th>发票金额</th>
      <th>备注</th>
      <th>状态</th>
      <th>操作</th>
    </tr>
    </thead>
  </table>
  <a class="btn btn-small btn-success " onclick="addIncomeOrder();">新增</a>
  <a class="btn btn-small btn-success " onclick="fromExcel();">从Excel导入</a>
</div>

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
  <i class="icon-double-angle-up icon-only"></i>
</a>

<%@ include file="/include/script.jsp" %>

<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/ColReorder/js/dataTables.colReorder.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/FixedColumns/js/dataTables.fixedColumns.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/FixedColumns/js/dataTables.rowsGroup.js"></script>
<script type="text/javascript" src="/static/js/order/income_order_list.js"></script>
<script type="text/javascript">
  //打开上传excel页面
  function fromExcel() {
    <%--top.jzts();--%>
    <%--var diag = new top.Dialog();--%>
    <%--diag.Drag=true;--%>
    <%--diag.Title ="EXCEL 导入到数据库";--%>
    <%--diag.URL = '<%=basePath%>user/goUploadExcel.do';--%>
    <%--diag.Width = 300;--%>
    <%--diag.Height = 150;--%>
    <%--diag.CancelEvent = function(){ //关闭事件--%>
    <%--if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){--%>
    <%--if('${page.currentPage}' == '0'){--%>
    <%--top.jzts();--%>
    <%--setTimeout("self.location.reload()",100);--%>
    <%--}else{--%>
    <%--nextPage(${page.currentPage});--%>
    <%--}--%>
    <%--}--%>
    <%--diag.close();--%>
    <%--};--%>
    <%--diag.show();--%>
    openDialog('load_Excel_id', 'EXCEL 导入到数据库', '/order/goLoadExcel.do', {width: 300, height: 150});

  }

</script>


</body>
</html>

