<%--
  Created by IntelliJ IDEA.
  User: lichangde
  Date: 2016/9/9
  Time: 9:30
  
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

    <form id="user_register_form_id" id="loginbox" class="form-horizontal" style="margin-left: -70px;"
          enctype="multipart/form-data">
      <div class="control-group">

        <label class="control-label" for="loginnameR">用户名：</label>
        <div class="controls"><input class="single" single-name="username" single-msg="该用户名已注册"
                                     single="true"
                                     type="text" name="loginnameR"
                                     id="loginnameR" value=""

                                     placeholder="请输入用户名，最少4位"/>
        </div>
      </div>

      <div class="control-group">

        <label class="control-label" for="passwordR">密码：</label>
        <div class="controls"><input type="password" name="passwordR" id="passwordR"
                                     placeholder="请输入密码，需满足6-20位数字字母组合" value=""/>
        </div>
      </div>

      <div class="control-group">

        <label class="control-label" for="passwordR">确认密码：</label>
        <div class="controls"><input type="password" id="passwordRS" placeholder="请输入确认密码"
                                     value=""/>
        </div>
      </div>

      <div class="control-group">

        <label class="control-label" for="passwordR">手机号：</label>
        <div class="controls"><input class="single" single-name="phone" single-msg="该手机号已注册" single="true"
                                     type="text" name="phone" id="phone" value=""
                                     placeholder="请输入手机号"/>
        </div>
      </div>

      <div class="control-group">

        <label class="control-label" for="passwordR">邮箱：</label>
        <div class="controls"><input class="single" single-name="email" single-msg="该邮箱已经注册" single="true"
                                     type="text" name="email" id="email" value=""
                                     placeholder="请输入邮箱"/>
        </div>
      </div>

        <div class="form-actions">
          <a onclick="register();" class="btn btn-info" id="to-recoverR">注册</a>
      </div>
    </form>

  </div>
</div>

<%@ include file="/include/script.jsp" %>


<script type="text/javascript">
  top.hangge();
  $('#establishedDate').datepicker();


  var checkfn = {
    username: function (name) {
      var $loginnameR = name;
      var username = $.trim($loginnameR.val());
      var msg = '用户名不得为空';
      var rs = true;
      if (username == "") {
        rs = false;
      }
      if (rs && username.length < 5) {
        msg = '用户名不得少于4位';
        rs = false;
      }
      if (rs && name.attr('single') == 'false') {
        msg = name.attr('single-msg');
        rs = false;
      }
      if (!rs) {
        $loginnameR.focus();
        $loginnameR.tips({
          side: 2,
          msg: msg,
          bg: '#AE81FF',
          time: 3
        });
      }
      return rs;
    },
    password: function (password) {
      var $passwordR = password;
      password = $passwordR.val();
      var rs = true;
      var msg = "密码不得为空";
      if (password == "") {
        rs = false;
      }

      var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/;
      if (rs && !reg.test(password)) {
        msg = "密码不满足6-20位数字字母组合";
        rs = false;
      }
      var $passwordRS = $("#passwordRS");
      if (rs && $passwordRS.val() == "") {
        msg = '确认密码不得为空';
        rs = false;
      }

      if (rs && $passwordRS.val() != password) {
        msg = '两次密码不一致';
        rs = false;
      }
      if (!rs) {
        $passwordR.tips({
          side: 2,
          msg: msg,
          bg: '#AE81FF',
          time: 3
        });
        $passwordR.focus();
      }
      return rs;
    },
    email: function (em) {
      var $email = em;
      var email = $.trim($email.val());
      var rs = true;
      var msg = '邮箱不得为空';
      if (email == "") {
        rs = false;
      }
      var reg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
      if (rs && !reg.test(email)) {
        rs = false;
        msg = '请输入正确的邮箱';
      }
      if (rs && em.attr('single') == 'false') {
        rs = false;
        msg = em.attr('single-msg');
      }
      if (!rs) {
        $email.tips({
          side: 2,
          msg: msg,
          bg: '#AE81FF',
          time: 3
        });
        $email.focus();
      }
      return rs;
    },
    phone: function (ph) {
      var $phone = ph;
      var phone = $.trim($phone.val());
      var rs = true;
      var msg = '手机号不得为空';
      if (phone == "") {
        rs = false;
      }
      var reg = /^1\d{10}$/;
      if (rs && !reg.test(phone)) {
        rs = false;
        msg = '请输入正确的手机号';
      }
      if (rs && ph.attr('single') == 'false') {
        rs = false;
        msg = ph.attr('single-msg');
      }

      if (!rs) {
        $phone.tips({
          side: 2,
          msg: msg,
          bg: '#AE81FF',
          time: 3
        });
        $phone.focus();
      }
      return rs;
    }
  };
  /**
   * 注册
   */
  function register() {

    var rs = true;
    rs = checkfn.username($("#loginnameR"));
    if (rs)
      rs = checkfn.password($("#passwordR"));
    if (rs)
      rs = checkfn.phone($("#phone"));
    if (rs)
      rs = checkfn.email($("#email"));

    if (rs) {

      var data = {
        USERNAME: $("#loginnameR").val(),
        PASSWORD: $("#passwordR").val(),
        EMAIL: $('#email').val(),
        PHONE: $('#phone').val()
      };
      $.ajax({
        type: "POST",
        url: "/register",
        data: data,
        success: function (d) {
          if (d.code == 1) { //1：表示注册成功 0：注册失败
            $("#loginbox").tips({
              side: 1,
              msg: '注册成功',
              bg: '#68B500',
              time: 10
            });
            setTimeout(function () {
              top.diag.close();
            }, 2000);
          } else {
            $("#loginbox").tips({
              side: 1,
              msg: d.msg,
              bg: '#68B500',
              time: 10
            });
          }
        },
        error: function () {
          $("#loginbox").tips({
            side: 1,
            msg: '系统异常，请稍候再试',
            bg: '#68B500',
            time: 10
          });
        }
      });
    }
  }

</script>

</body>
</html>

