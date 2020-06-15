/**
* @author fy
* 版权所有：巨锤网络科技青岛有限公司
* 生成 by maven-genjs-plugin
*/

/**
* 底层请求函数
* @param data
* @param cb
*/
function _js2java(service, method, types, params) {
var result = {ok: false};
var data = {
service: service,
method: method,
types: types,
params: params
};
$.ajax({
url: '${ajaxUrl}',
data: data,
async: false,
method: 'post',
success: function (data, status) {
result.ok = true;
result.statusCode = status;
result.data = data;
},
error: function (data, status, xhr) {
result.statusCode = status;
result.data = xhr.responseText;
}
});
console.log('js2java --->:', data, result);
return result;
}

<#list classList as c>


/**
* @type Window.${c.classNameFull}
*/
var ${c.className};
var ${c.className} = {
    <#list c.methodList as m>

    /**
        <#list m.paramList as p>
        * @param ${p.paramName} ${p.paramType}
        </#list>
    * @returns {${m.returnType}}
    */
    ${m.methodName}: function (<#list m.paramList as p>${p.paramName}<#if p_has_next>, </#if></#list>) {
    return _js2java('${c.classNameLower}', '${m.methodName}', [<#list m.paramList as p>'${p.paramType}'<#if p_has_next>, </#if></#list>], [<#list m
    .paramList as p>${p.paramValue}<#if p_has_next>, </#if></#list>]);
    }<#if m_has_next>,</#if>
    </#list>
};
</#list>

