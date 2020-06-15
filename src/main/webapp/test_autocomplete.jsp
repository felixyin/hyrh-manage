<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/26
  Time: 16:12
  
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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">

  <style>
    /*   .ui-autocomplete {
         max-height: 200px;
         overflow-y: auto;
         !* prevent horizontal scrollbar *!
         overflow-x: hidden;
       }
       !* IE 6 doesn't support max-height
        * we use height instead, but this forces the menu to always be this tall
        *!
       * html .ui-autocomplete {
         height: 200px;
       }*/
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
    <%--<label for="autocomplete">Select a programming language: </label>--%>
    <%--<input id="autocomplete">--%>
    <div id="project-label">Select a project (type "j" for a start):</div>
    <img id="project-icon" src="images/transparent_1x1.png" class="ui-state-default" alt="">
    <input id="project">
    <input type="hidden" id="project-id">
    <p id="project-description"></p>
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
  </div>
</div>


<%@ include file="/include/script.jsp" %>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/static/UI_new/js/bootstrap-datepicker.min.js"></script>
<script>
  $('#id_book_month').datepicker();
  /*  var projects = [
   {
   value: "jquery",
   label: "jQuery",
   desc: "the write less, do more, JavaScript library",
   icon: "jquery_32x32.png"
   },
   {
   value: "jquery-ui",
   label: "jQuery UI",
   desc: "the official user interface library for jQuery",
   icon: "jqueryui_32x32.png"
   },
   {
   value: "sizzlejs",
   label: "Sizzle JS",
   desc: "a pure-JavaScript CSS selector engine",
   icon: "sizzlejs_32x32.png"
   }
   ];*/




  //  $("#project").autocomplete({
  //    search:"",
  //    minLength:0,
  //    source:
  ////        '/order/autoComplete.do',
  //        [
  //      {
  //        name:'1',
  //        number:1
  //      }  ,
  //      {
  //        name:'2',
  //        number:2
  //      }
  //    ],
  //
  ////  focus: function (event, ui) {
  ////    $("#project").val(ui.item.name);
  ////    return false;
  ////  },
  //// search: function( event, ui ) {
  ////  return
  //// },
  //    select: function (event, ui) {
  //      $("#project").val(ui.item.name);
  ////    $("#project-id").val(ui.item.id);
  ////      $("#project-description").html(ui.item.comment);
  ////      $( "#project-icon" ).attr( "src", "images/" + ui.item.unit );
  //
  //      return false;
  //    }
  //  }).data("ui-autocomplete")._renderItem = function (ul, item) {
  //    return $("<li>")
  //        .append("<div>" + item.number + ":" + item.name + "</div>")
  //        .appendTo(ul);
  //  };
  /*
   $( "#project" ).autocomplete({
   source: '/order/autoComplete.do'/!*[
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   "c++", "java", "php", "coldfusion", "javascript", "asp", "ruby",
   ]*!/
   });
   */


</script>
<script>
  $("#project").autocomplete({
    source: function (request, response) {
      $.ajax({
        url: "/order/autoComplete.do",

        dataType: "json",
        data: {
          term: request.term
        },
        success: function (data) {
          response($.map(data, function (item) {
            return {
              name: item.name,
            }
          }));
        }
      });
    },
    minLength: 0,
    select: function (event, ui) {
      console.log(ui.item.name)
      $("#project").val(ui.item.name);
      return false;
    }
  }).data("ui-autocomplete")._renderItem = function (ul, item) {
    return $("<li>")
        .append("<div>" + item.name + "</div>")
        .appendTo(ul);
  };
</script>
<%--<script>--%>

<%--$(document).ready(function(){--%>

<%--$.ui.autocomplete.prototype._renderItem = function (ul, item) {--%>
<%--return $("<li></li>")--%>
<%--.data("item.autocomplete", item)--%>
<%--.append("<div>" + item.name + "</div>")--%>
<%--.appendTo(ul);--%>
<%--};--%>

<%--//这里的ajax返回类型可以随自己定义，本代码后台把字符串传给前台，--%>
<%--$("#project").autocomplete({--%>
<%--source: function(request, response){--%>
<%--$.ajax({--%>
<%--url: "/order/autoComplete.do",--%>
<%--type: "GET",--%>
<%--data: {--%>
<%--keyword : $('#project').val()--%>
<%--},--%>
<%--success:function(data){--%>
<%--response( $.map( data, function( item ) {--%>
<%--return {--%>
<%--name: item.name,--%>
<%--}--%>
<%--}));--%>
<%--}--%>
<%--});--%>
<%--},--%>
<%--minLength: 1    //搜索时，最少1个字符时出结果--%>
<%--});--%>
<%--});--%>
<%--</script>--%>
</body>
</html>

