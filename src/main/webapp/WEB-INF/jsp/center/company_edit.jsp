<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/5
  Time: 13:34
  
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
  <title>企业信息</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>


<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <form action="/center/saveBizUser.do" name="companyInfoForm" class="form-horizontal" id="companyInfoForm" method="post">
      <input type="hidden" name="viewName" value="${viewName}">
      <input type="hidden" name="id" value="${bizUser.id}"/>
      <div class="control-group">
        <label class="control-label" for="company_info_id">企业名称</label>
        <div class="controls">
          <input type="text" name="companyName" id="company_info_id" value="${bizUser.companyName}"
                 data-value="${bizUser.companyName}" placeholder="请输入企业名称"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_plane_id">企业座机</label>
        <div class="controls">
          <input type="text" name="companyPlane" id="company_plane_id" value="${bizUser.companyPlane}"
                 placeholder="请输入企业座机号码"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_fex_id">传真</label>
        <div class="controls">
          <input type="text" name="companyFex" id="company_fex_id" value="${bizUser.companyFex}"
                 placeholder="请输入传真号码"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="business_scope_id">经营范围</label>
        <div class="controls">
          <input type="text" name="businessScope" id="business_scope_id" value="${bizUser.businessScope}"
                 placeholder="请输入企业经营范围"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="established_date_id">成立时间</label>

        <div class="controls">
          <div class="input-append date" id="establishedDate" data-date="${bizUser.establishedDate}" data-date-format="yyyy-mm-dd"
               data-date-viewmode="years" data-date-minviewmode="months">
            <input class="span2" type="text" name="establishedDate" id="established_date_id" readonly style="width: 193px;"
                   value="<fmt:formatDate  pattern="yyyy-MM-dd" value="${bizUser.establishedDate}"></fmt:formatDate>"
                   placeholder="请选择成立时间"/>
            <span class="add-on"><i class="icon-calendar"></i></span>
          </div>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="company_desc_id">企业简介</label>
        <div class="controls">
          <input type="text" name="companyDesc" id="company_desc_id" value="${bizUser.companyDesc}"
                 placeholder="请输入企业简介"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label" for="legal_person_id">企业法人</label>
        <div class="controls">
          <input type="text" name="legalPerson" id="legal_person_id" value="${bizUser.legalPerson}"
                 placeholder="请输入法人代表"/>
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
        <label class="control-label" for="company_website_id">企业网站</label>
        <div class="controls">
          <input type="text" name="companyWebsite" id="company_website_id" value="${bizUser.companyWebsite}"
                 placeholder="请输入企业网站"/>
          <span class="help-inline"></span>
        </div>
      </div>
      <div class="form-actions">
        <button class="btn btn-info btn-small" type="submit"><i class="icon-ok"></i> 保存</button>
        &nbsp; &nbsp; &nbsp;
        <button class="btn btn-small" type="reset"><i class="icon-undo"></i> 重置</button>
      </div>
    </form>
  </div>
</div>


<%@ include file="/include/script.jsp" %>


<script type="text/javascript">
  top.hangge();
  $('#establishedDate').datepicker();

  var validator = $("#companyInfoForm").validate({
    ignore: "",
    errorElement: 'span',
    errorClass: 'help-inline',
    focusInvalid: true,
    rules: {
      companyName: {
        required: true,
        company_name_unique: countValidator('biz_user', 'company_name')
      },
      companyPlane: {
        required: true,
        number: true
      },
      companyFex: {
        required: true,
        companyFex: true
      }
    },
    messages: {
      companyName: {
        required: '企业名称必填',
        company_name_unique: '企业名称已存在'
      },
      companyPlane: {
        required: '座机必填'
      },
      companyFex: {
        required: '传真必填'
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

