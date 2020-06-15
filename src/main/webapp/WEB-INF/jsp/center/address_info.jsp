<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/7
  Time: 15:34
  
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
  <title>收货地址</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content=""/>

  <%@ include file="/include/css.jsp" %>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <div class="widget-box">
      <div class="widget-header header-color-blue">
        <h5 class="bigger lighter"><i class="icon-table"></i>收货地址管理</h5>
        <div class="widget-toolbar widget-toolbar-light no-border"></div>
      </div>
      <div class="">
        <c:if test="${QX.cha == 1 }">
          <form action="/center/defaultAddressInfo.do" id="set_default_address_form_id">
            <input type="hidden" name="id" id="address_id">
            <input type="hidden" name="consigneeId" id="consignee_id">

            <table id="table_bug_report" class="table table-striped table-bordered table-hover">
              <thead>
              <tr>
                <th>收货地址</th>
                <th>联系人</th>
                <th>联系方式</th>
                <th>操作</th>
              </tr>
              </thead>

              <tbody>
              <!-- 开始循环 -->
              <c:forEach items="${requestScope.addressInfo}" var="addr">
                <tr class="${addr.status == 2 ? "bolder":""}">
                  <td>${addr.address}</td>
                  <td>${addr.consignee_name}</td>
                  <td>${addr.consignee_phone}</td>
                  <td>
                    <c:if test="${addr.status == 1}">
                      <a class='btn btn-mini btn-success' title="设为默认" onclick="defaultInfo(${addr.id},'${consigneeId}');">
                        <i class=''></i>
                        设为默认
                      </a>
                    </c:if>
                    <c:if test="${addr.status == 2}">
                      <a class='btn btn-mini btn-grey' title="已为默认">
                        <i class=''></i>
                        已为默认
                      </a>
                    </c:if>

                    <c:if test="${QX.edit == 1 }">
                      <a class='btn btn-mini btn-info' title="编辑" onclick="editAddress(${addr.id});">
                        <i class='icon-edit'></i>
                        编辑
                      </a>
                    </c:if>
                    <c:if test="${QX.del == 1 }">
                      <c:if test="${addr.status == 1}">
                        <a class='btn btn-mini btn-danger' id="btn-show" title="删除" onclick="delInfo(${addr.id});">
                          <i class='icon-remove'></i>
                          删除
                        </a>
                      </c:if>
                      <c:if test="${addr.status == 2}">
                        <a class='btn btn-mini btn-grey' id="btn-hide" title="删除">
                          <i class='icon-remove'></i>
                          删除
                        </a>
                      </c:if>

                    </c:if>
                  </td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
          </form>
        </c:if>
      </div>

      <div class="controls">
        <c:if test="${QX.add == 1 }">
          <button id="my-add-atta" class="btn btn-info btn-small" onclick="add('${consigneeId}')">添加新地址<i
              class=" icon-adjust icon-on-right"></i>
          </button>
        </c:if>
      </div>
    </div>
  </div>
</div>


<%@ include file="/include/script.jsp" %>


<script type="text/javascript">
  top.hangge();
  //    预定义当前分页变量
  var __currentPage = 0;

  /**
   * 新增
   */
  function add(consigneeId) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "新增";
    diag.URL = '/center/goAddAddress.do?consigneeId=' + consigneeId;
    diag.Width = 800;
    diag.Height = 300;
    diag.CancelEvent = function () { //关闭事件
      if (diag.innerFrame.contentWindow.document.body.style.display == 'none') {
        if (__currentPage == '0') {
          top.jzts();
          setTimeout("self.location=self.location", 100);
        } else {
          nextPage(__currentPage);
        }
      }
      diag.close();
    };
    diag.show();
    return false;
  }

  /**
   * 编辑
   */
  function editAddress(id) {
    top.jzts();
    var diag = new top.Dialog();
    top.__edit_address_dialog = diag;
    diag.Drag = true;
    diag.Title = "编辑";
    diag.URL = '/center/addressEdit.do?id=' + id;
    diag.Width = 800;
    diag.Height = 300;
    diag.CancelEvent = function () { //关闭事件
      if (diag.innerFrame.contentWindow.document.body.style.display == 'none') {
        if (__currentPage == '0') {
          top.jzts();
          setTimeout("self.location=self.location", 100);
        } else {
          nextPage(__currentPage);
        }
      }
      diag.close();
    };
    diag.show();
    return false;
  }

  /**
   * 删除
   *
   * @param id
   * @param isParent
   */
  function delInfo(id, isParent) {
    var flag = false;
    if (isParent) {
      if (confirm("确定要删除该菜单吗？其下子菜单将一并删除！")) {
        flag = true;
      }
    } else {
      if (confirm("确定要删除该菜单吗？")) {
        flag = true;
      }
    }
    if (flag) {
      top.jzts();
      var url = "<%=basePath%>center/deleteAddress.do?id=" + id + "&guid=" + new Date().getTime();
      $.get(url, function (data) {
        top.jzts();
        document.location.reload();
      });
    }
    return false;
  }

  /**
   * 设为默认
   *
   * @param id
   * @param consigneeId
   * @returns {*}
   */
  function defaultInfo(id, consigneeId) {

    $('#address_id').val(id);
    $('#consignee_id').val(consigneeId);
    $('#set_default_address_form_id').get(0).submit();
  }

</script>


</body>
</html>

