package com.greathammer.controller.center;

import com.framework.controller.base.BaseController;
import com.framework.util.PageData;
import com.greathammer.service.AddressService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

/**
 * Created by david on 2016/9/7.
 */
@Controller
@RequestMapping(value = "/center")
public class AddressController extends BaseController {

    @Resource(name = "bizAddressService")
    private AddressService addressService;

    /**
     * 地址列表
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/listAddress")
    public ModelAndView listAddress(Integer id, String viewName) throws Exception {
        if (null == id) {
            id = getBizUser().getId();
        } else {
            this.setAttr("id", id);
        }

        List<Map> addressInfo = addressService.listAddress(id);

        ModelAndView mv = this.getMV();
        mv.addObject("addressInfo", addressInfo)
                .addObject("id", id)
                .addObject("msg", "editAddress")
                .addObject("viewName", viewName)
                .setViewName(viewName);
        return mv;
    }

    /**
     * 跳转添加
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goAddAddress")
    public ModelAndView goAddAddress(String consigneeId) throws Exception {
        ModelAndView mv = this.getMV();
        mv.addObject("consigneeId", consigneeId)
                .addObject("msg", "addAddress")
                .setViewName("center/address_edit");
        return mv;
    }

    /**
     * 添加保存
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/addAddress")
    public String addAddress(Integer consigneeId) throws Exception {
        PageData pd = this.getPageData();

        if (null == consigneeId) {
            consigneeId = getBizUser().getId();
            pd.put("consigneeId", consigneeId);
        }

        addressService.addAddressInfo(pd);
        return reloadTab();
    }

    private String reloadTab() {
        String func = "function reloadTab(id) {\n" +
                "    var url = $(id).data('url');\n" +
                "    var targetDomId = $(id).attr('href');\n" +
                "    var targetDom = $(targetDomId);\n" +
                "    $(id).parent('li').addClass('active');\n" +
                "    targetDom.addClass('in active');\n" +
                "    targetDom.load(url)\n" +
                "}";
        return callJs(func + "top.__edit_address_dialog.close(); parent.reloadTab('#my_address_tab_id');");

    }

   /* private ModelAndView getMv() {
        Map<String, Object> param = new HashMap<>();
        param.put("viewName", "center/address_info");
        param.put("id", getBizUser().getId());
        return new ModelAndView("redirect:/customer/goEditUser", param);
    }
*/

    /**
     * 跳转编辑页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/addressEdit")
    public ModelAndView addressEdit() throws Exception {
        String id = this.getPageData().getString("id");

        Map editAddressInfo = addressService.loadAddressInfo(id);

        ModelAndView mv = this.getMV();
        mv.addObject("editAddressInfo", editAddressInfo)
                .addObject("msg", "editAddress")
                .setViewName("center/address_edit");
        return mv;
    }

    /**
     * 保存
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/editAddress")
    public String editAddress() throws Exception {
        PageData pd = this.getPageData();

        addressService.updateAddressInfo(pd);

        return reloadTab();
    }

    /**
     * 删除
     *
     * @param id
     * @param out
     * @throws Exception
     */
    @RequestMapping(value = "/deleteAddress")
    public void delete(@RequestParam Integer id, PrintWriter out) throws Exception {
        try {
            addressService.delete(id);
            out.write("success");
            out.flush();
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }

    }

    /**
     * 设为默认
     *
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/defaultAddressInfo")
    public String defaultAddressInfo() throws Exception {
        PageData pd = this.getPageData(); // addressId \ consigneeId

        addressService.updateDefaultAddress(pd);

        return reloadTab();
    }

}
