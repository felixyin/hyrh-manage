/**
 * Created by lcd on 2016/10/21.
 */

// ============================================================================================  ajax列表
var incomeOrderDataTable = new DefaultDataTable('/order/ajaxListIncomeOrder.do', [
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
            return ' <a class="btn btn-mini btn-info" onclick="editIncomeOrder(\'' + row.id + '\');">查看详细' +
                '<i class="icon-edit"></i>' +
                '</a>';
        }
    }
], '#income_order_table_id', $('#incomeOrderForm'), {
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
function addIncomeOrder() {
    openDialog('add_income_order_id', '新增', '/order/goAddIncomeOrder.do', {width: 1000, height: 600});
}

//修改
function editIncomeOrder(id) {
    openDialog('edit_income_order_id', '查看详细', '/invoice/loadOrderInfo.do?id=' + id, {width: 1000, height: 600});
}


