<%--
  Created by IntelliJ IDEA.
  User: lichangde
  Date: 2016/9/14
  Time: 15:55
  
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
  <title>添加发票</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form action="/invoice/${msg}.do" name="invoiceAddForm" class="form-horizontal" id="invoiceAddForm" method="post"
         style="margin-left: -90px;">
      <input type="hidden" name="id" id="id" value="${bizInvoice.id}"/>

      <div class="control-group">
        <label class="control-label" for="id_invoice_code">发票号</label>
        <div class="controls">
          <input type="text" name="invoiceCode" id="id_invoice_code" value="${bizInvoice.invoiceCode}" placeholder="这里输入发票号"/>
          <span class="help-inline"></span>
          <%--<button class="btn btn-info btn-small" type="button" onclick="findBymeterialCode(${bizInvoice.invoiceCode})"><i class="icon-ok"></i>检索</button>--%>

        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="type_contract_id">进销项合同标识</label>
        <div class="controls">
          <input type="text" name="typeContractId" id="type_contract_id" value="${bizInvoice.typeContractId}" placeholder="这里输入进销项合同标识"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_order_code">订单号</label>
        <div class="controls">
          <input type="text" name="orderCode" id="id_order_code" value="${bizInvoice.orderCode}" placeholder="这里输入订单号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_line_number">行号</label>
        <div class="controls">
          <input type="text" name="lineNumber" id="id_line_number" value="${bizInvoice.lineNumber}" placeholder="这里输入行号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="invoiceDate">开票日期</label>
        <div class="controls">
          <div class="input-append date" id="invoiceDate" data-date="${bizInvoice.invoiceDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="invoiceDate" id="invoiceDate_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizInvoice.invoiceDate}"></fmt:formatDate>"
                   placeholder="请选择成立时间"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_buyer">购买方</label>
        <div class="controls">
          <input type="text" name="buyer" id="id_buyer" value="${bizInvoice.buyer}" placeholder="这里输入购买方"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_sellert">销售方</label>
        <div class="controls">
          <input type="text" name="sellert" id="id_sellert" value="${bizInvoice.sellert}" placeholder="这里输入销售方"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_material_code">物料号</label>
        <div class="controls">
          <input type="text" name="materialCode" id="id_material_code" value="${bizInvoice.materialCode}" placeholder="这里输入销物料号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_name">货物名称</label>
        <div class="controls">
          <input type="text" name="name" id="id_name" value="${bizInvoice.name}" placeholder="这里输入货物名称（产品名称）"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_materialDesc">规格型号</label>
        <div class="controls">
          <input type="text" name="materialDesc" id="id_materialDesc" value="${bizInvoice.materialDesc}" placeholder="这里输入规格型号（物料描述、产品描述）"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_bill_to_party">开票方</label>
        <div class="controls">
          <input type="text" name="billToParty" id="id_bill_to_party" value="${bizInvoice.billToParty}" placeholder="这里输入开票方"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_unit">单位</label>
        <div class="controls">
          <input type="text" name="unit" id="id_unit" value="${bizInvoice.unit}" placeholder="这里输入单位"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_place_count">数量</label>
        <div class="controls">
          <input type="text" name="placeCount" id="id_place_count" value="${bizInvoice.placeCount}" placeholder="这里输入数量"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_price">单价</label>
        <div class="controls">
          <input type="text" name="price" id="id_price" value="${bizInvoice.price}" placeholder="这里输入单价"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_amount">金额</label>
        <div class="controls">
          <input type="text" name="amount" id="id_amount" value="${bizInvoice.amount}" placeholder="这里输入金额"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_tax">税额</label>
        <div class="controls">
          <input type="text" name="tax" id="id_tax" value="${bizInvoice.tax}" placeholder="这里输入税额"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_tax_rate">税率</label>
        <div class="controls">
          <input type="text" name="taxRate" id="id_tax_rate" value="${bizInvoice.taxRate}" placeholder="这里输入税率"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_total_amount">总金额</label>
        <div class="controls">
          <input type="text" name="totalAmount" id="id_total_amount" value="${bizInvoice.totalAmount}" placeholder="这里输入总金额"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="emailStatus">是否邮寄：</label>
        <div class="controls">
          <select name="emailStatus" id="emailStatus">
            <option value="0" ${bizInvoice.emailStatus == 0?"selected":""}>否</option>
            <option value="1" ${bizInvoice.emailStatus == 1?"selected":""}>是</option>
          </select>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_express_code">快递单号</label>
        <div class="controls">
          <input type="text" name="expressCode" id="id_express_code" value="${bizInvoice.expressCode}" placeholder="这里输入快递单号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_sign_tatus">是否签收：</label>
        <div class="controls">
          <select name="signStatus" id="id_sign_tatus">
            <option value="0" ${bizInvoice.signStatus == 0?"selected":""}>否</option>
            <option value="1" ${bizInvoice.signStatus == 1?"selected":""}>是</option>
          </select>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="signDate">签收日期</label>
        <div class="controls">
          <div class="input-append date" id="signDate" data-date="${bizInvoice.signDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="signDate" id="sign_date_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizInvoice.signDate}"></fmt:formatDate>"
                   placeholder="请选择成立时间"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_stauts">状态：</label>
        <div class="controls">
          <select name="stauts" id="id_stauts">
            <option value="0" ${bizInvoice.stauts == 0?"selected":""}>无效</option>
            <option value="1" ${bizInvoice.stauts == 1?"selected":""}>生效</option>
          </select>
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


<script type="text/javascript">
  <%--function findBymeterialCode(${bizInvoice.invoiceCode}) {--%>
  <%--openDialog('find_by_meterial_code','检索发票','/invoice/findBymeterialCode.do？invoiceCode' + ${bizInvoice.invoiceCode})--%>
  <%--}--%>
  top.hangge();
  $('#invoiceDate').datepicker();
  $('#signDate').datepicker();

</script>

</body>
</html>

