<%--
  Created by IntelliJ IDEA.
  User: lichangde
  Date: 2016/9/5
  Time: 18:13
  
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
  <title>合同信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>


</head>
<body>

<div class="container-fluid" style="margin-top: 30px;" style="padding-right: 20px">
  <div class="row-fluid">

    <form id="contractFrom"
          class="form-horizontal" style="margin-left: -90px;">
      <input type="hidden" name="viewName" value="${viewName}">
      <input type="hidden" name="id" value="${bizUser.id}">

      <div class="control-group">
        <label class="control-label" for="form-field-1">公司名称</label>
        <div class="controls">
          <input type="text" id="form-field-1" name="companyName" value="${bizUser.companyName}"
                 placeholder="请输入公司名称">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">公司地址</label>
        <div class="controls">
          <input type="text" id="companyadd_id" name="companyAddr" value="${bizUser.companyAddr}"
                 placeholder="请输入公司地址">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">联系人</label>
        <div class="controls">
          <input type="text" id="name_id" name="name" value="${bizUser.name}" placeholder="请输入联系人">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">联系电话</label>
        <div class="controls">
          <input type="text" id="phone_id" name="phone" value="${bizUser.phone}"
                 placeholder="请输入联系电话">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">传真</label>
        <div class="controls">
          <input type="text" id="fax" name="companyFex" value="${bizUser.companyFex}" placeholder="请输入传真">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">


        <label class="control-label" for="form-field-1">邮政编码</label>
        <div class="controls">
          <input type="text" id="code_id" name="zipCode" value="${bizUser.zipCode}"
                 placeholder="请输入邮政编码">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">公司法人</label>
        <div class="controls">
          <input type="text" id="legal_person_id" name="legalPerson" value="${bizUser.legalPerson}"
                 placeholder="请输入公司法人">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">开户银行</label>
        <div class="controls">
          <input type="text" id="bank" name="companyOpenBank" value="${bizUser.companyOpenBank}"
                 placeholder="请输入开户银行">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="form-field-1">银行账号</label>
        <div class="controls">
          <input type="text" id="banknum" name="companyBankAcount"
                 value="${bizUser.companyBankAcount}"
                 placeholder="请输入银行账号" onkeyup="this.value=this.value.replace(/\D/g,'').replace(/....(?!$)/g,'$& ')">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="form-actions">
        <button class="btn btn-info" type="submit"><i class="icon-ok"></i>保存</button>
      </div>

    </form>

  </div>
</div>


<%@ include file="/include/script.jsp" %>


<script type="text/javascript">
  top.hangge();

  // ============================================================================================  表单验证

  var validator = $("#contractFrom").validate({
    ignore: "",
    errorElement: 'span',
    errorClass: 'help-inline',
    focusInvalid: true,
    rules: {
      companyName: {
        required: true
      },
      companyAddr: {
        required: true
      },
      name: {
        required: true
      },
      phone: {
        required: true,
        phone: true
      },
      zipCode: {
        required: true,
        zipCode: true
      },
      legalPerson: {
        required: true
      },
      companyOpenBank: {
        required: true
      },
      companyFex: {
        required: true,
        companyFex: true
      },
      companyBankAcount: {
        required: true
      }

    },
    messages: {},

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
      // $(form).submit();

      ajaxSubmit(form, function (formData) {
        var count = BizUserService.update(formData).data;
        if (count === 1) {
          alert('修改成功');
        }
      });
    },
    invalidHandler: function (event, validator) { //display error alert on form submit
      // alert('请检查表单，输入合法的值。');
    }
  });

 /* $("#contractFrom").ajaxSubmit(function (formData) {
    var count = BizUserService.update(formData).data;
    if (count === 1) {
      alert('修改成功');
    }
  });*/

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

