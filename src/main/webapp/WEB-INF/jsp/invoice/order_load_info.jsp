<%--
  Created by IntelliJ IDEA.
  User: lcd
  Date: 2016/10/24
  Time: 15:29

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
  <title>添加和修改</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>
  <style>
    #project-label {
      display: block;
      font-weight: bold;
      margin-bottom: 1em;
    }

    #project-icon {
      float: left;
      height: 32px;
      width: 32px;
    }

    #project-description {
      margin: 0;
      padding: 0;
    }
  </style>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form id="loadOrderForm" class="form-horizontal" style="margin-left: -90px">
      <input type="hidden" name="id" id="incomeOrder_id" value="${bizOrderEdit.id}"/>
      <div class="control-group">
        <label class="control-label" for="id_book_month">订货月份</label>
        <div class="controls">
          <div class="input-append date" id="id_book_month" data-date="${bizOrderEdit.bookMonth}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="bookMonth" readonly style="width: 193px;" value="${bizOrderEdit.bookMonth}"
                   placeholder="请选择成立时间"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_address_id">地址</label>
        <div class="controls">
          <input type="text" name="addressId" id="id_address_id" value="${bizOrderEdit.addressId}" placeholder="这里输入地址"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_comment">注释</label>
        <div class="controls">
          <input type="text" name="comment" id="id_comment" value="${bizOrderEdit.comment}" placeholder="这里输入注释"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_original">原厂</label>
        <div class="controls">
          <input type="text" name="original" id="id_original" value="${bizOrderEdit.original}" placeholder="这里输入原厂"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_price_unit">价格单位</label>
        <div class="controls">
          <input type="text" name="priceUnit" id="id_price_unit" value="${bizOrderEdit.priceUnit}" placeholder="这里输入价格单位"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_count_unit">数量单位</label>
        <div class="controls">
          <input type="text" name="countUnit" id="id_count_unit" value="${bizOrderEdit.countUnit}" placeholder="这里输入数量单位"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_sell_count">销售数量</label>
        <div class="controls">
          <input type="text" name="sellCount" id="id_sell_count" value="${bizOrderEdit.sellCount}" placeholder="这里输入销售数量"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_place_date">下单日期</label>
        <div class="controls">
          <div class="input-append date" id="id_place_date" data-date="${bizOrderEdit.placeDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="placeDate" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizOrderEdit.placeDate}"></fmt:formatDate>"
                   placeholder="请选择下单日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_require_date">要求交付日期</label>
        <div class="controls">
          <div class="input-append date" id="id_require_date" data-date="${bizOrderEdit.requireDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="requireDate" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizOrderEdit.requireDate}"></fmt:formatDate>"
                   placeholder="请选择要求交付日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_reality_date">实际交付日期</label>
        <div class="controls">
          <div class="input-append date" id="id_reality_date" data-date="${bizOrderEdit.realityDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="realityDate" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizOrderEdit.realityDate}"></fmt:formatDate>"
                   placeholder="请选择实际交付日期"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_freight_money">运费</label>
        <div class="controls">
          <input type="text" name="freightMoney" id="id_freight_money" value="${bizOrderEdit.freightMoney}" placeholder="这里输入运费"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_freight_money_no">运费</label>
        <div class="controls">
          <input type="text" name="freightMoneyNo" id="id_freight_money_no" value="${bizOrderEdit.freightMoneyNo}" placeholder="这里输入运费"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_storage_money">仓储费</label>
        <div class="controls">
          <input type="text" name="storageMoney" id="id_storage_money" value="${bizOrderEdit.storageMoney}" placeholder="这里输入仓储费"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_content_number">合同号</label>
        <div class="controls">
          <input type="text" name="contentNumber" id="id_content_number" value="${bizOrderEdit.contentNumber}" placeholder="这里输入合同号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_is_payment">是否付款</label>
        <div class="controls">
          <input type="text" name="isPayment" id="id_is_payment" value="${bizOrderEdit.isPayment}" placeholder="这里输入是否付款"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_is_order_end">订单是否完结</label>
        <div class="controls">
          <input type="text" name="isOrderEnd" id="id_is_order_end" value="${bizOrderEdit.isOrderEnd}" placeholder="这里输入订单是否完结"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_is_invoice">是否开具发票</label>
        <div class="controls">
          <input type="text" name="isInvoice" id="id_is_invoice" value="${bizOrderEdit.isInvoice}" placeholder="这里输入是否开具发票"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_amount">发票金额</label>
        <div class="controls">
          <input type="text" name="amount" id="id_amount" value="${bizOrderEdit.amount}" placeholder="这里输入发票金额"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_note">备注</label>
        <div class="controls">
          <input type="text" name="note" id="id_note" value="${bizOrderEdit.note}" placeholder="这里输入备注"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="status">状态：</label>
        <div class="controls">
          <select name="status" id="status">
            <option value="1" ${bizOrderEdit.status == 1?"selected":""}>有效</option>
            <option value="0" ${bizOrderEdit.status == 0?"selected":""}>无效</option>
          </select>
          <span class="help-inline"></span>
        </div>
      </div>

    </form>
    <form action="/invoice/${msg}.do" name="IncomeOrderForm" class="form-horizontal" id="IncomeOrderForm" method="post"
          style="margin-left: -90px;">

      <div class="control-group">
        <label class="control-label" for="id_invoice_code">发票号</label>
        <div class="controls">
          <input type="text" name="invoiceCode" id="id_invoice_code" value="${bizOrderEdit.invoiceCode}" placeholder="这里输入发票号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="type_contract_id">进销项合同标识</label>
        <div class="controls">
          <input type="text" name="typeContractId" id="type_contract_id" value="${bizOrderEdit.typeContract}" placeholder="这里输入进销项合同标识"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_order_code">订单号</label>
        <div class="controls">
          <input type="text" name="orderCode" id="id_order_code" value="${bizOrderEdit.orderCode}" placeholder="这里输入订单号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_line_number">行号</label>
        <div class="controls">
          <input type="text" name="lineNumber" id="id_line_number" value="${bizOrderEdit.lineNumber}" placeholder="这里输入行号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_buyer">客户</label>
        <div class="controls">
          <input type="text" name="buyer" id="id_buyer" value="${bizOrderEdit.customer}" placeholder="这里输入客户"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_sellert">供应商</label>
        <div class="controls">
          <input type="text" name="sellert" id="id_sellert" value="${bizOrderEdit.provider}" placeholder="这里输入供应商"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_material_code">物料号</label>
        <div class="controls">
          <input type="text" name="materialCode" id="id_material_code" value="${bizOrderEdit.materialCode}" placeholder="这里输入物料号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_material_desc">物料描述</label>
        <div class="controls">
          <input type="text" name="materialDesc" id="id_material_desc" value="${bizOrderEdit.materialDesc}" placeholder="这里输入物料描述"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_unit">单位</label>
        <div class="controls">
          <input type="text" name="unit" id="id_unit" value="${bizOrderEdit.unit}" placeholder="这里输入单位"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_place_count">下单数量</label>
        <div class="controls">
          <input type="text" name="placeCount" id="id_place_count" value="${bizOrderEdit.placeCount}" placeholder="这里输入下单数量"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_total_amount">付款金额</label>
        <div class="controls">
          <input type="text" name="totalMoney" id="id_total_amount" value="${bizOrderEdit.paymentMoney}" placeholder="这里输入付款金额"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="id_express_code">发货单号</label>
        <div class="controls">
          <input type="text" name="expressCode" id="id_express_code" value="${bizOrderEdit.freightOrderCode}" placeholder="这里输入发货单号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="form-actions">
        <button class="btn btn-info btn-small" id="id_add" type="submit"><i class="icon-ok"></i>添加发票</button>
      </div>
    </form>
  </div>
