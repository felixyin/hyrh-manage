package com.greathammer.controller.customer;

import com.framework.controller.base.BaseController;
import com.framework.entity.AjaxPaging;
import com.greathammer.entity.BizPrice;
import com.greathammer.entity.BizUser;
import com.greathammer.service.CategoryService;
import com.greathammer.service.BizUserService;
import com.greathammer.service.PriceService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by lichangde on 2016/9/8.
 */
@Controller
@RequestMapping(value = "/customer")
public class CustomerAndPriceController extends BaseController {


    @Resource(name = "bizUserService")
    private BizUserService myUserService;

    @Resource
    private PriceService priceService;

    @Resource(name = "categoryService")
    private CategoryService categoryService;


    /**
     * 列表
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/listUser")
    public ModelAndView listUser() throws Exception {
        ModelAndView mv = this.getMV();
        mv.setViewName("customer/user_list");
        return mv;
    }

    /**
     * 分页列表（ajax）
     *
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/ajaxListUser")
    @ResponseBody
    public ModelAndView ajaxListUser(AjaxPaging<BizUser> ajaxPaging, BizUser bizUser) throws Exception {

        List<BizUser> userList = myUserService.ajaxSearchListPage(ajaxPaging, bizUser);

        return this.getAjaxPagingMV(ajaxPaging, userList);

    }

    /**
     * 跳转到添加页面
     *
     * @return
     */
    @RequestMapping(value = "/goAddUser")
    public ModelAndView goAddUser() {
        ModelAndView mv = this.getMV();
        mv.setViewName("customer/user_add");
        return mv;
    }

    /**
     * 添加页面
     */
//    @RequestMapping(value = "/addUser")
//    public ModelAndView addUser() throws Exception {
//        ModelAndView mv = this.getMV();
//        PageData pd = this.getPageData();
//        myUserService.addUser(pd);
//        mv.setViewName("customer/success_add_price");
//        return mv;
//    }

    /**
     * 跳转编辑页面
     *
     * @return
     */
    @RequestMapping(value = "/goEditUser")
    public ModelAndView goEditUser(Integer id, String viewName) throws Exception {
        setAttr("bizUser.id", id);

        ModelAndView mv = this.getMV();
        mv.addObject("id", id);
        mv.addObject("viewName", viewName);
        mv.setViewName("customer/user_edit");
        return mv;


    }

    /**
     * 分类
     *
     * @param mv
     * @throws Exception
     */
    private void mvAddCategoryList(final ModelAndView mv) throws Exception {
        List<Map> categoryList = categoryService.listCategory();

        JSONArray jsonArray = JSONArray.fromObject(categoryList);
        mv.addObject("categoryList", jsonArray.toString());
    }


    /**
     * 跳转产品定价页面
     *
     * @return
     */
    /*@RequestMapping(value = "/goEditPrice")
    public ModelAndView goEditPrice(Paging<BizPrice> paging, BizPrice bizPrice, Integer bizUserId) throws Exception {
        paging.setShowCount(5);
        List<BizPrice> bizPriceList = priceService.searchListPage(paging, bizPrice);

        ModelAndView mv = this.getMV();
        mvAddCategoryList(mv);
        mv.addObject("bizPriceList", bizPriceList)
                .addObject("p", paging.getPd())
                .addObject("bizUserId", bizUserId)
                .addObject("operatorId", getBizUser().getId())
                .setViewName("customer/price_edit");
        return mv;
    }*/
    @ResponseBody
    @RequestMapping(value = "/ajaxListPrice")
    public ModelAndView ajaxListPrice(AjaxPaging<BizPrice> ajaxPaging, BizPrice bizPrice, Integer bizUserId) throws Exception {
        List<BizPrice> bizPriceList = priceService.ajaxSearchListPage(ajaxPaging, bizPrice);

        ModelAndView mv = this.getAjaxPagingMV(ajaxPaging, bizPriceList);
        mvAddCategoryList(mv);
        mv.addObject("bizUserId", bizUserId)
                .addObject("p", ajaxPaging.getPd())
                .addObject("operatorId", getBizUser().getId());
        return mv;
    }

}
