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
url: '/common/js2java.do',
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



/**
* @type Window.com.greathammer.service.AddressService
*/
var AddressService;
var AddressService = {

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    addAddressInfo: function (pd) {
    return _js2java('addressService', 'addAddressInfo', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
        * @param consigneeId java.lang.Integer
    * @returns {java.util.List}
    */
    listAddress: function (consigneeId) {
    return _js2java('addressService', 'listAddress', ['java.lang.Integer'], [consigneeId]);
    },

    /**
        * @param id java.lang.String
    * @returns {java.util.Map}
    */
    loadAddressInfo: function (id) {
    return _js2java('addressService', 'loadAddressInfo', ['java.lang.String'], [id]);
    },

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    updateAddressInfo: function (pd) {
    return _js2java('addressService', 'updateAddressInfo', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    updateDefaultAddress: function (pd) {
    return _js2java('addressService', 'updateDefaultAddress', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
    * @returns {java.lang.String}
    */
    getMapperName: function () {
    return _js2java('addressService', 'getMapperName', [], []);
    },

    /**
        * @param methodName java.lang.String
    * @returns {java.lang.String}
    */
    statement: function (methodName) {
    return _js2java('addressService', 'statement', ['java.lang.String'], [methodName]);
    },

    /**
        * @param paging com.framework.entity.Paging
        * @param param com.greathammer.entity.BizAddress
    * @returns {java.util.List}
    */
    searchListPage: function (paging, param) {
    return _js2java('addressService', 'searchListPage', ['com.framework.entity.Paging', 'com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(paging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param ajaxPaging com.framework.entity.AjaxPaging
        * @param param com.greathammer.entity.BizAddress
    * @returns {java.util.List}
    */
    ajaxSearchListPage: function (ajaxPaging, param) {
    return _js2java('addressService', 'ajaxSearchListPage', ['com.framework.entity.AjaxPaging', 'com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(ajaxPaging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {int}
    */
    delete: function (id) {
    return _js2java('addressService', 'delete', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizAddress
    * @returns {int}
    */
    insert: function (record) {
    return _js2java('addressService', 'insert', ['com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizAddress
    * @returns {int}
    */
    insertSelective: function (record) {
    return _js2java('addressService', 'insertSelective', ['com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.lang.Object}
    */
    selectOne: function (id) {
    return _js2java('addressService', 'selectOne', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizAddress
    * @returns {int}
    */
    updateSelective: function (record) {
    return _js2java('addressService', 'updateSelective', ['com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizAddress
    * @returns {int}
    */
    updateWithBLOBs: function (record) {
    return _js2java('addressService', 'updateWithBLOBs', ['com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizAddress
    * @returns {int}
    */
    update: function (record) {
    return _js2java('addressService', 'update', ['com.greathammer.entity.BizAddress'], [encodeURIComponent(JSON.stringify(record))]);
    }
};


/**
* @type Window.com.greathammer.service.AttachmentService
*/
var AttachmentService;
var AttachmentService = {

    /**
        * @param productionId java.lang.Integer
        * @param type java.lang.Integer
    * @returns {java.util.List}
    */
    loadAttachmentForProduction: function (productionId, type) {
    return _js2java('attachmentService', 'loadAttachmentForProduction', ['java.lang.Integer', 'java.lang.Integer'], [productionId, type]);
    },

    /**
        * @param attMap java.util.Map
    * @returns {void}
    */
    saveAttachment: function (attMap) {
    return _js2java('attachmentService', 'saveAttachment', ['java.util.Map'], [attMap]);
    },

    /**
        * @param attMap java.util.Map
    * @returns {void}
    */
    updateAttachment: function (attMap) {
    return _js2java('attachmentService', 'updateAttachment', ['java.util.Map'], [attMap]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {void}
    */
    deleteAttachment: function (id) {
    return _js2java('attachmentService', 'deleteAttachment', ['java.lang.Integer'], [id]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.util.Map}
    */
    loadAttachmentById: function (id) {
    return _js2java('attachmentService', 'loadAttachmentById', ['java.lang.Integer'], [id]);
    }
};


/**
* @type Window.com.greathammer.service.BizUserService
*/
var BizUserService;
var BizUserService = {

    /**
    * @returns {java.lang.String}
    */
    getMapperName: function () {
    return _js2java('bizUserService', 'getMapperName', [], []);
    },

    /**
        * @param methodName java.lang.String
    * @returns {java.lang.String}
    */
    statement: function (methodName) {
    return _js2java('bizUserService', 'statement', ['java.lang.String'], [methodName]);
    },

    /**
        * @param paging com.framework.entity.Paging
        * @param param com.greathammer.entity.BizUser
    * @returns {java.util.List}
    */
    searchListPage: function (paging, param) {
    return _js2java('bizUserService', 'searchListPage', ['com.framework.entity.Paging', 'com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(paging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param ajaxPaging com.framework.entity.AjaxPaging
        * @param param com.greathammer.entity.BizUser
    * @returns {java.util.List}
    */
    ajaxSearchListPage: function (ajaxPaging, param) {
    return _js2java('bizUserService', 'ajaxSearchListPage', ['com.framework.entity.AjaxPaging', 'com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(ajaxPaging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {int}
    */
    delete: function (id) {
    return _js2java('bizUserService', 'delete', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizUser
    * @returns {int}
    */
    insert: function (record) {
    return _js2java('bizUserService', 'insert', ['com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizUser
    * @returns {int}
    */
    insertSelective: function (record) {
    return _js2java('bizUserService', 'insertSelective', ['com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.lang.Object}
    */
    selectOne: function (id) {
    return _js2java('bizUserService', 'selectOne', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizUser
    * @returns {int}
    */
    updateSelective: function (record) {
    return _js2java('bizUserService', 'updateSelective', ['com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizUser
    * @returns {int}
    */
    updateWithBLOBs: function (record) {
    return _js2java('bizUserService', 'updateWithBLOBs', ['com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizUser
    * @returns {int}
    */
    update: function (record) {
    return _js2java('bizUserService', 'update', ['com.greathammer.entity.BizUser'], [encodeURIComponent(JSON.stringify(record))]);
    }
};


/**
* @type Window.com.greathammer.service.CategoryService
*/
var CategoryService;
var CategoryService = {

    /**
    * @returns {java.util.List}
    */
    listCategory: function () {
    return _js2java('categoryService', 'listCategory', [], []);
    },

    /**
        * @param arg0 java.util.List
    * @returns {void}
    */
    saveAllCategory: function (arg0) {
    return _js2java('categoryService', 'saveAllCategory', ['java.util.List'], [arg0]);
    }
};


/**
* @type Window.com.greathammer.service.IncomeOrderService
*/
var IncomeOrderService;
var IncomeOrderService = {

    /**
    * @returns {com.framework.dao.DaoSupport}
    */
    getDao: function () {
    return _js2java('incomeOrderService', 'getDao', [], []);
    },

    /**
        * @param dao com.framework.dao.DaoSupport
    * @returns {void}
    */
    setDao: function (dao) {
    return _js2java('incomeOrderService', 'setDao', ['com.framework.dao.DaoSupport'], [encodeURIComponent(JSON.stringify(dao))]);
    },

    /**
        * @param page com.framework.entity.Page
    * @returns {java.util.List}
    */
    listIncomeOrder: function (page) {
    return _js2java('incomeOrderService', 'listIncomeOrder', ['com.framework.entity.Page'], [encodeURIComponent(JSON.stringify(page))]);
    },

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    addIncomeOrder: function (pd) {
    return _js2java('incomeOrderService', 'addIncomeOrder', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    updateIncomeOrder: function (pd) {
    return _js2java('incomeOrderService', 'updateIncomeOrder', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.util.Map}
    */
    loadIncomeOrder: function (id) {
    return _js2java('incomeOrderService', 'loadIncomeOrder', ['java.lang.Integer'], [id]);
    }
};


/**
* @type Window.com.greathammer.service.InvoiceService
*/
var InvoiceService;
var InvoiceService = {

    /**
    * @returns {java.lang.String}
    */
    getMapperName: function () {
    return _js2java('invoiceService', 'getMapperName', [], []);
    },

    /**
        * @param methodName java.lang.String
    * @returns {java.lang.String}
    */
    statement: function (methodName) {
    return _js2java('invoiceService', 'statement', ['java.lang.String'], [methodName]);
    },

    /**
        * @param paging com.framework.entity.Paging
        * @param param com.greathammer.entity.BizInvoice
    * @returns {java.util.List}
    */
    searchListPage: function (paging, param) {
    return _js2java('invoiceService', 'searchListPage', ['com.framework.entity.Paging', 'com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(paging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param ajaxPaging com.framework.entity.AjaxPaging
        * @param param com.greathammer.entity.BizInvoice
    * @returns {java.util.List}
    */
    ajaxSearchListPage: function (ajaxPaging, param) {
    return _js2java('invoiceService', 'ajaxSearchListPage', ['com.framework.entity.AjaxPaging', 'com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(ajaxPaging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {int}
    */
    delete: function (id) {
    return _js2java('invoiceService', 'delete', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizInvoice
    * @returns {int}
    */
    insert: function (record) {
    return _js2java('invoiceService', 'insert', ['com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizInvoice
    * @returns {int}
    */
    insertSelective: function (record) {
    return _js2java('invoiceService', 'insertSelective', ['com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.lang.Object}
    */
    selectOne: function (id) {
    return _js2java('invoiceService', 'selectOne', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizInvoice
    * @returns {int}
    */
    updateSelective: function (record) {
    return _js2java('invoiceService', 'updateSelective', ['com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizInvoice
    * @returns {int}
    */
    updateWithBLOBs: function (record) {
    return _js2java('invoiceService', 'updateWithBLOBs', ['com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizInvoice
    * @returns {int}
    */
    update: function (record) {
    return _js2java('invoiceService', 'update', ['com.greathammer.entity.BizInvoice'], [encodeURIComponent(JSON.stringify(record))]);
    }
};


/**
* @type Window.com.greathammer.service.OrderService
*/
var OrderService;
var OrderService = {

    /**
        * @param pd com.framework.util.PageData
    * @returns {com.framework.util.PageData}
    */
    listAllOrder: function (pd) {
    return _js2java('orderService', 'listAllOrder', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    }
};


/**
* @type Window.com.greathammer.service.PriceService
*/
var PriceService;
var PriceService = {

    /**
    * @returns {java.lang.String}
    */
    getMapperName: function () {
    return _js2java('priceService', 'getMapperName', [], []);
    },

    /**
        * @param methodName java.lang.String
    * @returns {java.lang.String}
    */
    statement: function (methodName) {
    return _js2java('priceService', 'statement', ['java.lang.String'], [methodName]);
    },

    /**
        * @param paging com.framework.entity.Paging
        * @param param com.greathammer.entity.BizPrice
    * @returns {java.util.List}
    */
    searchListPage: function (paging, param) {
    return _js2java('priceService', 'searchListPage', ['com.framework.entity.Paging', 'com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(paging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param ajaxPaging com.framework.entity.AjaxPaging
        * @param param com.greathammer.entity.BizPrice
    * @returns {java.util.List}
    */
    ajaxSearchListPage: function (ajaxPaging, param) {
    return _js2java('priceService', 'ajaxSearchListPage', ['com.framework.entity.AjaxPaging', 'com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(ajaxPaging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {int}
    */
    delete: function (id) {
    return _js2java('priceService', 'delete', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizPrice
    * @returns {int}
    */
    insert: function (record) {
    return _js2java('priceService', 'insert', ['com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizPrice
    * @returns {int}
    */
    insertSelective: function (record) {
    return _js2java('priceService', 'insertSelective', ['com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.lang.Object}
    */
    selectOne: function (id) {
    return _js2java('priceService', 'selectOne', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.BizPrice
    * @returns {int}
    */
    updateSelective: function (record) {
    return _js2java('priceService', 'updateSelective', ['com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizPrice
    * @returns {int}
    */
    updateWithBLOBs: function (record) {
    return _js2java('priceService', 'updateWithBLOBs', ['com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.BizPrice
    * @returns {int}
    */
    update: function (record) {
    return _js2java('priceService', 'update', ['com.greathammer.entity.BizPrice'], [encodeURIComponent(JSON.stringify(record))]);
    }
};


/**
* @type Window.com.greathammer.service.ProductionService
*/
var ProductionService;
var ProductionService = {

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    addProduction: function (pd) {
    return _js2java('productionService', 'addProduction', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
        * @param productionId java.lang.Integer
    * @returns {java.util.Map}
    */
    loadProduction: function (productionId) {
    return _js2java('productionService', 'loadProduction', ['java.lang.Integer'], [productionId]);
    },

    /**
        * @param pd com.framework.util.PageData
    * @returns {void}
    */
    updateProduction: function (pd) {
    return _js2java('productionService', 'updateProduction', ['com.framework.util.PageData'], [encodeURIComponent(JSON.stringify(pd))]);
    },

    /**
        * @param text java.lang.String
    * @returns {int}
    */
    length: function (text) {
    return _js2java('productionService', 'length', ['java.lang.String'], [text]);
    },

    /**
        * @param text java.lang.String
    * @returns {int}
    */
    length2: function (text) {
    return _js2java('productionService', 'length2', ['java.lang.String'], [text]);
    },

    /**
        * @param name java.lang.String
    * @returns {java.lang.String}
    */
    testString: function (name) {
    return _js2java('productionService', 'testString', ['java.lang.String'], [name]);
    },

    /**
        * @param isOk boolean
    * @returns {boolean}
    */
    testBoolean: function (isOk) {
    return _js2java('productionService', 'testBoolean', ['boolean'], [isOk]);
    },

    /**
        * @param l long
    * @returns {long}
    */
    testLong: function (l) {
    return _js2java('productionService', 'testLong', ['long'], [l]);
    },

    /**
        * @param l java.lang.Long
    * @returns {java.lang.Long}
    */
    testLong2: function (l) {
    return _js2java('productionService', 'testLong2', ['java.lang.Long'], [l]);
    },

    /**
    * @returns {java.lang.String}
    */
    getMapperName: function () {
    return _js2java('productionService', 'getMapperName', [], []);
    },

    /**
        * @param methodName java.lang.String
    * @returns {java.lang.String}
    */
    statement: function (methodName) {
    return _js2java('productionService', 'statement', ['java.lang.String'], [methodName]);
    },

    /**
        * @param paging com.framework.entity.Paging
        * @param param com.greathammer.entity.DicProduction
    * @returns {java.util.List}
    */
    searchListPage: function (paging, param) {
    return _js2java('productionService', 'searchListPage', ['com.framework.entity.Paging', 'com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(paging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param ajaxPaging com.framework.entity.AjaxPaging
        * @param param com.greathammer.entity.DicProduction
    * @returns {java.util.List}
    */
    ajaxSearchListPage: function (ajaxPaging, param) {
    return _js2java('productionService', 'ajaxSearchListPage', ['com.framework.entity.AjaxPaging', 'com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(ajaxPaging)), encodeURIComponent(JSON.stringify(param))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {int}
    */
    delete: function (id) {
    return _js2java('productionService', 'delete', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.DicProduction
    * @returns {int}
    */
    insert: function (record) {
    return _js2java('productionService', 'insert', ['com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.DicProduction
    * @returns {int}
    */
    insertSelective: function (record) {
    return _js2java('productionService', 'insertSelective', ['com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param id java.lang.Integer
    * @returns {java.lang.Object}
    */
    selectOne: function (id) {
    return _js2java('productionService', 'selectOne', ['java.lang.Integer'], [id]);
    },

    /**
        * @param record com.greathammer.entity.DicProduction
    * @returns {int}
    */
    updateSelective: function (record) {
    return _js2java('productionService', 'updateSelective', ['com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.DicProduction
    * @returns {int}
    */
    updateWithBLOBs: function (record) {
    return _js2java('productionService', 'updateWithBLOBs', ['com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(record))]);
    },

    /**
        * @param record com.greathammer.entity.DicProduction
    * @returns {int}
    */
    update: function (record) {
    return _js2java('productionService', 'update', ['com.greathammer.entity.DicProduction'], [encodeURIComponent(JSON.stringify(record))]);
    }
};

