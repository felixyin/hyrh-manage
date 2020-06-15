<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>${pd.SYSNAME}</title>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

  <link rel="stylesheet" href="static/login/bootstrap.min.css"/>
  <link rel="stylesheet" href="static/login/css/camera.css"/>
  <link rel="stylesheet" href="static/login/bootstrap-responsive.min.css"/>
  <link rel="stylesheet" href="static/login/matrix-login.css"/>
  <link href="static/login/font-awesome.css" rel="stylesheet"/>
  <script type="text/javascript" src="static/js/jquery-1.5.1.min.js"></script>

</head>
<body>

<div
    style="width:100%;text-align: center;margin: 0 auto;position: absolute;">
  <div id="loginbox">

    <form action="" method="post" name="loginForm"
          id="loginForm">
      <div class="control-group normal_text">
        <h3>
          <img src="static/login/logo.png" alt="Logo"/>
        </h3>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png"/></i>
							</span><input type="text" name="loginname" id="loginname" value="" placeholder="请输入用户名"/>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png"/></i>
							</span><input type="password" name="password" id="password" placeholder="请输入密码" value=""/>
          </div>
        </div>
      </div>
      <div style="float:right;padding-right:10%;">
        <div style="float: left;margin-top:3px;margin-right:2px;">
          <font color="white">记住密码</font>
        </div>
        <div style="float: left;">
          <input name="form-field-checkbox" id="saveid" type="checkbox"
                 onclick="savePaw();" style="padding-top:0px;"/>
        </div>
      </div>
      <div class="form-actions">
        <div style="width:86%;padding-left:8%;">

          <div style="float: left;">
            <i><img src="static/login/yan.png"/></i>
          </div>
          <div style="float: left;" class="codediv">
            <input type="text" name="code" id="code" class="login_code"
                   style="height:16px; padding-top:0px;"/>
          </div>
          <div style="float: left;">
            <i><img style="height:22px;" id="codeImg" alt="点击更换"
                    title="点击更换" src=""/></i>
          </div>

						<span class="pull-right" style="padding-right:3%;">
							<a href="javascript:quxiao();" class="btn btn-success">取消</a>
						</span>
						<span class="pull-right">
							<a onclick="severCheck();" class="flip-link btn btn-info" id="to-recover">登录</a>
            </span>
        </div>
      </div>
      <div style="display: table;width:100%;">
        <div style="width:86%;padding-bottom: 10px;display: inherit;">
          <a onclick="toRegister();" href="javascript:void(0);"
             class="pull-right" style="color: white;">立即注册</a>
        </div>
      </div>

    </form>

    <style>
      #registerForm > .control-group {
        padding: 5px 0 !important;
      }
    </style>
    <form action="" method="post" name="registerForm"
          id="registerForm" style="display:none;    ">
      <div class="control-group normal_text">
        <h3>
          <img src="static/login/logo.png" alt="Logo"/>
        </h3>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png"/></i>
							</span><input class="single" single-name="username" single-msg="该用户名已注册" single="true"
                            type="text" name="loginnameR"
                            id="loginnameR" value=""
                            placeholder="请输入用户名，最少4位"/>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png"/></i>
							</span><input type="password" name="passwordR" id="passwordR"
                            placeholder="请输入密码，需满足6-20位数字字母组合" value=""/>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_ly">
							<i><img height="37" src="static/login/suo.png"/></i>
							</span><input type="password" id="passwordRS" placeholder="请输入确认密码" value=""/>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_lg">
                <i><img height="37" src="static/login/user.png"/></i>
							</span>
            <input class="single" single-name="phone" single-msg="该手机号已注册" single="true"
                   type="text" name="phone" id="phone" value=""
                   placeholder="请输入手机号"/>
          </div>
        </div>
      </div>
      <div class="control-group">
        <div class="controls">
          <div class="main_input_box">
							<span class="add-on bg_lg">
							<i><img height="37" src="static/login/user.png"/></i>
							</span>
            <input class="single" single-name="email" single-msg="该邮箱已经注册" single="true"
                   type="text" name="email" id="email" value=""
                   placeholder="请输入邮箱"/>
          </div>
        </div>
      </div>
      <div class="form-actions">
        <div style="width:86%;padding-left:8%;">

						<span class="pull-right" style="padding-right:3%;">
							<a onclick="goBack();" class="btn btn-success">返回</a>
						</span>
						<span class="pull-right">
							<a onclick="register();" class="flip-link btn btn-info" id="to-recoverR">注册</a>
            </span>
        </div>
      </div>

    </form>


    <div class="controls">
      <div class="main_input_box">
        <font color="white">
						<span id="nameerr">
							Copyright © Greathammer 2016
						</span>
        </font>
      </div>
    </div>
  </div>
</div>
<div id="templatemo_banner_slide" class="container_wapper">
  <div class="camera_wrap camera_emboss" id="camera_slide">
    <div data-src="static/login/images/banner_slide_01.jpg"></div>
    <div data-src="static/login/images/banner_slide_02.jpg"></div>
    <div data-src="static/login/images/banner_slide_03.jpg"></div>
  </div>
  <!-- #camera_wrap_3 -->
</div>

