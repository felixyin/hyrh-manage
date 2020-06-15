
<!-- --------------head begin-------------- -->

<!-- basic styles -->
<link href="/static/css/bootstrap.min.css" rel="stylesheet"/>
<link href="/static/css/bootstrap-responsive.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="/static/css/font-awesome.min.css"/>
<!--[if IE 7]>
<link rel="stylesheet" href="/static/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->

<link rel="stylesheet" href="/static/css/jquery-ui-1.10.2.custom.min.css"/>
<link rel="stylesheet" href="/static/css/chosen.css"/>
<link rel="stylesheet" href="/static/css/datepicker.css"/>
<link rel="stylesheet" href="/static/css/bootstrap-timepicker.css"/>
<link rel="stylesheet" href="/static/css/daterangepicker.css"/>
<link rel="stylesheet" href="/static/css/colorpicker.css"/>
<!-- ace styles -->
<link rel="stylesheet" href="/static/css/ace.min.css"/>
<link rel="stylesheet" href="/static/css/ace-responsive.min.css"/>
<link rel="stylesheet" href="/static/css/ace-skins.min.css"/>
<!--[if lt IE 9]>
<link rel="stylesheet" href="/static/css/ace-ie.min.css" />
<![endif]-->

<!-- basic scripts -->
<script type="text/javascript" src="/static/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
    window.jQuery || document.write("<script src='/static/js/jquery-1.9.1.min.js'>\x3C/script>");
</script>

<script src="/static/js/bootstrap.min.js"></script>
<!-- page specific plugin scripts -->

<!--[if lt IE 9]>
<script type="text/javascript" src="/static/js/excanvas.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/css/jquery-ui-1.10.2.custom.min.css"/>
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
<script type="text/javascript" src="/static/js/jquery.maskedinput.min.js"></script>

<!-- ace scripts -->
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>
<!-- inline scripts related to this page -->


<!-- 下面自己引入的扩展脚本 -->

<%-- 前端模板类库 --%>
<script type="text/javascript" src="/static/js/handlebars-v4.0.5.js"></script>
<%-- 引入弹窗组件start --%>
<script type="text/javascript" src="/plugins/attention/zDialog/zDrag.js"></script>
<script type="text/javascript" src="/plugins/attention/zDialog/zDialog.js"></script>
<%-- 提示组件 --%>
<script type="text/javascript" src="/static/js/jquery.tips.js"></script>
<%-- 下拉框 --%>
<script type="text/javascript" src="/static/js/myjs/head.js"></script>

<%-- 下面是自定义公共函数公共函数 --%>
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
    })(jQuery);
</script>

<!-- --------------head end-------------- -->
