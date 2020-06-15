package com.greathammer.controller.base;

import com.alibaba.fastjson.JSON;
import com.framework.controller.base.BaseController;
import com.framework.entity.AjaxPaging;
import com.framework.entity.Paging;
import com.framework.entity.base.Attacment;
import com.framework.entity.system.BizUser;
import com.framework.util.*;
import com.greathammer.entity.BizAttachment;
import com.greathammer.entity.DicProduction;
import com.greathammer.service.AttachmentService;
import com.greathammer.service.CategoryService;
import com.greathammer.service.ProductionService;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fy on 2016/8/22.
 */
@Controller
@RequestMapping(value = "/base")
public class ProductionController extends BaseController{

    /**
     * 产品服务
     */
    @Resource
    private ProductionService productionService;

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @Resource(name = "attachmentService")
    private AttachmentService attachmentService;

    private void mvAddCategoryList(final ModelAndView mv) throws Exception {
        List<Map> categoryList = categoryService.listCategory();
        JSONArray jsonArray = JSONArray.fromObject(categoryList);
        mv.addObject("categoryList", jsonArray.toString());
    }

    /**
     * 列表
     *
     * @param paging
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/listProductions")
    public ModelAndView listProductions(Paging<DicProduction> paging, DicProduction dicProduction) throws Exception {
        List<DicProduction> productionList = productionService.searchListPage(paging, dicProduction);

        ModelAndView mv = this.getMV();
        mvAddCategoryList(mv);
        mv.addObject("productionList", productionList)
                .addObject("p", paging.getPd())
                .setViewName("base/production/production_list");
        return mv;
    }

    @RequestMapping(value = "/goListProductions")
    public ModelAndView goListProductions() throws Exception {
        ModelAndView mv = this.getMV();
        mvAddCategoryList(mv);
        mv.setViewName("base/production/production_list");
        return mv;
    }

    /**
     * 产品列表(ajax)
     *
     * @param ajaxPaging
     * @param dicProduction
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/ajaxListProductions")
    @ResponseBody
    public ModelAndView ajaxListProductions(AjaxPaging<DicProduction> ajaxPaging, DicProduction dicProduction) throws Exception {
        List<DicProduction> productionList = productionService.ajaxSearchListPage(ajaxPaging, dicProduction);
        return this.getAjaxPagingMV(ajaxPaging, productionList);
    }

    /**
     * 跳转新增产品页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goAddProduction")
    public ModelAndView goAddProduction() throws Exception {
        List<Map> categoryList = categoryService.listCategory();

        ModelAndView mv = this.getMV();
        mv.addObject("categoryList", JSONArray.fromObject(categoryList).toString())
                .addObject("msg", "addProduction")
                .setViewName("base/production/production_edit");
        return mv;
    }

    /**
     * 新增产品
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/addProduction")
    public ModelAndView addProduction() throws Exception {
        productionService.addProduction(this.getPageData());

        ModelAndView mv = this.getMV();
        mv.addObject("msg", "success");
        mv.setViewName("save_result");
        return mv;
    }

    /**
     * 跳转修改产品页面
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/goEditProduction")
    public ModelAndView goEditProduction(Integer productionId) throws Exception {
        Map production = productionService.loadProduction(productionId);

        production.put("attachmentFileList", attachmentService.loadAttachmentForProduction(productionId, 1));
        production.put("logoFileList", attachmentService.loadAttachmentForProduction(productionId, 2));


        ModelAndView mv = this.getMV();
        mvAddCategoryList(mv);
        mv.addObject("msg", "editProduction")
                .addObject("pd", production)
                .setViewName("base/production/production_edit");
        return mv;
    }


    /**
     * 根据文件名称过滤出上传到后台的多个文件中的一个
     *
     * @param attacmentMapList
     * @param fileName
     * @return
     */
    public static Attacment getAttachment(List<Attacment> attacmentMapList, String fileName) {
        for (Attacment attacment : attacmentMapList) {
            if (fileName.equals(attacment.getOldFileName())) {
                return attacment;
            }
        }
        throw new IllegalArgumentException("文件上传参数异常");
    }


