var xxxxDataTable = new DefaultDataTable('your/url.do', [
<#list columnList as var>
    {
        sTitle: '${var.COLUMN_COMMENT}',
        mData: '${var.FILED_NAME}'
    },
</#list>
    {
        sTitle: '操作',
        render: function (data, type, row) {
        return ' <a class="btn btn-mini btn-info" onclick="your_function(\'' + row.id + '\');">修改' +
              '<i class="icon-edit"></i>' +
              '</a>';
        }
    }
], '#your_table_id', $('#your_form_id'));
