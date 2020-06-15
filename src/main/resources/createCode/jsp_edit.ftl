=========================================== 修改表单：
<#list columnList as var>
<div class="control-group">
  <label class="control-label" for="id_${var.COLUMN_NAME}">${var.COLUMN_COMMENT}</label>
  <div class="controls">
    <input type="text" name="${var.FILED_NAME}" id="id_${var.COLUMN_NAME}" value="${var.FILED_NAME}" placeholder="这里输入${var.COLUMN_COMMENT}"/>
    <span class="help-inline"></span>
  </div>
</div>
</#list>

