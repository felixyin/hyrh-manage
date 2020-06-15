<!-- --------------script begin-------------- -->

<!-- basic scripts -->
<script src="/static/1.9.1/jquery.min.js"></script>
<script type="text/javascript">
  window.jQuery || document.write("<script src='/static/js/jquery-1.9.1.min.js'>\x3C/script>");
</script>

<script src="/static/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->

<!--[if lt IE 9]>
<script type="text/javascript" src="/static/js/excanvas.min.js"></script>
<![endif]-->
<script type="text/javascript" src="/static/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.ui.touch-punch.min.js"></script>
<script type="text/javascript" src="/static/js/chosen.jquery.min.js"></script>
<script type="text/javascript" src="/static/js/fuelux.spinner.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-timepicker.min.js"></script>
<script type="text/javascript" src="/static/js/date.js"></script>
<script type="text/javascript" src="/static/js/daterangepicker.min.js"></script>
<script type="text/javascript" src="/static/js/bootstrap-colorpicker.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.knob.min.js"></script>
<script type="text/javascript" src="/static/js/jquery.autosize-min.js"></script>
<script type="text/javascript" src="/static/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script type="text/javascript" src="/static/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="/static/js/validate/additional-methods.min.js"></script>
<script type="text/javascript" src="/static/js/validate/localization/messages_zh.js"></script>
<script type="text/javascript" charset="UTF-8">
  /**
   *验证手机号
   */
  $.validator.addMethod("phone", function (phone_number, element) {
    phone_number = phone_number.replace(/\s+/g, "");
    return this.optional(element) || phone_number.length > 10 &&
        phone_number.match(/^1[3|4|5|7|8]\d{9}$/);
  }, $.validator.messages.phone);

  /**
   * 验证邮箱
   */
  $.validator.addMethod("zipCode", function (zip_code, element) {
    zip_code = zip_code.replace(/\s+/g, "");
    return this.optional(element) ||
        zip_code.match(/^[a-zA-Z0-9 ]{3,12}$/);
  }, $.validator.messages.zipCode);

  /**
   * 验证传真
   */
  $.validator.addMethod("companyFex", function (company_fex, element) {
    company_fex = company_fex.replace(/\s+/g, "");
    return this.optional(element) ||
        company_fex.match(/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/);
  }, $.validator.messages.companyFex);

  /**
   * 验证密码
   */
  $.validator.addMethod("passwordRule", function (password_1, element) {
    password_1 = password_1.replace(/\s+/g, "");
    return this.optional(element) ||
        password_1.match(/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,20}$/);
  }, $.validator.messages.password);

  /**
   * 通用唯一性验证
   */
  function countValidator(tableName, columnName, msg) {
    $.validator.addMethod(columnName + "_unique", function (value, element) {
      value = value.replace(/\s+/g, "");
      var isExits = false;
      var oldValue = $(element).data('value');
      if (oldValue == value)return true;

      var options = {
        method: 'POST',
        url: ['/common/', columnName, 'Count.do'].join(''),
        async: false,
        dataType: 'json',
        success: function (data, textStatus, jqXHR) {
          isExits = data.count;
        }
      };

      options.data = {};
      options.data['tableName'] = tableName;
      options.data['columnName'] = columnName;
      options.data['columnValue'] = value;

      $.ajax(options);

      return this.optional(element) || !isExits;
    }, msg || $.validator.messages[columnName + 'Unique'] || '');
    return true;
  }
</script>
<script type="text/javascript" src="/static/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

<!-- jQuery table -->
<script type="text/javascript" src="/plugins/DataTables-1.10.12/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/plugins/DataTables-1.10.12/extensions/fnReloadAjax.js"></script>
<script type="text/javascript" src="/static/js/my-datetable.js"></script>

<!-- ####################### 下面自己引入的扩展脚本 ####################### -->

<%-- 前端模板类库 --%>
<script type="text/javascript" src="/static/js/handlebars-v4.0.5.js"></script>

<%-- ####################### 下面是自定义公共函数公共函数 ####################### --%>
<%-- 前端模板类库 --%>
<script type="text/javascript" src="/static/js/handlebars-v4.0.5.js"></script>
<%-- 引入弹窗组件start --%>
<script type="text/javascript" src="/plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="/plugins/attention/zDialog/zDialog.js"></script>
<%--确认窗口--%>
<script type="text/javascript" src="/static/js/bootbox.min.js"></script>
<%-- 提示组件 --%>
<script type="text/javascript" src="/static/js/jquery.tips.js"></script>
<%-- 下拉框 --%>
<script type="text/javascript" src="/static/js/myjs/head.js"></script>
<%-- 用户及定价管理完善用户中心 --%>
<script type="text/javascript" src="/static/js/my-tab.js"></script>

<script type="text/javascript">
  (function ($) {
    var compiled = {};

    /**
     * 模板+数据 = html
     * @param template view
     * @param data model
     * @param func 默认值是html方法
     */
    $.fn.handlebars = function (template, data, func) {
      if (template instanceof jQuery) {
        template = $(template).html();
      }
      compiled[template] = Handlebars.compile(template);
      this[func || 'html'](compiled[template](data));
    };

    /**
     * ajax提交表单
     * @param func
     */
    $.fn.ajaxSubmit = function (func) {
      var form = $(this);
      form.submit(function (evt) {
        evt.stopPropagation();
        evt.preventDefault();
        if (!form.valid())return false;
        var array = form.serializeArray();
        var map = {};
        $.each(array, function (i, n) {
          map[n.name] = n.value;
        });
        func(map);
        return false;
      });
      return $(this);
    };
  })(jQuery);


  /**
   * 打开对话框
   * @param id 'data_show_id'
   * @param title '显示数据'
   * @param url '/base/showData.do?id=' + ?
   * @param size {width:1000,height:600}
   * @returns {baidu.ui.editor.Dialog}
   */
  function openDialog(id, title, url, size) {
    var diag = new top.Dialog();
    diag.MyParentWin = window;
    diag.ID = id;
    diag.Drag = true;
    diag.Title = title;
    diag.URL = url;
    diag.Width = 1000;
    diag.Height = 600;
    if (size) {
      if (size.width)diag.Width = size.width;
      if (size.height)diag.Height = size.height;
    }
    diag.CancelEvent = function () { //关闭事件
      diag.close();
    };
    diag.show();
    return diag;
  }

  function ajaxSubmit(formId, func) {
    var form = $(formId);
    if (!form.valid())return false;
    var array = form.serializeArray();
    var map = {};
    $.each(array, function (i, n) {
      map[n.name] = n.value;
    });
    func(map);
  }

</script>


<script type="text/javascript" src="/static/genjs/service.js"></script>

<!-- --------------script end-------------- -->

