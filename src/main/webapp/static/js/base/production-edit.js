/**
 * Created by fy on 2016/8/29.
 */

// ============================================================================================ 富文本处理逻辑
top.hangge();

$(function () {
    //单选框
    $(".chzn-select").chosen();
    $(".chzn-select-deselect").chosen({allow_single_deselect: true});

    //日期框
    $('.date-picker').datepicker();

    // 初始化富文本编辑器
    setTimeout(function () {
        window.ue = UE.getEditor('content');
        ue.ready(function () {
            ue.setContent(__content);
        });
    }, 500);
});


// ============================================================================================ 分类树处理逻辑

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
    // TODO
    if (!check) alert("请选择分类");
    return check;
}
function onClick(e, treeId, treeNode) {
    var node = window.zTree.getSelectedNodes()[0];
    $("#categoryNameIpt").val(node.name);
    $('#category_id').val(node.id);
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

    var category_id = __categoryId;

    if (!category_id)return;
    function diGuiSeleted(nodes) {
        $.each(nodes, function (i, n) {
            if (n.id == category_id) {
                zTree.selectNode(n);
                $('#category_id').val(n.id);
                $('#categoryNameIpt').val(n.name);
                return;
            }
            var child = n.children;
            if (child && child.length) {
                diGuiSeleted(child);
            }
        });
    }

    diGuiSeleted(zTree.getNodes());
});


// ============================================================================================ 附件处理逻辑

/**
 * 给新增附件按钮添加处理逻辑
 */
function addAttaHandler() {
    window.__file_index = 1000000;
    $('#my-add-atta').click(function () {
        $('#my-add-atta-target').handlebars($('#tpl-upload-file'), {index: ++window.__file_index}, 'before');
        $('#my-file-' + window.__file_index).ace_file_input({
            no_file: '选择文件',
            btn_choose: '添加',
            btn_change: '修改',
            droppable: false,
            onchange: null,
            thumbnail: false,//| true | large
//                    whitelist: 'pdf|docx|doc|xls|xlsx|txt',
//                    blacklist: 'exe|php'
            //onchange:''
            //
        });
        return false;
    });
}

function delAttaHandler() {
    $(document).on('click', '.my-file-del', {}, function () {
        var index = $(this).data('index');

        var attachmentId = $(this).data('attachment-id');
        var attachmentFileName = $(this).data('attachment-filename');

        if (attachmentId) {
            bootbox.confirm("确定要删除[" + attachmentFileName + "]附件吗?", function (result) {
                if (result) {
                    top.jzts();
                    var url = '/base/deleteAttachment.do?attachmentId=' + attachmentId;
                    $.get(url, function (data) {
                        alert('删除成功');
                        $('#my-file-tr-' + index).remove();
                        top.hangge();
                    });
                }
            });
        } else {
            $('#my-file-tr-' + index).remove();
        }
        return false;
    });
}

$(function () {
    addAttaHandler();
    delAttaHandler();
});

// ============================================================================================ 表单相关处理逻辑
/**
 * 提交前的处理
 */
function preSubmit_CANDEL() {

//        校验必须选择一个分类
    function checkCategoryRequired() {
        var nodes = window.zTree.getSelectedNodes();
        if (nodes.length !== 1) {
            alert('必须选择一个分类');
            throw Error('必须选择一个分类');
        }
        var categoryId = nodes[0].id;
        $('#category_id').val(categoryId);
    }

//        设置富文本编辑的文章
    function setProductionContent() {
        var content = window.ue.getContent();
        $('#content').text(content);
    }

    /**
     *  截取路径中的文件名
     * @param o
     * @returns {string}
     */
    function getFileName(o) {
        var pos = o.lastIndexOf("\\");
        return o.substring(pos + 1, o.lastIndexOf("."));
    }

//        下面是处理产品附件的代码
    function setProductionAttachment() {
        var fileMap = $('.my-files').map(function () {
            var inputs = $(this).find('input');
            var oldFileName = $(this).find('a').text();
            var attachmentId = $(inputs[0]).val();
            var newFileName = getFileName($(inputs[1]).val());
            var type = 0;

            if (!attachmentId) {// 判断是新增的情况
                type = 1;
            } else if (!!newFileName && attachmentId) {// 判断是修改的情况
                type = 2;
            }

            return {attachmentId: attachmentId, newFileName: newFileName, oldFileName: oldFileName, type: type};
        }).get();

        console.log(fileMap);
        $('#attachment_map').val(JSON.stringify(fileMap));
    }

    checkCategoryRequired();
    setProductionContent();
    setProductionAttachment();

    return true;
}


