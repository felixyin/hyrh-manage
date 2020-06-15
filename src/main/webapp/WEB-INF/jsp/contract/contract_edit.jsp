<%--
  Created by IntelliJ IDEA.
  User: liuyaping
  Date: 2016/10/27
  Time: 11:06
  
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
  <title>修改合同</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form action="/contract/${msg}.do" name="contractAddForm" class="form-horizontal" id="contractAddForm" method="post"
                                      style="margin-left: -90px;">
      <input type="hidden" name="id" id="id" value="${bizContract.id}"/>
      <div class="control-group">
      <label class="control-label" for="id_content_number">合同号</label>
      <div class="controls">
        <input type="text" name="contentNumber" id="id_content_number" value="${bizContract.contentNumber}" placeholder="这里输入合同号"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_type_contract_id">进销项合同标识</label>
      <div class="controls">
        <input type="text" name="typeContractId" id="id_type_contract_id" value="${bizContract.typeContractId}" placeholder="这里输入进销项合同标识"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_order_code">订单号</label>
      <div class="controls">
        <input type="text" name="orderCode" id="id_order_code" value="${bizContract.orderCode}" placeholder="这里输入订单号"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_line_number">行号</label>
      <div class="controls">
        <input type="text" name="lineNumber" id="id_line_number" value="${bizContract.lineNumber}" placeholder="这里输入行号"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_material_code">物料号</label>
      <div class="controls">
        <input type="text" name="materialCode" id="id_material_code" value="${bizContract.materialCode}" placeholder="这里输入物料号"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_material_desc">物料描述</label>
      <div class="controls">
        <input type="text" name="materialDesc" id="id_material_desc" value="${bizContract.materialDesc}" placeholder="这里输入物料描述"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_comment">注释</label>
      <div class="controls">
        <input type="text" name="comment" id="id_comment" value="${bizContract.comment}" placeholder="这里输入注释"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_provider">供应商</label>
      <div class="controls">
        <input type="text" name="provider" id="id_provider" value="${bizContract.provider}" placeholder="这里输入供应商"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_original">原厂</label>
      <div class="controls">
        <input type="text" name="original" id="id_original" value="${bizContract.original}" placeholder="这里输入原厂"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_customer">客户</label>
      <div class="controls">
        <input type="text" name="customer" id="id_customer" value="${bizContract.customer}" placeholder="这里输入客户"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_price_unit">价格单位</label>
      <div class="controls">
        <input type="text" name="priceUnit" id="id_price_unit" value="${bizContract.priceUnit}" placeholder="这里输入价格单位"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_count">数量</label>
      <div class="controls">
        <input type="text" name="count" id="id_count" value="${bizContract.count}" placeholder="这里输入数量"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_unit">单位</label>
      <div class="controls">
        <input type="text" name="unit" id="id_unit" value="${bizContract.unit}" placeholder="这里输入单位"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_unit_price">单价</label>
      <div class="controls">
        <input type="text" name="unitPrice" id="id_unit_price" value="${bizContract.unitPrice}" placeholder="这里输入单价"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_place_count">下单数量</label>
      <div class="controls">
        <input type="text" name="placeCount" id="id_place_count" value="${bizContract.placeCount}" placeholder="这里输入下单数量"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_sell_count">销售数量</label>
      <div class="controls">
        <input type="text" name="sellCount" id="id_sell_count" value="${bizContract.sellCount}" placeholder="这里输入销售数量"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_payment_money">付款金额</label>
      <div class="controls">
        <input type="text" name="paymentMoney" id="id_payment_money" value="${bizContract.paymentMoney}" placeholder="这里输入付款金额"/>
        <span class="help-inline"></span>
      </div>
    </div>

      <div class="control-group">
        <label class="control-label" for="placeDate">下单日期</label>
        <div class="controls">
          <div class="input-append date" id="placeDate" data-date="${bizContract.placeDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="placeDate" id="placeDate_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizContract.placeDate}"></fmt:formatDate>"
                   placeholder="请选择下单日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="requireDate">要求交付日期</label>
        <div class="controls">
          <div class="input-append date" id="requireDate" data-date="${bizContract.requireDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="placeDate" id="requireDate_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizContract.requireDate}"></fmt:formatDate>"
                   placeholder="请选择要求交付日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="realityDate">实际交付日期</label>
        <div class="controls">
          <div class="input-append date" id="realityDate" data-date="${bizContract.realityDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="placeDate" id="realityDate_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizContract.realityDate}"></fmt:formatDate>"
                   placeholder="请选择实际交付日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>
    <div class="control-group">
      <label class="control-label" for="id_freight_order_code">发货单号</label>
      <div class="controls">
        <input type="text" name="freightOrderCode" id="id_freight_order_code" value="${bizContract.freightOrderCode}" placeholder="这里输入发货单号"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_freight_money">有发票运费</label>
      <div class="controls">
        <input type="text" name="freightMoney" id="id_freight_money" value="${bizContract.freightMoney}" placeholder="这里输入有发票运费"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_freight_money_no">无发票运费</label>
      <div class="controls">
        <input type="text" name="freightMoneyNo" id="id_freight_money_no" value="${bizContract.freightMoneyNo}" placeholder="这里输入无发票运费"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_storage_money">仓储费</label>
      <div class="controls">
        <input type="text" name="storageMoney" id="id_storage_money" value="${bizContract.storageMoney}" placeholder="这里输入仓储费"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_file_name">合同名称</label>
      <div class="controls">
        <input type="text" name="fileName" id="id_file_name" value="${bizContract.fileName}" placeholder="这里输入合同名称"/>
        <span class="help-inline"></span>
      </div>
    </div>
    <div class="control-group">
      <label class="control-label" for="id_file_path">存储路径</label>
      <div class="controls">
        <input type="text" name="filePath" id="id_file_path" value="${bizContract.filePath}" placeholder="这里输入存储路径"/>
        <span class="help-inline"></span>
      </div>
    </div>

      <div class="control-group">
        <label class="control-label" for="cdate">创建日期</label>
        <div class="controls">
          <div class="input-append date" id="cdate" data-date="${bizContract.cdate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="cdate" id="cdate_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizContract.cdate}"></fmt:formatDate>"
                   placeholder="请选择创建日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="udate">更新日期</label>
        <div class="controls">
          <div class="input-append date" id="udate" data-date="${bizContract.udate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="udate" id="udate_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizContract.udate}"></fmt:formatDate>"
                   placeholder="请选择更新日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>
      <%--<c:forEach items="${pd.attachmentFileList}" var="a" varStatus="x">
        <div id="my-file-tr-${x.index}" class="control-group">
          <label class="control-label" for="my-file-${x.index}">产品附件</label>
          <div class="controls my-files">
            <input type="hidden" name="attachmentId" value="${a.id}"/>
            <input id="my-file-${x.index}" type="file" name="attachmentFileList"/>
            <span class="help-inline" style="margin-top: -10px;">
                            <label style="display: inline-block">下载：</label>
                            <a href="/base/download.do?attachmentId=${a.id}"
                               style="display: inline-block">${a.filename}</a>
                            <a data-index="${x.index}" data-attachment-id="${a.id}"
                               data-attachment-filename="${a.filename}" class="btn btn-grey btn-mini my-file-del"
                               style="display: inline-block;">
                            <i class="icon-trash icon-4x icon-only"></i>
                            删除
                            </a>
                        </span>
          </div>
        </div>
      </c:forEach>--%>

      <%--<div id="my-add-atta-target" class="control-group">
        <label class="control-label" for="min_quantity">新增附件</label>
        <div class="controls">
          <button id="my-add-atta" class="btn btn-info btn-small">新增<i
              class="icon-cloud-upload icon-on-right"></i>
          </button>
        </div>
      </div>--%>
    <div class="control-group">
      <label class="control-label" for="id_status">状态（0：无效，1：有效）</label>
      <div class="controls">
        <input type="text" name="status" id="id_status" value="${bizContract.status}" placeholder="这里输入状态（0：无效，1：有效）"/>
        <span class="help-inline"></span>
      </div>
    </div>
      <div class="form-actions">
        <button class="btn btn-info" type="submit"><i class="icon-ok"></i> 保存</button>
        &nbsp; &nbsp; &nbsp;
        <button class="btn" type="reset"><i class="icon-undo"></i> 重置</button>
      </div>
    </form>
   </div>

</div>


<%@ include file="/include/script.jsp" %>
<script type="text/javascript" src="/static/js/contract/contract-list.js"></script>

<script type="text/javascript">
  $('#placeDate').datepicker();
  $('#udate').datepicker();
  $('#cdate').datepicker();
  $('#requireDate').datepicker();
  $('#realityDate').datepicker();
</script>

</body>
</html>

