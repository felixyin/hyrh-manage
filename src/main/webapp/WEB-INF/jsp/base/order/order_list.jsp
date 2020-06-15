<%--
  User: thankful
  Date: 2016/8/30
  订单列表
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
  <title></title>
  <base href="<%=basePath%>">

  <%@ include file="/include/css.jsp" %>

  <link rel="stylesheet" href="plugins/zTree/3.5.19/zTreeStyle.css" type="text/css">

</head>
<body>


<div class="container-fluid " id="main-container">


  <div id="page-content" class="clearfix ">

    <div class="row-fluid">


      <div class="row-fluid ">

        <!-- 检索  -->
        <form action="base/listProductions.do" method="post" name="productionForm" id="productionForm">
          <table>
            <tr>
              <td>
                <input type="hidden" name="categoryId" id="categoryIptId">
                fen lei: <input id="categoryNameIpt" type="text" readonly value=""
                                style="width:120px;"/>
                &nbsp;<a id="menuBtn" href="#" onclick="showMenu(); return false;">xuan ze</a>

                <div id="menuContent" class="menuContent"
                     style="position: absolute; z-index: 4545; left: 74.85px; top: 29px; display: none; background: white none repeat scroll 0% 0%; border: 1px solid lightgray;">
                  <ul id="treeDemo" class="ztree" style="margin-top:0; width:160px;"></ul>
                </div>
              </td>
              <td>
						<span class="input-icon">
							<input autocomplete="off" type="text" name="number" value="${pd.number }"
                     placeholder="请输入产品编号"/>
							<i class="icon-search"></i>
						</span>
              </td>
              <td>
						<span class="input-icon">
							<input autocomplete="off" type="text" name="name" value="${pd.name }"
                     placeholder="请输入产品名称"/>
							<i class="icon-search"></i>
						</span>
              </td>
            </tr>
            <tr>
              <td>
						<span class="input-icon">
							<input autocomplete="off" type="text" name="content" value="${pd.content }"
                     placeholder="请输入要搜索的产品内容"/>
							<i class="icon-search"></i>
						</span>
              </td>
              <td>
                <select name="status">
                  <option value="" selected>全部</option>
                  <option value="0">失效</option>
                  <option value="1">有效</option>
                </select>
              </td>
              <c:if test="${QX.cha == 1 }">
                <td style="vertical-align:top;">
                  <button class="btn btn-mini btn-light" onclick="search();" title="检索"><i
                      class="icon-search"></i></button>
                </td>
                <%-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='<%=basePath%>/user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td>
                 <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i class="icon-download-alt"></i></a></td>
                 <c:if test="${QX.edit == 1 }"><td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td></c:if>--%>
              </c:if>
            </tr>
          </table>
          <!-- 检索  -->


          <table id="table_report" class="table table-striped table-bordered table-hover">

            <thead>
            <tr>
              <th class="center">
                <label><input type="checkbox" id="zcheckbox"/><span class="lbl"></span></label>
              </th>
              <th>序号</th>
              <th>所属分类</th>
              <th>产品编号</th>
              <th>产品名称</th>
              <%--<th>产品描述</th>--%>
              <th>注释</th>
              <th>打包方式</th>
              <th>单位</th>
              <th>最小起订量</th>
              <th>创建日期</th>
              <th>修改日期</th>
              <th>状态</th>
              <th class="center">操作</th>
            </tr>
            </thead>

            <tbody>

            <!-- 开始循环 -->
            <c:choose>
              <c:when test="${not empty productionList}">
                <c:if test="${QX.cha == 1 }">
                  <c:forEach items="${productionList}" var="p" varStatus="vs">

                    <tr>
                      <td class='center' style="width: 30px;">
                        <label><input type='checkbox' name='ids' value="${p.id}"/><span
                            class="lbl"></span></label>
                      </td>
                      <td class='center' style="width: 30px;">${vs.index+1}</td>
                      <td>${p.category_name}</td>
                      <td>${p.number}</td>
                      <td><a class='btn-info' title="产品详细" onclick="viewProduction('${p.id}')">${p.name}</a></td>
                        <%--<td>${p.content}</td>--%>
                      <td>${p.comment}</td>
                      <td>${p.pack}</td>
                      <td>${p.unit}</td>
                      <td>${p.min_quantity}</td>
                      <td>${p.cdate}</td>
                      <td>${p.udate}</td>
                      <td>
                        <c:if test="${p.status ==0}">
                          失效
                        </c:if>
                        <c:if test="${p.status ==1}">
                          有效
                        </c:if>
                      </td>
                      <td>
                        <c:if test="${QX.edit == 1 }">
                          <a class='btn btn-mini btn-info' title="编辑"
                             onclick="editProduction('${p.id}');"><i
                              class='icon-edit'></i></a>
                        </c:if>
                      </td>
                    </tr>

                  </c:forEach>
                </c:if>

                <c:if test="${QX.cha == 0 }">
                  <tr>
                    <td colspan="10" class="center">您无权查看</td>
                  </tr>
                </c:if>
              </c:when>
              <c:otherwise>
                <tr class="main_info">
                  <td colspan="10" class="center">没有相关数据</td>
                </tr>
              </c:otherwise>
            </c:choose>


            </tbody>
          </table>

          <div class="page-header position-relative">
            <table style="width:100%;">
              <tr>
                <td style="vertical-align:top;">
                  <c:if test="${QX.add == 1 }">
                    <a class="btn btn-small btn-success" onclick="add();">新增</a>
                  </c:if>
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
                  <div class="pagination"
                       style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div>
                </td>
              </tr>
            </table>
          </div>
        </form>

      </div>


      <!-- PAGE CONTENT ENDS HERE -->
    </div>
    <!--/row-->

  </div>
  <!--/#page-content-->