// ============================================================================================  表单验证
var validator = $("#productionForm").submit(function () {
    UE.getEditor('content').sync();
}).validate({
    ignore: "",
    errorElement: 'span',
    errorClass: 'help-inline',
    focusInvalid: true,
    rules: {
        categoryName: {
            required: true
        },
        number: {
            required: true,
            minlength: 5,
            maxlength: 45
        },
        name: {
            required: true,
            maxlength: 100
        },
        content: {
            required: true,
            minlength: 5,
            maxlength: 6500
        },
        price: {
            required: true,
            number: true
        },
        pack: {
            required: true
        },
        unit: {
            required: true
        },
        minQuantity: {
            required: true,
            digits: true
        }
    },
    messages: {
        categoryName: {
            required: '必须选择产品分类'
        },
        number: {
            required: '产品编号必填',
            minlength: '产品编号长度不能小于5',
            maxlength: '产品编号长度不能大于45'
        },
        name: {
            required: '产品名称必填',
            maxlength: '产品名称长度不能大于100'
        },
        content: {
            required: '产品说明必填',
            minlength: '产品说明长度不能小于500',
            maxlength: '产品说明长度不能大于6500'
        },
        price: {
            required: '产品单价必填',
            number: '产品单价必须是数字'
        },
        pack: {
            required: '打包方式必填'
        },
        unit: {
            required: '计量单位必填'
        },
        minQuantity: {
            required: '最小起订量必填',
            digits: '最小起订量必须是整数'
        }
    },
    highlight: function (e) {
        $(e).closest('.control-group').removeClass('info').addClass('error');
    },
    success: function (e) {
        $(e).closest('.control-group').removeClass('error').addClass('info');
        $(e).remove();
    },
    errorPlacement: function (error, element) {
        if (element.is(':checkbox') || element.is(':radio')) {
            var controls = element.closest('.controls');
            if (controls.find(':checkbox,:radio').length > 1) controls.append(error);
            else error.insertAfter(element.nextAll('.lbl').eq(0));
        }
        else if (element.is('.chzn-select')) {
            error.insertAfter(element.nextAll('[class*="chzn-container"]').eq(0));
        }
        else error.insertAfter(element);
    },
    submitHandler: function (form) {

        /**
         *  截取路径中的文件名
         * @param o
         * @returns {string}
         */
        function getFileName(o) {
            var pos = o.lastIndexOf("\\");
            return o.substring(pos + 1, o.lastIndexOf("."));
        }

//        下面是处理产品附件的代码
        function setProductionAttachment() {
            var fileMap = $('.my-files').map(function () {
                var inputs = $(this).find('input');
                var oldFileName = $(this).find('a').text();
                var attachmentId = $(inputs[0]).val();
                var newFileName = getFileName($(inputs[1]).val());
                var type = 0;

                if (!attachmentId) {// 判断是新增的情况
                    type = 1;
                } else if (!!newFileName && attachmentId) {// 判断是修改的情况
                    type = 2;
                }

                return {attachmentId: attachmentId, newFileName: newFileName, oldFileName: oldFileName, type: type};
            }).get();

            $('#attachment_map').val(JSON.stringify(fileMap));
        }

        setProductionAttachment();

        form.submit();
    },
    invalidHandler: function (event, validator) { //display error alert on form submit
        // alert('请检查表单，输入合法的值。');
    }
});

// 针对ueditor 控件配置的验证
validator.focusInvalid = function () {
    if (this.settings.focusInvalid) {
        try {
            var toFocus = $(this.findLastActive() || this.errorList.length && this.errorList[0].element || []);
            if (toFocus.is("textarea")) {
                UE.getEditor('content').focus();
            } else {
                toFocus.filter(":visible").focus();
            }
        } catch (e) {
        }
    }
};

