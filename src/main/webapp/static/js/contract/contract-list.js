/**
 * Created by liuyaping on 2016/10/27.
 */

// =================================================================================== ajax分页
var contractDataTable = new DefaultDataTable('/contract/ajaxListContract.do', [

    {

        mData: 'contentNumber'
    },
    {

        mData: 'typeContractId'
    },

    {

        mData: 'orderCode'
    },
    {

        mData: 'lineNumber'
    },
    {

        mData: 'materialCode'
    },
    {

        mData: 'materialDesc'
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

        mData: 'count'
    },
    {

        mData: 'unit'
    },
    {

        mData: 'unitPrice'
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


    /*{

     mData: 'cdate'
     },
     {

     mData: 'udate'
     },*/

    {

        render: function (data, type, row) {
            return ' <a class="btn btn-mini btn-info" onclick="editContract(\'' + row.id + '\');">修改' +
                '<i class="icon-edit"></i>' +
                '</a>';
        }
    }
], '#contract-table', $('#contractForm'), {
    scrollX: "true",
    fixedColumns: {
        //从左边2个列固定
        leftColumns: 2,
        //从右边1个列固定
        rightColumns: 1
    }
});
// =================================================================================== 操作按钮处理函数
top.hangge();


//修改
function editContract(id) {
    openDialog('edit_contract_id', '修改合同', '/contract/goEditContract.do?id=' + id);

}

//新增
function addContract() {
    openDialog('add_contract_id', '新增合同', '/contract/goAddContract.do');
}

// ============================================================================================  表单验证
var validator = $("#contractAddForm").validate({
    rules: {
        contentNumber: {
            required: "true"
        },
        typeContractId: {
            required: "true",
            number: "true"
        },
        orderCode: {
            required: "true"
        },
        lineNumber: {
            required: "true"
        },
        materialCode: {
            required: "true"
        },
        materialDesc: {
            required: "true"
        },
        comment: {
            required: "true"
        },
        provider: {
            required: "true"
        },
        original: {
            required: "true"
        },
        customer: {
            required: "true"
        },
        priceUnit: {
            required: "true"
        },
        count: {
            required: "true"
        },
        unit: {
            required: "true"
        },
        unitPrice: {
            required: "true"
        },
        placeCount: {
            required: "true"
        },
        sellCount: {
            required: "true"
        },
        paymentMoney: {
            required: "true",
            number: "true"
        },
        placeDate: {
            required: "true",
            date: "true"
        },
        requireDate: {
            required: "true",
            date: "true"
        },
        realityDate: {
            required: "true",
            date: "true"
        },
        freightOrderCode: {
            required: "true"
        },
        freightMoney: {
            required: "true",
            number: "true"
        },
        freightMoneyNo: {
            required: "true",
            number: "true"
        },
        storageMoney: {
            required: "true",
            number: "true"
        },
        fileName: {
            required: "true"
        },
        filePath: {
            required: "true"
        },
        cdate: {
            required: "true",
            date: "true"
        },
        udate: {
            required: "true",
            date: "true"
        },
        status: {
            required: "true",
            number: "true"
        }

    },
    messages: {
        contentNumber: {
            required: "合同号必填"
        },
        typeContractId: {
            required: "进销项合同标识必填",
            number: "进销项合同标识必须是数字"
        },
        orderCode: {
            required: "订单号必填"
        },
        lineNumber: {
            required: "行号必填"
        },
        materialCode: {
            required: "物料号必填"
        },
        materialDesc: {
            required: "物料描述必填"
        },
        comment: {
            required: "注释（牌号）必填"
        },
        provider: {
            required: "供应商必填"
        },
        original: {
            required: "原厂必填"
        },
        customer: {
            required: "客户必填"
        },
        priceUnit: {
            required: "价格单位必填"
        },
        count: {
            required: "数量必填"
        },
        unit: {
            required: "单位必填"
        },
        unitPrice: {
            required: "单价必填"
        },
        placeCount: {
            required: "下单数量必填"
        },
        sellCount: {
            required: "销售数量必填"
        },
        paymentMoney: {
            required: "付款金额必填",
            number: "付款金额必须是日期"
        },
        placeDate: {
            required: "下单日期必填",
            date: "下单日期必须是日期"
        },
        requireDate: {
            required: "要求交付日期必填",
            date: "要求交付日期必须为日期格式"
        },
        realityDate: {
            required: "实际交付日期必填",
            date: "实际交付日期必须为日期格式"
        },
        freightOrderCode: {
            required: "发货单号必填"
        },
        freightMoney: {
            required: "有发票运费必填",
            number: "有发票运费必须为数字"
        },
        freightMoneyNo: {
            required: "无发票运费必填",
            number: "无发票运费必须是数字"
        },
        storageMoney: {
            required: "仓储费必填",
            number: "仓储费必须是数字"
        },
        fileName: {
            required: "合同名称必填"
        },
        filePath: {
            required: "合同路径必填"
        },
        cdate: {
            required: "创建日期必填",
            date: "创建日期必须是日期"
        },
        udate: {
            required: "更新日期必填",
            date: "更新日期必须是日期"
        },
        status: {
            required: "状态必填",
            number: "状态必须是数字0或者1"
        }
    }
});

