<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 2016/8/22
  Time: 10:45
  To change this template use File | Settings | File Templates.
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
    <style type="text/css">
        .ztree li span.button.add {
            margin-left: 2px;
            margin-right: -1px;
            background-position: -144px 0;
            vertical-align: top;
            *vertical-align: middle
        }

        .ztree li {
            line-height: 22px !important;
        }

        .ztree * {
            font-size: 20px !important;
        }
    </style>

</head>
<body>


<div class="container-fluid" id="main-container">


    <div id="page-content" class="clearfix">

        <div class="row-fluid">


            <div class="row-fluid">

                <ul id="treeDemo" class="ztree"></ul>

            </div>

            <div class="row-fluid">
                <form id="categoryForm" action="base/saveAllCategory.do" method="post">
                    <input id="categoryList" type="hidden" name="categoryList">
                    <input id="submitBtn" type="button" class="btn btn-primary" value="保存">
                </form>
            </div>

            <!-- PAGE CONTENT ENDS HERE -->
        </div><!--/row-->

    </div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->

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
        $("#categoryForm").submit();
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
            if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
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
    function editProduction(production_id) {
        top.jzts();
        var diag = new top.Dialog();
        diag.Drag = true;
        diag.Title = "修改";
        diag.URL = '<%=basePath%>base/goEditProduction.do?production_id=' + production_id;
        diag.Width = 825;
        diag.Height = 415;
        diag.CancelEvent = function () { //关闭事件
            if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
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
<script type="text/javascript" src="/plugins/zTree/3.5.19/jquery.ztree.all.min.js"></script>
<SCRIPT type="text/javascript">
    var setting = {
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false
        },
        edit: {
            enable: true,
            editNameSelectAll: true,
            showRemoveBtn: true,
            removeTitle: 'shanchu',
            showRenameBtn: true,
            renameTitle: 'chongmuingming'
            /*drag: {
             isCopy: false,
             isMove: true,
             prev: true,
             next: true,
             inner: true
             }*/
        },
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {

            beforeDrop: zTreeBeforeDrop,
            beforeEditName: beforeEditName,
            beforeRemove: beforeRemove,
            beforeRename: beforeRename,
            onRemove: onRemove,
            onRename: onRename
        }
    };

    var zNodes = ${categoryList};
    var log, className = "dark";

    function zTreeBeforeDrop(treeId, treeNodes, targetNode, moveType) {
        if (moveType == 'inner' && targetNode.productionCount > 0) {
            return confirm("分类 " + targetNode.name + " 已经关联了" + targetNode.productionCount + "个产品，拖入后这些产品需要重新修改其所属分类，确定要拖入吗？");
        }
        return true;
//            return !(targetNode == null || (moveType != "inner" && !targetNode.parentTId));
    }

    function beforeEditName(treeId, treeNode) {
        className = (className === "dark" ? "" : "dark");
        showLog("[ " + getTime() + " beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        return confirm("确认编辑这个分类 '" + treeNode.name + "' 吗？");
    }
    function beforeRemove(treeId, treeNode) {
        className = (className === "dark" ? "" : "dark");
        showLog("[ " + getTime() + " beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        return confirm("确认删除这个分类'" + treeNode.name + "' 吗？");
    }
    function onRemove(e, treeId, treeNode) {
        showLog("[ " + getTime() + " onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
    }
    function beforeRename(treeId, treeNode, newName, isCancel) {
        className = (className === "dark" ? "" : "dark");
        showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
        if (newName.length == 0) {
            alert("分类名称不能为空");
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            setTimeout(function () {
                zTree.editName(treeNode)
            }, 10);
            return false;
        }
        return true;
    }
    function onRename(e, treeId, treeNode, isCancel) {
        showLog((isCancel ? "<span style='color:red'>" : "") + "[ " + getTime() + " onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>" : ""));
    }
    function showLog(str) {
        if (!log) log = $("#log");
        log.append("<li class='" + className + "'>" + str + "</li>");
        if (log.children("li").length > 8) {
            log.get(0).removeChild(log.children("li")[0]);
        }
    }
    function getTime() {
        var now = new Date(),
                h = now.getHours(),
                m = now.getMinutes(),
                s = now.getSeconds(),
                ms = now.getMilliseconds();
        return (h + ":" + m + ":" + s + " " + ms);
    }

    var newCount = 1;
    function addHoverDom(treeId, treeNode) {
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_" + treeNode.tId).length > 0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
                + "' title='add node' onfocus='this.blur();'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_" + treeNode.tId);
        if (btn) btn.bind("click", function () {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            zTree.addNodes(treeNode, {
                id: (${maxCategoryId} +newCount),
                pId: treeNode.id,
                name: "new node" + (newCount++)
            });
            return false;
        });
    }

    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_" + treeNode.tId).unbind().remove();
    }

    function selectAll() {
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.editNameSelectAll = $("#selectAll").attr("checked");
    }

    $(document).ready(function () {
        $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        $("#selectAll").bind("click", selectAll);

        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.setting.edit.drag.isCopy = true;
        zTree.setting.edit.drag.isMove = true;
        zTree.setting.edit.drag.prev = true;
        zTree.setting.edit.drag.inner = true;
        zTree.setting.edit.drag.next = true;

        $('#submitBtn').click(function () {
            var categoryList = [];

            function diGuiSeleted(nodes) {
                $.each(nodes, function (i, n) {
                    var child = n.children;
                    /*id:13, pId:1, name:"can't drag 1-3", open:true, drag:false*/
                    categoryList.push({name: n.name, id: n.id, pId: n.pId || 0});
                    if (child && child.length) {
                        diGuiSeleted(child);
                    }
                });
            }

            diGuiSeleted(zTree.getNodes());
            $('#categoryList').val(JSON.stringify(categoryList));
//                return;
            $('#categoryForm').submit();
        });

    });

    // 保存成功的提示
    try {
        var msg = '${msg}';
        if (msg == 'saved') {
            alert('保存成功');
        }
    } catch (e) {
    }
</SCRIPT>

</body>
</html>
