=========================================== 查询表单：
<#list columnList as var>
<td>
${var.COLUMN_COMMENT}：
</td>
<td>
  <input type="text" name="${var.FILED_NAME}" value="${d}{${objectName}.${var.FILED_NAME}}" placeholder="请输入${var.COLUMN_COMMENT}"/>
</td>
</#list>

=========================================== 表头：
<#list columnList as var>
<th>${var.COLUMN_COMMENT}</th>
</#list>

=========================================== 列表：
<#list columnList as var>
<td>${d}{${var.FILED_NAME}}</td>
</#list>
