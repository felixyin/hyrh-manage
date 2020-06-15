<%--
  Created by IntelliJ IDEA.
  User: lichangde
  Date: 2016/9/5
  Time: 16:00
  
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
  <title>Title</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;" style="padding-right: 20px">
  <div class="row-fluid">

    <form id="accountInfoFrom" class="form-horizontal" style="margin-left: -90px;">
      <input type="hidden" name="viewName" value="${viewName}">
      <input type="hidden" name="id" value="${bizUser.id}">
      <input type="hidden" name="sysUserId" value="${bizUser.sysUserId}">

      <div class="control-group">
        <label class="control-label" for="username">用户名</label>
        <div class="controls">
          <input type="text" id="username" name="username" value="${bizUser.username}"
                 data-value="${bizUser.username}" placeholder="请输入用户名">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="password">密码</label>
        <div class="controls">
          <input type="password" id="password" name="password" placeholder="请输入密码">
          <span class="help-inline">为空则密码不修改</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="password_again">确认密码</label>
        <div class="controls">
          <input type="password" id="password_again" name="password_again" placeholder="请输入密码">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="phone">手机</label>
        <div class="controls">
          <input type="text" id="phone" name="phone" value="${bizUser.phone}"
                 data-value="${bizUser.phone}" placeholder="请输入手机号码">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="name">姓名</label>
        <div class="controls">
          <input type="text" id="name" name="name" value="${bizUser.name}" placeholder="请输入真实姓名">
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="emil">邮箱</label>
        <div class="controls">
          <input type="text" id="emil" name="email" value="${bizUser.email}"
                 data-value="${bizUser.email}" placeholder="请输入邮箱">
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

  // ==============================================================================表单验证

  var validator = $("#accountInfoFrom").validate({
    ignore: "",
    errorElement: 'span',
    errorClass: 'help-inline',
    focusInvalid: true,
    rules: {
      username: {
        username_unique: countValidator('biz_user', 'username'),
        required: true

      },
      phone: {
        required: true,
        phone: true,
        phone_unique: countValidator('biz_user', 'phone')
      },
      name: {
        required: true
      },
      email: {
        required: true,
        email: true,
        email_unique: countValidator('biz_user', 'email')
      },
      password: {
        passwordRule: true
      },
      password_again: {
        equalTo: "#password"
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
      ajaxSubmit(form, function (formData) {
        var count = BizUserService.update(formData).data;
        if (count === 1) {
          alert('修改成功');
        }
      });

//      form.submit();
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

