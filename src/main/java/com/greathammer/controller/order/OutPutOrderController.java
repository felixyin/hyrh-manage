package com.greathammer.controller.order;

import com.framework.controller.base.BaseController;
import com.framework.entity.AjaxPaging;
import com.greathammer.entity.BizInvoice;
import com.greathammer.entity.BizOrder;
import com.greathammer.service.InvoiceService;
import com.greathammer.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Administrator on 2016/9/26.
 */
@Controller
@RequestMapping(value = "/order")
public class OutPutOrderController extends BaseController {

    @Resource
    private OrderService orderService;

    @Resource(name = "invoiceService")
    private InvoiceService invoiceService;

    /**
     * 跳转页面
     *
     * @return
     */
    @RequestMapping(value = "/listOutPutOrder")
    public ModelAndView listOutPutOrder() {
        ModelAndView mv = this.getMV();
        mv.setViewName("order/output/out_put_order_list");
        return mv;
    }

    /**
     * ajax分页
     *
     * @param ajaxPaging
     * @param bizOrder
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajaxListOutPutOrder")
    @ResponseBody
    public ModelAndView ajaxListOutPutOrder(AjaxPaging<BizOrder> ajaxPaging, BizOrder bizOrder) throws Exception {
        List<BizOrder> bizOrderList = orderService.ajaxSearchListPage(ajaxPaging, bizOrder);
        return this.getAjaxPagingMV(ajaxPaging, bizOrderList);
    }

    /**
     * 下单
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goAddOutPutOrder")
    public ModelAndView goAddOutPutOrder() throws Exception {

        ModelAndView mv = this.getMV();
        mv.addObject("msg", "addOutPutOrder")
                .setViewName("order/output/out_put_order_edit");
        return mv;
    }

    /**
     * 保存
     *
     * @param bizOrder
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/addOutPutOrder")
    public String addOutPutOrder(BizOrder bizOrder) throws Exception {
        orderService.insert(bizOrder);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("add_out_order_id", "outPutOrderDataTable.search();"));
    }

    /**
     * 跳转编辑页面并回显数据
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goEditOutPutOrder")
    public ModelAndView goEditOutPutOrder(Integer id) throws Exception {
        BizOrder bizOrderEdit = orderService.selectOne(id);

        ModelAndView mv = this.getMV();
        mv.addObject("bizOrderEdit", bizOrderEdit)
                .addObject("msg", "editOutPutOrder")
                .setViewName("order/output/out_put_order_edit");

        return mv;
    }

    /**
     * 保存修改
     *
     * @param bizOrder
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/editOutPutOrder")
    public String editOutPutOrder(BizOrder bizOrder) throws Exception {
        orderService.updateSelective(bizOrder);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_out_order_id", "outPutOrderDataTable.search();"));

    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteOutPutOrder")
    public String deleteOutPutOrder(Integer id) throws Exception{
        orderService.delete(id);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("delete_out_order_id", "outPutOrderDataTable.search();"));
    }


    /**
     * 查看该订单的发票
     *
     * @param invoiceCode
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectThisOutInvoice")
    public ModelAndView selectThisOutInvoice(String invoiceCode) throws Exception {
        BizInvoice bizInvoice = invoiceService.selectThisInvoice(invoiceCode);

        ModelAndView mv = this.getMV();
        mv.addObject("bizInvoice", bizInvoice)
                .setViewName("invoice/out_invoice_edit");

        return mv;
    }

    /**
     * 修改保存
     *
     * @param bizInvoice
     * @return
     */
    @RequestMapping(value = "/editOutInvoice")
    @ResponseBody
    public String editOutInvoice(BizInvoice bizInvoice) {
        invoiceService.updateSelective(bizInvoice);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_this_out_invoice_id", "outPutOrderDataTable.search();"));
    }
}
