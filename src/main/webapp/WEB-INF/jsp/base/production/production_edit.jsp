<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 2016/8/22
  Time: 15:22
  To change this template use File | Settings | File Templates.
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
  <title>Form Elements - Ace Admin</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <meta name="description" content="Common form elements and layouts"/>

  <%@ include file="/include/css.jsp" %>

  <link rel="stylesheet" href="/plugins/zTree/3.5.19/zTreeStyle.css" type="text/css">
  <style type="text/css">
    .ace-file-input {
      width: 216px;
      display: inline-block;
      max-height: 25px;
    }

    .ace-file-input input {
      position: relative;
    }
  </style>

</head>
<body>

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">

    <form action="/base/${msg}.do" name="productionForm" class="form-horizontal" id="productionForm" method="post"
          enctype="multipart/form-data" style="margin-left: -90px;">
      <input type="hidden" name="productionId" id="production_id" value="${pd.id}"/>
      <input type="hidden" name="attachmentMap" id="attachment_map"/>

      <div class="control-group">
        <label class="control-label" for="categoryNameIpt">产品分类</label>
        <div class="controls">
          <input type="hidden" name="categoryId" id="category_id">
          <input id="categoryNameIpt" name="categoryName" type="text" readonly/>
          <span class="inline">
                        <button id="menuBtn" class="btn btn-primary btn-mini" onclick="showMenu(); return false;">
                        <i class="icon-edit"></i> 选择
                        </button>
                    </span>
          <span class="help-inline"></span>
          <div id="menuContent" class="menuContent"
               style="position: absolute; z-index: 4545; left: 74.85px; top: 29px; display: none; background: white none repeat scroll 0% 0%; border: 1px solid lightgray;">
            <ul id="treeDemo" class="ztree" style="margin-top:0; width:206px;"></ul>
          </div>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="number">产品编号</label>
        <div class="controls">
          <input type="text" name="number" id="number" value="${pd.number}"
                 placeholder="这里输入产品编号"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="number">产品名称</label>
        <div class="controls">
          <input type="text" name="name" id="name" value="${pd.name}"
                 placeholder="这里输入产品名称"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="content">产品介绍</label>
        <div class="controls">
          <%--<div class="row">--%>
          <%--<div class="span9">--%>
          <%--<script id="editor" type="text/plain" style="height:200px;width:90%;"></script>--%>
          <textarea name="content" id="content" style="height:200px;width:90%;"></textarea>
          <%--</div>--%>
          <%--</div>--%>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="comment">产品注释</label>
        <div class="controls">
          <input type="text" name="comment" id="comment" value="${pd.comment}"
                 placeholder="这里输入产品注释"/>
          <span class="help-inline">这里输入产品注释</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="price">产品单价</label>
        <div class="controls">
          <input type="text" name="price" id="price" value="${pd.price}"
                 placeholder="这里输入产品单价"/>
          <span class="help-inline">这里输入产品单价</span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="pack">打包方式</label>
        <div class="controls">
          <input type="text" name="pack" id="pack" value="${pd.pack}"
                 placeholder="这里输入打包方式"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="unit">计量单位</label>
        <div class="controls">
          <input type="text" name="unit" id="unit" value="${pd.unit}"
                 placeholder="这里输入计量单位"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="min_quantity">最小起订量</label>
        <div class="controls">
          <input type="text" name="minQuantity" id="min_quantity" value="${pd.min_quantity}"
                 placeholder="最小起订量"/>
          <span class="help-inline"></span>
        </div>
      </div>

      <c:forEach items="${pd.attachmentFileList}" var="a" varStatus="x">
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
      </c:forEach>

      <div id="my-add-atta-target" class="control-group">
        <label class="control-label" for="min_quantity">新增附件</label>
        <div class="controls">
          <button id="my-add-atta" class="btn btn-info btn-small">新增<i
              class="icon-cloud-upload icon-on-right"></i>
          </button>
        </div>
      </div>

      <div class="control-group">
        <label class="control-label" for="status">状态：</label>
        <div class="controls">
          <select name="status" id="status">
            <option value="0" ${pd.status == 0?"selected":""}>无效</option>
            <option value="1" ${pd.status == 1?"selected":""}>有效</option>
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


<script type="text/javascript" charset="utf-8">window.UEDITOR_HOME_URL = "<%=path%>/plugins/ueditor/";</script>
<script type="text/javascript" charset="utf-8" src="/plugins/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/plugins/ueditor/ueditor.all.js"></script>
<script type="text/javascript" src="/plugins/zTree/3.5.19/jquery.ztree.all.min.js"></script>

<script type="text/javascript">

  //    预定义产品分类变量
  var __categoryId = '${pd.category_id}';
  //    预定义分类树变量
  var __zNodes = ${categoryList};
  //    预定义产品内容变量
  var __content = '${pd.content}';
</script>
<script type="text/javascript" src="/static/js/base/production-edit.js"></script>

<script id="tpl-upload-file" type="text/x-handlebars-template">
  <div id="my-file-tr-{{index}}" class="control-group">
    <label class="control-label" for="min_quantity">新增附件</label>
    <div class="controls my-files">
      <input type="hidden" name="attachmentId" value=""/>
      <input id="my-file-{{index}}" type="file" name="attachmentFileList"/>
      <span class="help-inline" style="margin-top: -10px;">
                <a data-index="{{index}}"
                   class="btn btn-grey btn-mini my-file-del"
                   style="display: inline-block; ">
                <i class="icon-trash icon-4x icon-only"></i>
                删除
                </a>
            </span>
    </div>
  </div>
</script>

<%-- 文件选择框数据回显和效果处理 --%>
<c:forEach items="${pd.attachmentFileList}" var="a" varStatus="x">
  <script type="text/javascript">
    $(function () {
      $('#my-file-${x.index}').ace_file_input({
        no_file: '${a.filename}',
        btn_choose: '修改',
        btn_change: '修改',
        droppable: false,
        onchange: null,
        thumbnail: false//| true | large
//                                whitelist: 'pdf|docx|doc|xls|xlsx|txt',
//                                blacklist: 'exe|php'
        //onchange:''
        //
      });
    });
  </script>
</c:forEach>

</body>
</html>

