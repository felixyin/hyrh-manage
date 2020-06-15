/**
 * Created by lichangd on 2016/9/22.
 */
// ============================================================================================  页面初始化处理
top.hangge();
$("#jzts").hide();
$('#establishedDate').datepicker();


// ============================================================================================ 列表
var userDataTable = new DefaultDataTable('/customer/ajaxListUser.do', [//列定义
    {
        sTitle: '公司名称',
        mData: 'companyName'
    },
    {
        sTitle: '登录账号',
        mData: 'username'
    },
    {
        sTitle: '电话',
        mData: 'phone'
    },
    {
        sTitle: '姓名',
        mData: 'name'
    },
    {
        sTitle: '注册时间',
        mData: 'establishedDate'
    },
    {
        sTitle: '状态',
        mData: 'status',
        render: function (data, type, row) {
            var text = '';
            if (data === -1) {
                text = '全部';
            } else if (data == 0) {
                text = '无效';
            } else if (data == 1) {
                text = '未定价'
            } else if (data == 2) {
                text = '价格已审批'
            } else if (data == 3) {
                text = '价格为审批'
            }
            return text;
        }
    },
    {
        sTitle: '操作',
        render: function (data, type, row) {
            return '<a class="btn btn-mini btn-info" title="编辑" onclick="editUser(\'' + row.id + '\');">完善个人信息' +
                '<i class="icon-edit"></i>' +
                '</a>' +
                '<a class="btn btn-mini btn-info" style="margin-left: 10px" title="产品定价" onclick="ajaxListPrice(\'' + row.id + '\');">产品定价' +
                '<i class="icon-adjust"></i>' +
                '</a>';
        }
    }
], '#my-table', '#userForm');


// ============================================================================================ 操作按钮处理函数
/**
 * 新增用户
 */
function addUser() {
    openDialog('add_ser_id','新增用户','/customer/goAddUser.do');
}

/**
 *  完善用户信息
 */
function editUser(id) {
    openDialog('edit_user_id', '完善用户信息', '/customer/goEditUser.do?viewName=center/account_info_edit&id=' + id);
}

/**
 * 产品定价
 * @param id
 */
function ajaxListPrice(id) {
    openDialog('price_user_id', '产品定价', '/customer/ajaxListPrice.do?bizUserId=' + id);
}