</div>
<!--/.fluid-container#main-container-->

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
  <i class="icon-double-angle-up icon-only"></i>
</a>

<%@ include file="/include/script.jsp" %>


<script type="text/javascript">

  $(top.hangge());

  //检索
  function search() {
    top.jzts();
    $("#productionForm").submit();
  }


  //去发送电子邮件页面
  function sendEmail(EMAIL) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "发送电子邮件";
    diag.URL = '<%=basePath%>head/goSendEmail.do?EMAIL=' + EMAIL;
    diag.Width = 660;
    diag.Height = 470;
    diag.CancelEvent = function () { //关闭事件
      diag.close();
    };
    diag.show();
  }

  //去发送短信页面
  function sendSms(phone) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "发送短信";
    diag.URL = '<%=basePath%>head/goSendSms.do?PHONE=' + phone + '&msg=appuser';
    diag.Width = 600;
    diag.Height = 265;
    diag.CancelEvent = function () { //关闭事件
      diag.close();
    };
    diag.show();
  }
  //新增
  function add() {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "新增";
    diag.URL = '<%=basePath%>base/goAddProduction.do';

    diag.Width = 825;
    diag.Height = 415;
    diag.CancelEvent = function () { //关闭事件
      if (diag.innerFrame.contentWindow.document.body.style.display == 'none') {
        if ('${page.currentPage}' == '0') {
          top.jzts();
          setTimeout("self.location=self.location", 100);
        } else {
          nextPage(${page.currentPage});
        }
      }
      diag.close();
    };
    diag.show();
  }

  //修改
  function editProduction(productionId) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "修改产品";
    diag.URL = '<%=basePath%>base/goEditProduction.do?productionId=' + productionId;
    diag.Width = 1000;
    diag.Height = 600;
    diag.CancelEvent = function () { //关闭事件
      if (diag.innerFrame.contentWindow.document.body.style.display == 'none') {
        if ('${page.currentPage}' == '0') {
          top.jzts();
          setTimeout("self.location=self.location", 100);
        } else {
          nextPage(${page.currentPage});
        }
      }
      diag.close();
    };
    diag.show();
  }


  // 查看
  function viewProduction(production_id) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "查看详细";
    diag.URL = '<%=basePath%>base/viewProduction.do?production_id=' + production_id;
    diag.Width = 825;
    diag.Height = 415;
    diag.CancelEvent = function () { //关闭事件
      if (diag.innerFrame.contentWindow.document.body.style.display == 'none') {
        if ('${page.currentPage}' == '0') {
          top.jzts();
          setTimeout("self.location=self.location", 100);
        } else {
          nextPage(${page.currentPage});
        }
      }
      diag.close();
    };
    diag.show();
  }


  //删除
  function delUser(userId, msg) {
    bootbox.confirm("确定要删除[" + msg + "]吗?", function (result) {
      if (result) {
        top.jzts();
        var url = "<%=basePath%>user/deleteU.do?USER_ID=" + userId + "&tm=" + new Date().getTime();
        $.get(url, function (data) {
          nextPage(${page.currentPage});
        });
      }
    });
  }

  //批量操作
  function makeAll(msg) {
    bootbox.confirm(msg, function (result) {
      if (result) {
        var str = '';
        var emstr = '';
        var phones = '';
        for (var i = 0; i < document.getElementsByName('ids').length; i++) {
          if (document.getElementsByName('ids')[i].checked) {
            if (str == '') str += document.getElementsByName('ids')[i].value;
            else str += ',' + document.getElementsByName('ids')[i].value;

            if (emstr == '') emstr += document.getElementsByName('ids')[i].id;
            else emstr += ';' + document.getElementsByName('ids')[i].id;

            if (phones == '') phones += document.getElementsByName('ids')[i].alt;
            else phones += ';' + document.getElementsByName('ids')[i].alt;
          }
        }
        if (str == '') {
          bootbox.dialog("您没有选择任何内容!",
              [
                {
                  "label": "关闭",
                  "class": "btn-small btn-success",
                  "callback": function () {
                    //Example.show("great success");
                  }
                }
              ]
          );

          $("#zcheckbox").tips({
            side: 3,
            msg: '点这里全选',
            bg: '#AE81FF',
            time: 8
          });

          return;
        } else {
          if (msg == '确定要删除选中的数据吗?') {
            top.jzts();
            $.ajax({
              type: "POST",
              url: '<%=basePath%>user/deleteAllU.do?tm=' + new Date().getTime(),
              data: {USER_IDS: str},
              dataType: 'json',
              //beforeSend: validateData,
              cache: false,
              success: function (data) {
                $.each(data.list, function (i, list) {
                  nextPage(${page.currentPage});
                });
              }
            });
          } else if (msg == '确定要给选中的用户发送邮件吗?') {
            sendEmail(emstr);
          } else if (msg == '确定要给选中的用户发送短信吗?') {
            sendSms(phones);
          }


        }
      }
    });
  }

