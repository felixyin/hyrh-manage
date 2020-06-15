package com.greathammer.controller.order;

import com.framework.controller.base.BaseController;
import com.framework.entity.AjaxPaging;
import com.framework.entity.system.Role;
import com.framework.service.system.user.UserService;
import com.framework.util.*;
import com.greathammer.entity.BizInvoice;
import com.greathammer.entity.BizOrder;
import com.greathammer.entity.DicProduction;
import com.greathammer.service.InvoiceService;
import com.greathammer.service.OrderService;
import com.greathammer.service.ProductionService;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.mail.MailParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by david on 2016/9/23.
 */
@Controller
@RequestMapping(value = "/order")
public class IncomeOrderController extends BaseController {

    String menuUrl = "user/listUsers.do"; //菜单地址(权限用)
    @Resource
    private OrderService orderService;

    @Resource
    private ProductionService productionService;

    @Resource(name = "invoiceService")
    private InvoiceService invoiceService;

    @Resource(name = "userService")
    private UserService userService;

    /**
     * 跳转页面
     *
     * @return
     */
    @RequestMapping(value = "/listIncomeOrder")
    public ModelAndView listIncomeOrder() {
        ModelAndView mv = this.getMV();
        mv.setViewName("order/income/income_order_list");
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
    @RequestMapping(value = "/ajaxListIncomeOrder")
    @ResponseBody
    public ModelAndView ajaxListIncomeOrder(AjaxPaging<BizOrder> ajaxPaging, BizOrder bizOrder) throws Exception {

        List<BizOrder> bizOrderList = orderService.ajaxSearchListPage(ajaxPaging, bizOrder);
        return this.getAjaxPagingMV(ajaxPaging, bizOrderList);
    }

    /**
     * 新增
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goAddIncomeOrder")
    public ModelAndView goAddIncomeOrder() throws Exception {

        ModelAndView mv = this.getMV();
        mv.addObject("msg", "addIncomeOrder")
                .setViewName("order/income/income_order_edit");
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
    @RequestMapping(value = "/addIncomeOrder")
    public String addIncomeOrder(BizOrder bizOrder) throws Exception {
        orderService.insert(bizOrder);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("add_income_order_id", "incomeOrderDataTable.search();"));
    }

    /**
     * 跳转编辑页面并回显数据
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goEditIncomeOrder")
    public ModelAndView goEditIncomeOrder(Integer id) throws Exception {
        BizOrder bizOrderEdit = orderService.selectOne(id);

        ModelAndView mv = this.getMV();
        mv.addObject("bizOrderEdit", bizOrderEdit)
                .addObject("msg", "editIncomeOrder")
                .setViewName("order/income/income_order_edit");

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
    @RequestMapping(value = "/editIncomeOrder")
    public String editIncomeOrder(BizOrder bizOrder) throws Exception {
        orderService.updateSelective(bizOrder);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_income_order_id", "incomeOrderDataTable.search();"));
    }

    @RequestMapping(value = "/autoComplete")
    @ResponseBody
    public Object autoComplete(String term) {
//        List<DicProduction> productionList = new ArrayList();
        List<DicProduction> productionList = productionService.listProducation(term);


        return productionList;
    }

    /**
     * 查看该订单的发票
     *
     * @param invoiceCode
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/selectThisInvoice")
    public ModelAndView selectThisInvoice(String invoiceCode) throws Exception {
        BizInvoice bizInvoice = invoiceService.selectThisInvoice(invoiceCode);

        ModelAndView mv = this.getMV();
        mv.addObject("bizInvoice", bizInvoice)
                .setViewName("invoice/this_invoice_edit");

        return mv;
    }

    /**
     * 修改保存
     *
     * @param bizInvoice
     * @return
     */
    @RequestMapping(value = "/editInvoice")
    @ResponseBody
    public String editInvoice(BizInvoice bizInvoice) {
        invoiceService.updateSelective(bizInvoice);
        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_this_invoice_id", "outOrderDataTable.search();"));
    }
    /**
     * 打开上传Excel的页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goLoadExcel")
    public ModelAndView goLoadExcel() throws Exception {
        ModelAndView mv = this.getMV();
        mv.setViewName("order/income/up_load_excel");
        return mv;
    }

    /**
     * 从EXCEL导入到数据库
     */
    @RequestMapping(value = "/loadExcel")
    public ModelAndView loadExcel(
            @RequestParam(value = "excel", required = false) MultipartFile file
    ) throws Exception {
        ModelAndView mv = this.getMV();
        PageData pd = new PageData();
        if (!Jurisdiction.buttonJurisdiction(menuUrl, "add")) {
            return null;
        }
        if (null != file && !file.isEmpty()) {
            String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE;                                //文件上传路径
            String fileName = FileUpload.fileUp(file, filePath, "userexcel");                            //执行上传

            List<PageData> listPd = (List) ObjectExcelRead.readExcel(filePath, fileName, 2, 0, 0);    //执行读EXCEL操作,读出的数据导入List 2:从第3行开始；0:从第A列开始；0:第0个sheet

			/*存入数据库操作======================================*/

//            List<Role> roleList = roleService.listAllERRoles();	//列出所有二级角色

//            pd.put("ROLE_ID", roleList.get(0).getROLE_ID());	//设置角色ID为随便第一个
            /**
             * var0 :订单号
             * var1 :行号
             * var2 :进销项合同
             *
             * var3 :邮箱
             * var4 :备注
             */
            for (int i = 0; i < listPd.size(); i++) {
                pd.put("order_code", listPd.get(i).getString("var0"));                               //订单号
                pd.put("line_number", listPd.get(i).getString("var1"));                             //行号
                pd.put("type_contract", listPd.get(i).getString("var2"));                           //进销项合同标识


                String bookMonth = listPd.get(i).getString("var3");//2016/10/27
                String requireDate = listPd.get(i).getString("var18");//2016/10/27
                String realityDate = listPd.get(i).getString("var19");//2016/10/27
                String placeDate = listPd.get(i).getString("var17");//2016/10/27
                SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
                Date bookMD = format.parse(bookMonth);
                Date requireD = format.parse(requireDate);
                Date realityD = format.parse(realityDate);
                Date placeD = format.parse(placeDate);
//                String format1 = format.format(new Date());//2016/10/27

//
                pd.put("book_month", bookMD);                             //订货月份
                pd.put("material_code", listPd.get(i).getString("var4"));                           //物料号
                pd.put("material_desc", listPd.get(i).getString("var5"));                            //物料描述
                pd.put("address_id", listPd.get(i).getInt("var6"));                           //地址
                pd.put("comment", listPd.get(i).getString("var7"));                            //注释
                pd.put("provider", listPd.get(i).getString("var8"));                            //供应商
                pd.put("original", listPd.get(i).getString("var9"));                            //原厂
                pd.put("customer", listPd.get(i).getString("var10"));                            //客户
                pd.put("price_unit", listPd.get(i).getString("var11"));                            //价格单位
                pd.put("unit", listPd.get(i).getString("var12"));                            //单位
                pd.put("count_unit", listPd.get(i).getString("var13"));                            //数量单位
                pd.put("place_count", listPd.get(i).getString("var14"));                            //下单数量
                pd.put("sell_count", listPd.get(i).getString("var15"));                            //销售数量
                pd.put("payment_money", listPd.get(i).getString("var16"));                            //付款金额
                pd.put("place_date", placeD);                            //下单日期
                pd.put("require_date", requireD);                            //要求交付日期
                pd.put("reality_date", realityD);                            //实际交付日期
                pd.put("freight_order_code", listPd.get(i).getString("var20"));                            //发货单号
                pd.put("freight_money", listPd.get(i).getString("var21"));                            //运费
                pd.put("freight_money_no", listPd.get(i).getString("var22"));                            //运费
                pd.put("storage_money", listPd.get(i).getString("var23"));                            //仓储费
                pd.put("content_number", listPd.get(i).getString("var24"));                            //合同号
                pd.put("is_payment", listPd.get(i).getString("var25"));                            //是否付款
                pd.put("is_order_end", listPd.get(i).getString("var26"));                            //订单是否完结
                pd.put("is_invoice", listPd.get(i).getString("var27"));                            //是否开具发票
                pd.put("invoice_code", listPd.get(i).getString("var28"));                       //发票号
                pd.put("amount", listPd.get(i).getString("var29"));                           //发票金额
                pd.put("note", listPd.get(i).getString("var30"));                            //备注
                pd.put("status", listPd.get(i).getInt("var31"));                            //状态

                orderService.save(pd);
            }
            /*存入数据库操作======================================*/

            mv.addObject("msg", "success");
        }

        mv.setViewName("save_result");
        return mv;
    }


}
