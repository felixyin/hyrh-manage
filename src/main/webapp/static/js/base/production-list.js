/**
 * Created by fy on 2016/8/30.
 */

// =================================================================================== ajax分页
var productionDataTable = new DefaultDataTable('/base/ajaxListProductions.do', [//列定义
    {
        sTitle: '所属分类',
        mData: 'categoryName'
    },
    {
        sTitle: '产品编号',
        mData: 'number',
        sWidth: "12%"
    },
    {
        sTitle: '产品名称',
        mData: 'name',
        sWidth: "12%"
    },
    {
        sTitle: '注释',
        mData: 'comment'
    },
    {
        sTitle: '单价',
        mData: 'price'
    },
    {
        sTitle: '打包方式',
        mData: 'pack'
    },
    {
        sTitle: '单位',
        mData: 'unit'
    },
    {
        sTitle: '最小起订量',
        mData: 'minQuantity'
    },
    {
        sTitle: '创建日期',
        mData: 'cdate'
    },
    {
        sTitle: '修改日期',
        mData: 'udate'
    },
    {
        sTitle: '状态',
        mData: 'status',
        render: function (status, type, row) {
            return status === 1 ? '有效':'无效';
        }
    },
    {
        sTitle: '操作',
        render: function (data, type, row) {
            return ' <a class="btn btn-mini btn-info" title="编辑" onclick="editProduction(\'' + row.id + '\');">修改' +
                '<i class="icon-edit"></i>' +
                '</a>';
        }
    }
], '#my-table', $('#productionForm'));


// =================================================================================== 操作按钮处理函数
$(top.hangge());

//新增
function add() {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "新增";
    diag.URL = '/base/goAddProduction.do';
    diag.Width = 1000;
    diag.Height = 600;
    diag.CancelEvent = function () { //关闭事件
        diag.close();
    };
    diag.show();
}


//修改
function editProduction(productionId) {
    openDialog('edit_poduction_id', '修改产品', '/base/goEditProduction.do?productionId=' + productionId, {width: 1000, height: 600});
}


// 查看
function viewProduction(production_id) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "查看产品详情";
    diag.URL = '/base/viewProduction.do?production_id=' + production_id;
    diag.Width = 1000;
    diag.Height = 600;
    diag.CancelEvent = function () { //关闭事件

        diag.close();
    };
    diag.show();
}

// ===================================================================================  页面初始化处理
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

// ===================================================================================  分类树的显示

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


function beforeClick(treeId, treeNode) {
    var check = (treeNode && !treeNode.isParent);
    if (!check) alert('只能选择子分类');
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

    window.zTree = $.fn.zTree.init($("#treeDemo"), setting, __zNodes);
    //
    // var category_id = __categoryId;
    //
    // if (!category_id)return;
    // function diGuiSeleted(nodes) {
    //     $.each(nodes, function (i, n) {
    //         if (n.id == category_id) {
    //             zTree.selectNode(n);
    //             $('#categoryIptId').val(n.id);
    //             $('#categoryNameIpt').val(n.name);
    //             return;
    //         }
    //         var child = n.children;
    //         if (child && child.length) {
    //             diGuiSeleted(child);
    //         }
    //     });
    // }
    //
    // diGuiSeleted(zTree.getNodes());
});


// ===================================================================================  废弃函数

//导出excel
function toExcel() {
    var USERNAME = $("#nav-search-input").val();
    var lastLoginStart = $("#lastLoginStart").val();
    var lastLoginEnd = $("#lastLoginEnd").val();
    var ROLE_ID = $("#role_id").val();
    window.location.href = '/user/excel.do?USERNAME=' + USERNAME + '&lastLoginStart=' + lastLoginStart + '&lastLoginEnd=' + lastLoginEnd + '&ROLE_ID=' + ROLE_ID;
}

//打开上传excel页面
function fromExcel() {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "EXCEL 导入到数据库";
    diag.URL = '/user/goUploadExcel.do';
    diag.Width = 300;
    diag.Height = 150;
    diag.CancelEvent = function () { //关闭事件
        if (diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none') {
            if (__currentPage == '0') {
                top.jzts();
                setTimeout("self.location.reload()", 100);
            } else {
                nextPage(__currentPage);
            }
        }
        diag.close();
    };
    diag.show();
}


//去发送电子邮件页面
function sendEmail(EMAIL) {
    top.jzts();
    var diag = new top.Dialog();
    diag.Drag = true;
    diag.Title = "发送电子邮件";
    diag.URL = '/head/goSendEmail.do?EMAIL=' + EMAIL;
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
    diag.URL = '/head/goSendSms.do?PHONE=' + phone + '&msg=appuser';
    diag.Width = 600;
    diag.Height = 265;
    diag.CancelEvent = function () { //关闭事件
        diag.close();
    };
    diag.show();
}

//删除
function delUser(userId, msg) {
    bootbox.confirm("确定要删除[" + msg + "]吗?", function (result) {
        if (result) {
            top.jzts();
            var url = "/user/deleteU.do?USER_ID=" + userId + "&tm=" + new Date().getTime();
            $.get(url, function (data) {
                nextPage(__currentPage);
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
                        url: '/user/deleteAllU.do?tm=' + new Date().getTime(),
                        data: {USER_IDS: str},
                        dataType: 'json',
                        //beforeSend: validateData,
                        cache: false,
                        success: function (data) {
                            $.each(data.list, function (i, list) {
                                nextPage(__currentPage);
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

