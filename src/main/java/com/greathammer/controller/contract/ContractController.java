package com.greathammer.controller.contract;

import com.framework.controller.base.BaseController;
import com.framework.entity.AjaxPaging;
import com.greathammer.entity.BizContract;
import com.greathammer.service.ContractService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by liuyaping on 2016/10/27.
 */
@Controller
@RequestMapping(value="/contract")
public class ContractController extends BaseController {

    @Resource
    private ContractService contractService;

    /**
     * 合同页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/listContract")
    public ModelAndView listContract() throws Exception {
        ModelAndView mv = this.getMV();
        mv.setViewName("contract/contract_list");
        return mv;
    }

    /**
     * 显示发票列表(ajax分页)
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajaxListContract")
    @ResponseBody
    public ModelAndView ajaxListContract(AjaxPaging<BizContract> ajaxPaging, BizContract bizContract) throws Exception {

        List<BizContract> contractList = contractService.ajaxSearchListPage(ajaxPaging, bizContract);
        return this.getAjaxPagingMV(ajaxPaging, contractList);
    }

    /**
     * 新增合同
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goAddContract")
    public ModelAndView goAddContract() throws Exception {

        ModelAndView mv = this.getMV();
        mv.addObject("msg", "addContract")
                .setViewName("contract/contract_edit");
        return mv;
    }

    /**
     * 保存
     *
     * @param bizContract
     * @return
     * @throws Exception
     */

    @ResponseBody
    @RequestMapping(value = "/addContract")
    public String addContract(BizContract bizContract) throws Exception {
        contractService.insert(bizContract);

        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("add_contract_id", "contractDataTable.search();"));
    }
    /**
     * 跳转编辑页面并回显数据
     *
     * @param id
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goEditContract")
    public ModelAndView goEditContract(Integer id) throws Exception {
        BizContract bizContract = contractService.selectOne(id);

        ModelAndView mv = this.getMV();
        mv.addObject("bizContract", bizContract)
                .addObject("msg", "editContract")
                .setViewName("contract/contract_edit");
        return mv;
    }

    /**
     * 保存修改
     *
     * @param BizContract
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/editContract")
    public ModelAndView editContract(BizContract BizContract) throws Exception {
        contractService.updateSelective(BizContract);
        //return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_contract_id", "contractDataTable.search();"));
        return new ModelAndView("/contract/contract_list");
    }


    
    
}
