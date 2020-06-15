<%--
  Created by IntelliJ IDEA.
  User: da
  Date: 2016/9/6
  Time: 9:37
  
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
  <title>发票信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form action="/center/saveBizUser.do" name="billInfoForm" class="form-horizontal" id="billInfoForm" method="post">
      <input type="hidden" name="viewName" value="${viewName}">
      <input type="hidden" name="id" value="${bizUser.id}"/>
      <div class="control-group">
        <label class="control-label" for="bill_nfo_id">企业名称</label>
        <div class="controls">
          <input type="text" name="companyName" id="bill_nfo_id" value="${bizUser.companyName}"
                 placeholder="请输入企业名称"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_phone_id">企业电话</label>
        <div class="controls">
          <input type="text" name="companyPhone" id="company_phone_id" value="${bizUser.companyPhone}"
                 placeholder="请输入企业电话"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_addr_id">企业地址</label>
        <div class="controls">
          <input type="text" name="companyAddr" id="company_addr_id" value="${bizUser.companyAddr}"
                 placeholder="请输入企业地址"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="tfn_id">纳税人识别号</label>
        <div class="controls">
          <input type="text" name="tfn" id="tfn_id" value="${bizUser.tfn}"
                 placeholder="请输入纳税人识别号"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_open_bank_id">企业开户银行</label>
        <div class="controls">
          <input type="text" name="companyOpenBank" id="company_open_bank_id" value="${bizUser.companyOpenBank}"
                 placeholder="请输入企业的开户银行"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_bank_acount_id">开户银行账号</label>
        <div class="controls">
          <input type="text" name="companyBankAcount" id="company_bank_acount_id" value="${bizUser.companyBankAcount}"
                 placeholder="请输入企业开户银行账号" onkeyup="this.value=this.value.replace(/\D/g,'').replace(/....(?!$)/g,'$& ')">
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

  //===============================================================================表单验证
  var validator = $("#billInfoForm").validate({
    ignore: "",
    errorElement: 'span',
    errorClass: 'help-inline',
    focusInvalid: true,
    rules: {
      companyName: {
        required: true
      },
      companyPhone: {
        required: true,
        number: true
      },
      companyAddr: {
        required: true
      },
      companyOpenBank: {
        required: true,
        minlength: 3
      },
      companyBankAcount: {
        required: true
      },
      tfn: {
        required: true,
        number: true
      }
    },

    messages: {
      companyName: {
        required: '企业名称必填'
      },
      companyPhone: {
        required: '电话必填',
        number: '必须是数字'
      },
      companyAddr: {
        required: '企业地址必填'
      },
      companyOpenBank: {
        required: '开户银行必填',
        minlength: '至少三个字符'
      },
      companyBankAcount: {
        required: '开户银行账号必填'
      },
      tfn: {
        required: '纳税人识别号必填',
        number: '必须是数字'
      }

    },
    highlight: function (e) {
      $(e).closest('.control-group').removeClass('info').addClass('error');
    },
    success: function (e) {
      $(e).closest('.control-group').removeClass('error').addClass('info');
      $(e).remove();
    },
    errorPlacement: function (error, element) {
      if (element.is(':checkbox') || element.is(':radio')) {
        var controls = element.closest('.controls');
        if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
        else error.insertAfter(element.nextAll('.lbl').eq(0));
      }
      else if (element.is('.chzn-select')) {
        error.insertAfter(element.nextAll('[class*="chzn-container"]').eq(0));
      }
      else error.insertAfter(element);
    },
    submitHandler: function (form) {
      form.submit();
    },
    invalidHandler: function (event, validator) { //display error alert on form submit
      // alert('请检查表单，输入合法的值。');
    }
  });

  // 针对ueditor 控件配置的验证
  validator.focusInvalid = function () {
    if (this.settings.focusInvalid) {
      try {
        var toFocus = $(this.findLastActive() || this.errorList.length && this.errorList[0].element || []);
        if (toFocus.is("textarea")) {
          UE.getEditor('content').focus();
        } else {
          toFocus.filter(":visible").focus();
        }
      } catch (e) {
      }
    }
  };
</script>

</body>
</html>