</div>


<%@ include file="/include/script.jsp" %>

<script type="text/javascript">
  top.hangge();
  $('#id_book_month').datepicker();
  $('#id_place_date').datepicker();
  $('#id_require_date').datepicker();
  $('#id_reality_date').datepicker();
</script>

<script type="text/javascript">
  //   $(document).ready(function () {
  //     $('#id_add').click(function () {
  ////       close(this.Dialog());
  ////          this.closeDialog;
  ////       this.close();
  ////       this.Dialog.close();
  ////      this.DialogResult = DialogResult.OK;
  ////       this.dialog.onClosed();
  ////       window.opener=null;
  ////       self.close();
  ////       top.Dialog.getInstance('edit_income_order_id').close();
  ////       top.Dialog.getInstance('add_invoice_id').parent.location.reload();
  //       top.Dialog.getInstance('add_invoice_id').close();
  ////       window.location.reload();
  ////       window.parent.location.href='/invoice/listInvoice.do';
  ////       this.window.location.reload();
  ////       top.Dialog.getInstance('add_invoice_id').innerFrame.contentWindow
  //       alert(1)
  //
  //     });


  //     var materialcode =["a","ab","abc","abcd"]
  //    $("#id_material_code").autocomplete(
  //        {
  //          source:'/order/autoComplete.do'
  //        });
  //   });

  $("#id_material_code").autocomplete({
    minLength: 0,
    source: '/order/autoComplete.do',
    select: function (event, ui) {
      $("#id_material_code").val(ui.item.name);
      $("#id_material_desc").html(ui.item.comment);
      return false;
    }
  }).data("ui-autocomplete")._renderItem = function (ul, item) {
    return $("<li>")
        .append("<div>" + item.number + ":" + item.name + "</div>")
        .appendTo(ul);
  };
</script>

</body>
</html>

