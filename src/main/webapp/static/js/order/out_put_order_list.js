/**
 * Created by david on 2016/9/26.
 */

// ============================================================================================  ajax列表
var outPutOrderDataTable = new DefaultDataTable('/order/ajaxListOutPutOrder.do', [
    {
        mData: 'orderCode'
    },
    {
        mData: 'lineNumber'
    },
    {
        mData: 'typeContract'
    },
    {
        mData: 'bookMonth'
    },
    {
        mData: 'materialCode'
    },
    {
        mData: 'materialDesc'
    },
    {
        mData: 'addressId'
    },
    {
        mData: 'comment'
    },
    {
        mData: 'provider'
    },
    {
        mData: 'original'
    },
    {
        mData: 'customer'
    },
    {
        mData: 'priceUnit'
    },
    {
        mData: 'unit'
    },
    {
        mData: 'countUnit'
    },
    {
        mData: 'placeCount'
    },
    {
        mData: 'sellCount'
    },
    {
        mData: 'paymentMoney'
    },
    {
        mData: 'placeDate'
    },
    {
        mData: 'requireDate'
    },
    {
        mData: 'realityDate'
    },
    {
        mData: 'freightOrderCode'
    },
    {
        mData: 'freightMoney'
    },
    {
        mData: 'freightMoneyNo'
    },
    {
        mData: 'storageMoney'
    },
    {
        mData: 'contentNumber'
    },
    {
        mData: 'isPayment'
    },
    {
        mData: 'isOrderEnd'

    },
    {
        mData: 'isInvoice'
    },
    {
        mData: 'invoiceCode'
    },
    {
        mData: 'amount'
    },
    {
        mData: 'note'
    },
    {
        mData: 'status',
        render: function (status, type, row) {
            return status === 1 ? '有效' : '无效';
        }
    },
    {
        render: function (data, type, row) {
            return '<a class="btn btn-mini btn-info" onclick="editOutPutOrder(\'' + row.id + '\');">修改' +
                '<i class="icon-edit"></i>' +
                '</a>' +
                '<a class="btn btn-mini btn-info" style="margin-left: 5px" title="取消订单" onclick="deleteOutPutOrder(\'' + row.id + '\');">取消订单' +
                '<i class="icon-adjust"></i>' +
                '</a>' + '<a class="btn btn-mini btn-info" style="margin-left: 5px" title="查看发票" onclick="selectThisInvoice(\'' + row.invoiceCode + '\');">查看发票' +
                '<i class="icon-adjust"></i>' +
                '</a>';
        }
    }
], '#out_put_order_table_id', $('#outPutOrderForm'), {
    scrollX: true,
    fixedColumns: {
        leftColumns: 3,
        rightColumns: 2
    }
});
// ============================================================================================  页面初始化处理
top.hangge();
$('#bookMonth').datepicker();
$('#placeDate').datepicker();
$('#realityDate').datepicker();

//新增
function addOutPutOrder() {
    openDialog('add_out_order_id', '下单', '/order/goAddOutPutOrder.do', {width: 1000, height: 600});
}

//修改
function editOutPutOrder(id) {
    openDialog('edit_out_order_id', '修改', '/order/goEditOutPutOrder.do?id=' + id, {width: 1000, height: 600});
}
//删除
function deleteOutPutOrder(id) {
    openDialog('delete_out_order_id', '删除中', '/order/deleteOutPutOrder.do?id=' + id, {width: 150, height: 1});
}

//查看该订单发票
function selectThisInvoice(invoiceCode) {
    openDialog('edit_this_out_invoice_id', '查看该订单发票', '/order/selectThisOutInvoice.do?invoiceCode=' + invoiceCode, {width: 1000, height: 600});
}

