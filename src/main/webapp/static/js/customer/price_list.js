/**
 * Created by david on 2016/9/22.
 */
// ============================================================================================ 列表

var priceDataTable = new DefaultDataTable('/customer/ajaxListPrice.do', [//列定义
    {
        sTitle: '产品名称',
        mData: 'name'
    },
    {
        sTitle: '人民币价格',
        mData: 'rmbPrice'
    },
    {
        sTitle: '美元价格',
        mData: 'dollarPrice'
    },
    {
        sTitle: '价格单位',
        mData: 'priceUnit'
    },
    {
        sTitle: '开始有效期',
        mData: 'effectiveStartDate'
    },
    {
        sTitle: '结束有效期',
        mData: 'effectiveEndDate'
    },
    {
        sTitle: '状态',
        mData: 'status',
        render: function (status, type, row) {
            return status === 1 ? '有效' : '无效';
        }
    },
    {
        sTitle: '操作',
        render: function (data, type, row) {
            return ' <a class="btn btn-mini btn-info" title="保存" onclick="addOrEditPrice(\'' + row.productionId + row.id + '\');">保存' +
                '<i class="icon-edit"></i>' +
                '</a>' +
                '<a class="btn btn-mini btn-info" title="修改" onclick="addOrEditPrice(\'' + row.productionId + row.id + '\');">修改' +
                '<i class="icon-edit"></i>' +
                '</a>';
        }
    }

], '#my-table', $('#priceForm'));


// =================================================================================== 操作按钮处理函数
$(top.hangge());

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

/**
 * 表单验证
 * 保存和修改数据
 *
 * @param productionId
 * @param id
 */
function addOrEditPrice(productionId, id) {
    var rmbPrice = $("#rmbjg_id_" + productionId);
    if (isNull(rmbPrice, '人民币价格不能为空'))return;

    var dollarPrice = $("#mjjg_id_" + productionId);
    if (isNull(dollarPrice, '美元价格不能为空'))return;

    var priceUnit = $("#jgdw_id_" + productionId);
    if (isNull(priceUnit, '价格单位不能为空'))return;

    var effectiveStartDateIpt = $("#ksyxq_id_" + productionId);
    if (isNull(effectiveStartDateIpt, '开始有效期不能为空'))return;

    var effectiveEndDate = $("#jsyxq_id_" + productionId);
    if (isNull(effectiveEndDate, '结束有效期不能为空'))return;

    var price = {
        bizUserId: __bizUserId,
        productionId: productionId,
        rmbPrice: rmbPrice.val(),
        dollarPrice: dollarPrice.val(),
        priceUnit: priceUnit.val(),
        effectiveStartDate: effectiveStartDateIpt.val(),
        effectiveEndDate: effectiveEndDate.val(),
        operatorId: __operatorId,
        status: 3
    };

    if (id == undefined) {//添加
        PriceService.insert(price)
    } else { //更新
        price.id = id;
        var count = PriceService.update(price);
    }
    window.location.reload();
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

