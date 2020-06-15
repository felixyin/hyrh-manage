/**
 * Created by fy on 2016/9/19.
 */


/**
 * datatable ajax 表单加分页 插件 的 构造函数
 *
 * @param url
 * @param columns
 * @param tableId
 * @param searchFormId
 * @param options
 * options: 合并单元格：rowsGroup:[]
 * 固定列scrollX:true, scrollCollapse: true,
 *  fixedColumns: {从左边2个列固定:leftColumns: 2,
 *  从右边1个列固定 rightColumns: 1}
 *
 *
 * @constructor
 */
function DefaultDataTable(url, columns, tableId, searchFormId, options) {
    this.tableId = tableId;
    $(tableId).addClass("table table-striped table-bordered table-hover");
    this.url = url;
    this.columns = columns;
    this.searchFormId = searchFormId;
    this.options = options;
    this._table = this._dataTable(this.tableId, this.url, this.columns, this.options);
    var self = this;
    if (searchFormId) {// 最简单的方式
        var form = $(searchFormId);
        form.children("table").addClass("my-seartch-table");//自动应用查询表单的样式
        var formEle = form.get(0);
        var oldSubmit = formEle.onsubmit;
        form.submit(function (evt) {
            evt.preventDefault();
            evt.stopPropagation();
            self.search(searchFormId);
            if (typeof oldSubmit == 'function') {
                oldSubmit();
            }
            return false;
        });
    }
}

/**
 * 获取jquery的datatable对象后，可以自定义一些东东了，请参照datatable文档
 * @returns {*}
 */
DefaultDataTable.prototype.getDataTable = function () {
    return this._table;
};

/**
 * 应用指定的查询表单数据到此datatable上
 * @param _formId
 */
DefaultDataTable.prototype.search = function (_formId) {
    var serialize = $(_formId || this.searchFormId).serialize();
    $(this.tableId).dataTable().fnReloadAjax(this.url + '?' + serialize);//重新加载
};

/**
 * 私有方法，不要调用
 * @param tableId
 * @param url
 * @param columns
 * @private
 */
DefaultDataTable.prototype._dataTable = function (tableId, url, columns, options) {
    var table = $(tableId);

    var settings = {
        "sPaginationType": "full_numbers",//分页类型--simple(只有上一页，下一页),simple_numbers（上一页，下一页和数字显示）,full（首页，尾页，上一页和下一页）,full_numbers（首页，尾页，上一页，下一页和数字显示）
        "bServerSide": true,//是否从服务器获取数据
        "processing": true,//是否显示获取数据时的进度信息，譬如获取数据中...
        "bStateSave": false,//是否保存插件信息
        "bLengthChange": false,//是否可以改变每页显示数量
        "iDisplayLength": 10,//初始化显示数量--每页显示数据数目
        "bDeferRender": true,//延期渲染
        "aLengthMenu": [5, 10, 15, 30, 50, 100],
        "sAjaxDataProp": "dataList",//默认为"aaData",o后台返回数据字段
        "bAutoWidth": true,//是否宽度自适应
        "bFilter": false,//是否启动搜索过滤
        "bSort": false,//是否启动各个字段排序
        "sAjaxSource": url,//服务器URL
        "aoColumns": columns,
        "language": {//页面显示自定义信息
            "sLengthMenu": "每页显示 _MENU_ 条数据",
            "sZeroRecords": "没有数据",
            "sInfo": "显示 _START_ 到 _END_ 条数据，总共 _TOTAL_ 条数据",
            "sInfoEmpty": "没有数据",
            "sInfoFiltered": "(从 _MAX_ 条数据中检索)",
            "oPaginate": {
                "sFirst": "首页",
                "sPrevious": "前一页",
                "sNext": "后一页",
                "sLast": "尾页"
            },
            "sSearch": "搜索",
            "sProcessing": "数据加载中..."
        },
        "searching": false,//是否显示右上角的搜索框
        "ordering": false//是否可以排序
    };
    $.extend(settings, options);
    table.dataTable(settings);

//    table.find('tbody').on('click', 'tr', function () {//点击一行时显示蓝色
//        if ($(this).hasClass('selected')) {
//            $(this).removeClass('selected');
//        }
//        else {
//            table.dataTable().$('tr.selected').removeClass('selected');
//            $(this).addClass('selected');
//        }
//    });

};