</script>

<script type="text/javascript">

  $(function () {

    //日期框
    $('.date-picker').datepicker();

    //下拉框
    $(".chzn-select").chosen();
    $(".chzn-select-deselect").chosen({allow_single_deselect: true});

    //复选框
    $('table th input:checkbox').on('click', function () {
      var that = this;
      $(this).closest('table').find('tr > td:first-child input:checkbox')
          .each(function () {
            this.checked = that.checked;
            $(this).closest('tr').toggleClass('selected');
          });

    });

  });

  //导出excel
  function toExcel() {
    var USERNAME = $("#nav-search-input").val();
    var lastLoginStart = $("#lastLoginStart").val();
    var lastLoginEnd = $("#lastLoginEnd").val();
    var ROLE_ID = $("#role_id").val();
    window.location.href = '<%=basePath%>user/excel.do?USERNAME=' + USERNAME + '&lastLoginStart=' + lastLoginStart + '&lastLoginEnd=' + lastLoginEnd + '&ROLE_ID=' + ROLE_ID;
  }

  //打开上传excel页面
  function fromExcel() {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "EXCEL 导入到数据库";
    diag.URL = '<%=basePath%>user/goUploadExcel.do';
    diag.Width = 300;
    diag.Height = 150;
    diag.CancelEvent = function () { //关闭事件
      if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
        if ('${page.currentPage}' == '0') {
          top.jzts();
          setTimeout("self.location.reload()", 100);
        } else {
          nextPage(${page.currentPage});
        }
      }
      diag.close();
    };
    diag.show();
  }

</script>
<script type="text/javascript" src="plugins/zTree/3.5.19/jquery.ztree.all.min.js"></script>
<!--  shuzhuangcaidan -->
<SCRIPT type="text/javascript">
  <!--
  var setting = {
    view: {
      dblClickExpand: false
    },
    data: {
      simpleData: {
        enable: true
      }
    },
    callback: {
      beforeClick: beforeClick,
      onClick: onClick
    }
  };

  var zNodes = ${categoryList};

  function beforeClick(treeId, treeNode) {
    var check = (treeNode && !treeNode.isParent);
    // TODO
    if (!check) alert("weixuanzefenlei...");
    return check;
  }

  function onClick(e, treeId, treeNode) {
    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
    var node = zTree.getSelectedNodes()[0];
    $("#categoryNameIpt").val(node.name);
    $('#categoryIptId').val(node.id);
    hideMenu();
  }

  function showMenu() {
    var cityObj = $("#categoryNameIpt");
    var cityOffset = $("#categoryNameIpt").offset();
    $("#menuContent").css({
      left: cityOffset.left + "px",
      top: cityOffset.top + cityObj.outerHeight() + "px"
    }).slideDown("fast");

    $("body").bind("mousedown", onBodyDown);
  }
  function hideMenu() {
    $("#menuContent").fadeOut("fast");
    $("body").unbind("mousedown", onBodyDown);
  }
  function onBodyDown(event) {
    if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length > 0)) {
      hideMenu();
    }
  }

  $(document).ready(function () {
    $.fn.zTree.init($("#treeDemo"), setting, zNodes);
  });
  //-->


</SCRIPT>
</body>
</html>
