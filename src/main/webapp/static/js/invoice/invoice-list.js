/**
 * Created by lichangd on 2016/9/23.
 */

// =================================================================================== ajax分页

var invoiceDataTable = new DefaultDataTable('/invoice/ajaxListInvoice.do', [

    {
        mData: 'invoiceCode',
    },
    {
        mData: 'typeContractId',
    },
    {
        mData: 'orderCode'
    },
    {
        mData: 'lineNumber'
    },
    {
        mData: 'invoiceDate'
    },
    {
        mData: 'buyer'
    },
    {
        mData: 'sellert'
    },
    {
        mData: 'materialCode'
    },
    {
        mData: 'name'
    },
    {
        mData: 'materialDesc'
    },
    {
        mData: 'billToParty'
    },
    {
        mData: 'unit'
    },
    {
        mData: 'placeCount'
    },
    {
        mData: 'price'
    },
    {
        mData: 'amount'
    },
    {
        mData: 'tax'
    },
    {
        mData: 'taxRate'
    },
    {
        mData: 'totalAmount'
    },
    {
        mData: 'emailStatus',
        render: function (status, type, row) {
            return status === 1 ? '是' : '否';
        }
    },
    {
        mData: 'expressCode'
    },
    {
        mData: 'signStatus',
        render: function (status, type, row) {
            return status === 1 ? '是' : '否';
        }
    },
    {
        mData: 'signDate'
    },
    {
        mData: 'stauts',
        render: function (status, type, row) {
            return status === 1 ? '生效' : '无效';
        }
    },
    {
        render: function (data, type, row) {
            return ' <a class="btn btn-mini btn-info" title="编辑" onclick="editInvoice(\'' + row.id + '\');">修改' +
                '<i class="icon-edit"></i>' +
                '</a>';
        }
    }
], '#my-table', $('#invoiceForm'),{

    // order: [[ 3, 'desc' ], [ 0, 'asc' ]],
    // "aaSorting": [[1, 'asc']],
    //拖到列
    // colReorder: true,
    //合并
    // rowsGroup: [0,1,2],
    //固定列
    scrollX: true,
    // scrollY: '300px',
    // scrollCollapse: true,
    // fixedHeader: false,
    fixedColumns: {
        //从左边2个列固定
        leftColumns: 2,
        //从右边1个列固定
        rightColumns: 2
    }
});
// =================================================================================== 操作按钮处理函数
top.hangge();
$('#invoiceDate').datepicker();



//修改
function editInvoice(id) {
    openDialog('edit_invoice_id', '修改发票', '/invoice/goEditInvoice.do?id=' + id);

}

//新增
function addInvoice() {
    openDialog('add_invoice_id', '新增发票', '/invoice/goAddInvoiceBy.do');
}

