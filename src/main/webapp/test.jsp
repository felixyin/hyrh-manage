<%--
  Created by IntelliJ IDEA.
  User: fy
  Date: 2016/9/15
  Time: 2:07
  
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

<div class="container-fluid" style="margin-top: 30px;">
  <div class="row-fluid">
    <div>
      <button id="insert" class="btn btn-info">insert</button>
      <button id="delete" class="btn btn-info">delete</button>
      <button id="updateSelective" class="btn btn-info">updateSelective</button>
      <button id="selectOne" class="btn btn-info">selectOne</button>
      <button id="searchListPage" class="btn btn-info">searchListPage</button>
    </div>
    <div id="result"></div>
  </div>
</div>


<%@ include file="/include/script.jsp" %>

<script type="text/javascript" src="/static/genjs/service.js"></script>
<script type="text/javascript">
  function show(data) {
    var resultHtml = JSON.stringify(data)
    $('#result').text(resultHtml);
  }

  // -------------------------------------------------------------------- 下面是老版本js2java调用方法
  /**
   * @deprecated
   * @param data
   * @returns {boolean}
   */
  function js2java(data) {
//    FIXME 已经不建议使用这个底层方法
    return false;
    $.ajax({
      url: 'http://localhost:8080/common/js2java.do',
      data: data,
      method: 'post',
      dataType: 'json',
      success: show
    });
  }

  $('#selectOne').click(function () {
    js2java({
      service: 'productionService',
      method: 'selectOne',
      types: ['int'],
      params: [1]
    });
  });

  $('#updateSelective').click(function () {
    var updateData = {
      id: 1,
      name: "中文-" + Math.random(9) * 10
    };
    js2java({
      service: 'productionService',
      method: 'updateSelective',
      types: ['com.greathammer.entity.DicProduction'],
      params: [encodeURIComponent(JSON.stringify(updateData))]
    });
  });

</script>

<script type="text/javascript">

  // -------------------------------------------------------------------- 下面是新版本js2java调用方法
  $('#selectOne').click(function () {
    var data = ProductionService.selectOne(1);
    show(data);
  });

  $('#updateSelective').click(function () {
    var updateData = {
      id: 1,
      name: "中文-" + Math.random(9) * 10
      // 其他字段请自行添加尝试
    };
    var data = ProductionService.updateSelective(updateData);
    show(data);
  });

  $('#searchListPage').click(function () {
    var data = ProductionService.searchListPage({}, {name: null});
    var data = ProductionService.searchListPage({showCount: 3, currentPage: 2}, {name: null});
//    data = ProductionService.searchListPage({}, {name: '中'})
    show(data);
  });

  $('#insert').click(function () {
    var data = ProductionService.insertSelective({
      categoryId: '1',
      number: 'NO' + Math.random(9) * 10,
      name: '物料名称测试-1' + Math.random(9) * 10,
      comment: 'yinbin add',
      price: 286.5,
      pack: '20KG袋装',
      unit: '千克',
      minQuantity: 1000,
      sequence: 2,
      creatorId: 1,
      status: 1,
      content: '这里是产品的详细介绍文章，每个产品各不相同，又因为内容比较多，多以在这里我就不写了，哈哈'
    });
    show(data);
  });

  $('#delete').click(function () {
    var productions = ProductionService.searchListPage({showCount: 3, currentPage: 2}, {name: null});
    if (productions.data.length > 0) {
      var id = productions.data[productions.data.length - 1].id;
      var deleteRowCount = ProductionService.delete(id).data;
      show(deleteRowCount);
    }
  });

</script>

<script type="text/javascript">
  <%--性能测试--%>
/*
  return;
  setInterval(function () {
    var data = ProductionService.insert({
      categoryId: '1',
      number: 'NO' + Math.random(9) * 10,
      name: '性能测试-1' + Math.random(9) * 10,
      comment: 'yinbin add',
      price: 286.5,
      pack: '20KG袋装',
      unit: '千克',
      minQuantity: 1000,
      sequence: 2,
      creatorId: 1,
      status: 1,
      content: '这里是产品的详细介绍文章，每个产品各不相同，又因为内容比较多，多以在这里我就不写了，哈哈'
    });
    console.log(data);
    var updateData = {
      id: 1,
      name: "性能-" + Math.random(9) * 10
      // 其他字段请自行添加尝试
    };
    var data = ProductionService.updateSelective(updateData);
    console.log(data);
    var productions = ProductionService.searchListPage({showCount: 3, currentPage: 2}, {name: null});
    if (productions.data.length > 0) {
      var id = productions.data[productions.data.length - 1].id;
      var deleteRowCount = ProductionService.delete(id).data;
      console.log(deleteRowCount);
    }
  }, 10);
*/

</script>

</body>
</html>