<script type="text/javascript">

  //服务器校验
  function severCheck() {
    if (check()) {

      var loginname = $("#loginname").val();
      var password = $("#password").val();
      var code = "qq313596790fh" + loginname + ",fh," + password + "QQ978336446fh" + ",fh," + $("#code").val();
      $.ajax({
        type: "POST",
        url: 'login_login',
        data: {KEYDATA: code, tm: new Date().getTime()},
        dataType: 'json',
        cache: false,
        success: function (data) {
          if ("success" == data.result) {
            saveCookie();
            window.location.href = "main/index";
          } else if ("usererror" == data.result) {
            $("#loginname").tips({
              side: 1,
              msg: "用户名或密码有误",
              bg: '#FF5080',
              time: 15
            });
            $("#loginname").focus();
          } else if ("codeerror" == data.result) {
            $("#code").tips({
              side: 1,
              msg: "验证码输入有误",
              bg: '#FF5080',
              time: 15
            });
            $("#code").focus();
          } else {
            $("#loginname").tips({
              side: 1,
              msg: "缺少参数",
              bg: '#FF5080',
              time: 15
            });
            $("#loginname").focus();
          }
        }
      });
    }
  }

  $(document).ready(function () {
    changeCode();
    $("#codeImg").bind("click", changeCode);
  });

  $(document).keyup(function (event) {
    if (event.keyCode == 13) {
      $("#to-recover").trigger("click");
    }
  });

  function genTimestamp() {
    var time = new Date();
    return time.getTime();
  }

  function changeCode() {
    $("#codeImg").attr("src", "code.do?t=" + genTimestamp());
  }

  //客户端校验
  function check() {

    if ($("#loginname").val() == "") {

      $("#loginname").tips({
        side: 2,
        msg: '用户名不得为空',
        bg: '#AE81FF',
        time: 3
      });

      $("#loginname").focus();
      return false;
    } else {
      $("#loginname").val(jQuery.trim($('#loginname').val()));
    }

    if ($("#password").val() == "") {

      $("#password").tips({
        side: 2,
        msg: '密码不得为空',
        bg: '#AE81FF',
        time: 3
      });

      $("#password").focus();
      return false;
    }
    /*if ($("#code").val() == "") {

     $("#code").tips({
     side : 1,
     msg : '验证码不得为空',
     bg : '#AE81FF',
     time : 3
     });

     $("#code").focus();
     return false;
     }
     */
    $("#loginbox").tips({
      side: 1,
      msg: '正在登录 , 请稍后 ...',
      bg: '#68B500',
      time: 10
    });

    return true;
  }

  function savePaw() {
    if (!$("#saveid").attr("checked")) {
      $.cookie('loginname', '', {
        expires: -1
      });
      $.cookie('password', '', {
        expires: -1
      });
      $("#loginname").val('');
      $("#password").val('');
    }
  }

  function saveCookie() {
    if ($("#saveid").attr("checked")) {
      $.cookie('loginname', $("#loginname").val(), {
        expires: 7
      });
      $.cookie('password', $("#password").val(), {
        expires: 7
      });
    }
  }
  function quxiao() {
    $("#loginname").val('');
    $("#password").val('');
  }

  /**
   * 跳转到注册页面
   */
  function toRegister() {
    $('#loginForm').fadeOut('slow', function () {
      $('#registerForm').fadeIn('slow');
    });
  }

  /**
   * 返回登录
   */
  function goBack() {
    $('#registerForm').fadeOut('slow', function () {
      $('#loginForm').fadeIn('slow');
    });
  }
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
      var password = $passwordR.val();
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
  }
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
      $("#loginbox").tips({
        side: 1,
        msg: '正在登录 , 请稍后 ...',
        bg: '#68B500',
        time: 10
      });

      var data = {
        USERNAME: $("#loginnameR").val(),
        PASSWORD: $("#passwordR").val(),
        EMAIL: $('#email').val(),
        PHONE: $('#phone').val()
      }
      $.ajax({
        type: "POST",
        url: "register",
        data: data,
        success: function (d) {
          if (d.code == 1) {
            location.reload();
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

  /**
   * 检查用户名，手机号，邮箱唯一
   */
  function singleCheck() {
    $('.single').blur(function (e) {
      var self = $(this);
      var _val = self.val();
      var _name = self.attr('single-name');
      var rs = true;
      switch (_name) {
        case'username':
          rs = checkfn.username(self);
          break;
        case 'phone':
          rs = checkfn.phone(self);
          break;
        case 'email':
          rs = checkfn.email(self);
          break;
      }
      if (rs) {
        $.ajax({
          type: 'POST',
          url: 'singleCheck',
          data: {value: _val, name: _name},
          success: function (data) {
            if (data.code == 0) {
              var msg = self.attr('single-msg');
              self.attr('single', false);
              self.tips({
                side: 1,
                msg: msg,
                bg: '#68B500',
                time: 10
              });
            } else {
              self.attr('single', true);
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
    }).change(function () {
      var self = $(this);
      self.attr('single', 'true');
    });
  }
  jQuery(function () {
    var loginname = $.cookie('loginname');
    var password = $.cookie('password');
    if (typeof(loginname) != "undefined"
        && typeof(password) != "undefined") {
      $("#loginname").val(loginname);
      $("#password").val(password);
      $("#saveid").attr("checked", true);
      $("#code").focus();
    }
    singleCheck();
  });
</script>
<script>
  //TOCMAT重启之后 点击左侧列表跳转登录首页
  if (window != top) {
    top.location.href = location.href;
  }
</script>

<script src="static/js/bootstrap.min.js"></script>
<script src="static/js/jquery-1.7.2.js"></script>
<script src="static/login/js/jquery.easing.1.3.js"></script>
<script src="static/login/js/jquery.mobile.customized.min.js"></script>
<script src="static/login/js/camera.min.js"></script>
<script src="static/login/js/templatemo_script.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
</body>

</html>