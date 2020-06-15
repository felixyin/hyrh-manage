package com.greathammer.controller.invoice;

/**
 * Created by lcd on 2016/9/19.
 */

import com.framework.controller.base.BaseController;
import com.framework.entity.AjaxPaging;
import com.framework.util.PageData;
import com.greathammer.entity.BizInvoice;
import com.greathammer.entity.BizOrder;
import com.greathammer.service.InvoiceService;
import com.greathammer.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by lichangde on 2016/9/13.
 */
@Controller
@RequestMapping(value = "/invoice")
public class InvoiceController extends BaseController {


    @Resource(name = "invoiceService")
    private InvoiceService invoiceService;

    @Resource
    private OrderService orderService;

    /**
     * 发票页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/listInvoice")
    public ModelAndView listInvoice() throws Exception {
        ModelAndView mv = this.getMV();
        mv.setViewName("invoice/invoice_list");
        return mv;
    }

    /**
     * 显示发票列表(ajax)
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajaxListInvoice")
    @ResponseBody
    public ModelAndView ajaxListInvoice(AjaxPaging<BizInvoice> ajaxPaging, BizInvoice bizInvoice) throws Exception {

        List<BizInvoice> invoiceList = invoiceService.ajaxSearchListPage(ajaxPaging, bizInvoice);
        return this.getAjaxPagingMV(ajaxPaging, invoiceList);

    }
//
//    /**
//     * 跳转到添加页面
//     *
//     * @return
//     */
//    @RequestMapping(value = "/goAddInvoice")
//    public ModelAndView goAddInvoice() {
//        ModelAndView mv = this.getMV();
//        mv.setViewName("invoice/invoice_add");
//        mv.addObject("msg", "addInvoice");
//        return mv;
//    }

    /**
     * 添加
     *
     * @param bizInvoice
     * @return
     */
    @RequestMapping(value = "/addInvoice")
    @ResponseBody
    public String addInvoice(BizInvoice bizInvoice) {

        invoiceService.insertSelective(bizInvoice);
//        ModelAndView mv = this.getMV();
//        mv.addObject("msg", "success");
//        mv.setViewName("save_result");
//        return mv;
//        return this.exeAtDialogParentWinAndCloseDialog("edit_income_order_id", "incomeOrderDataTable.search();");
        return this.callJs(
                this.exeAtDialogParentWinAndCloseDialog("add_invoice_id", "invoiceDataTable.search();") +
                        this.closeDialog("edit_income_order_id")
        );
//    return null;
    }

    /**
     * 跳转编辑页面
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/goEditInvoice")
    public ModelAndView goEditInvoice(Integer id) {
        BizInvoice bizInvoice = invoiceService.selectOne(id);
        ModelAndView mv = this.getMV();
        mv.addObject("msg", "editInvoice")
                .addObject("bizInvoice", bizInvoice)
                .setViewName("/invoice/invoice_add");
        return mv;
    }

    /**
     * 修改保存
     *
     * @param bizInvoice
     * @return
     */
    @RequestMapping(value = "editInvoice")
    @ResponseBody
    public String editInvoice(BizInvoice bizInvoice) {
        invoiceService.updateSelective(bizInvoice);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_invoice_id", "invoiceDataTable.search();"));
    }


//    @RequestMapping(value = "/findBymeterialCode")
//    public ModelAndView findBymeterialCode(String invoiceCode) {
//
//        ModelAndView mv = this.getMV();
//        mv.setViewName("/invoice/ce_shi");
//
//        return mv;
//    }

    /**
     * 跳转到添加页面
     *
     * @return
     */
    @RequestMapping(value = "/goAddInvoiceBy")
    public ModelAndView goAddInvoiceBy() {
        List<Map> list = orderService.selectAll();
        ModelAndView mv = this.getMV();
        mv.setViewName("invoice/invoice_add_by");
        mv.addObject("msg", "addInvoice");
        return mv;
    }

    /**
     * 查看详细
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/loadOrderInfo")
    public ModelAndView loadOrderInfo(Integer id) throws Exception {
        BizOrder bizOrderEdit = orderService.selectOne(id);

        ModelAndView mv = this.getMV();
        mv.addObject("bizOrderEdit", bizOrderEdit)
                .addObject("msg", "addInvoice")
                .setViewName("invoice/order_load_info");

        return mv;
    }


}