    @RequestMapping(value = "/editProduction")
    @ResponseBody
    public String editProduction(
            HttpServletRequest request,
            @RequestParam(value = "productionId") Integer productionId,
            @RequestParam(value = "categoryId") Integer categoryId,
            @RequestParam(value = "number") String number,
            @RequestParam(value = "name") String name,
            @RequestParam(value = "content") String content,
            @RequestParam(value = "comment") String comment,
            @RequestParam(value = "pack", required = false) String pack,
            @RequestParam(value = "unit", required = false) String unit,
            @RequestParam(value = "minQuantity", required = false) String minQuantity,
            @RequestParam(value = "attachmentMap", required = false) String attachmentMap,
            @RequestParam(value = "attachmentFileList", required = false) MultipartFile[] attachmentFileList,
            @RequestParam(value = "status", required = false) String status
    ) throws Exception {

        PageData pd = this.getPageData();
        pd.put("id", productionId);
        pd.put("content", content);
        pd.put("categoryId", categoryId);
        pd.put("number", number);
        pd.put("name", name);
        pd.put("comment", comment);
        pd.put("pack", pack);
        pd.put("unit", unit);
        pd.put("minQuantity", minQuantity);
        pd.put("status", status);

        productionService.updateProduction(pd);

//        循环处理多个附件
        List<Attacment> attacmentMapList = JSON.parseArray(attachmentMap, Attacment.class);

        for (int i = 0; i < attachmentFileList.length; i++) {
            MultipartFile file = attachmentFileList[i];

            if (!file.isEmpty()) {
                Attacment attacment = attacmentMapList.get(i);

                String filePath = PathUtil.getClasspath() + Const.FILEPATHFILE + DateUtil.getDays();
                String newFileName = FileUpload.fileUp(file, filePath, attacment.getNewFileName() + "-" + this.get32UUID());

                Map attMap = new HashMap();
                attMap.put("productionId", productionId);
                attMap.put("type", 1);
                attMap.put("filename", attacment.getNewFileName() + FileUpload.getFileExt(file));
                attMap.put("filepath", filePath + "/" + newFileName);
                attMap.put("status", 1);

                if (attacment.getType() == 1) { // 新增的附件
                    attachmentService.saveAttachment(attMap);
                } else if (attacment.getType() == 2) { //修改的附件
                    attMap.put("id", attacment.getAttachmentId());
                    attMap.put("udate", new Date());
                    attachmentService.updateAttachment(attMap);
                } else {
                    // type == 0 ，则认为附件没有被修改
                }

            }
        }

        return this.callJs(this.exeAtDialogParentWinAndCloseDialog("edit_poduction_id", "productionDataTable.search();"));
//        ModelAndView mv = this.getMV();
//        mv.setViewName("save_result");
//        mv.addObject("msg", "success");
//        return mv;
    }

    /**
     * 删除附件
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/deleteAttachment")
    public void deleteAttachment(PrintWriter out) throws Exception {
        try {
            PageData pd = this.getPageData();
            Integer attachmentId = pd.getInt("attachmentId");
            attachmentService.deleteAttachment(attachmentId);
            out.write("success");
            out.close();
        } catch (Exception e) {
            logger.error(e.toString(), e);
        }
    }

    /**
     * 查看产品详细信息
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/viewProduction")
    public ModelAndView viewProduction() throws Exception {
        PageData pd = this.getPageData();

        Integer productionId = pd.getInt("production_id");

//        查询产品的附件
        List<BizAttachment> attachmentFile = attachmentService.loadAttachmentForProduction(productionId, 1);

//        查询产品的logo图片
//        Map<String, Object> logoFile = attachmentService.loadAttachmentForProduction(productionId, 2).get(0);

//        查询产品信息
        Map productionMap = productionService.loadProduction(productionId);
        productionMap.put("attachmentFile", attachmentFile);
//        productionMap.put("logoFile", logoFile);

//        跳转详情页面
        ModelAndView mv = this.getMV();
        mv.addObject("production", productionMap)
                .addObject("attachmentFile", attachmentFile)
                .setViewName("/base/production/production_view");
        return mv;
    }

}

