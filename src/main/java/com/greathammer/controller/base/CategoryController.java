package com.greathammer.controller.base;

import com.framework.controller.base.BaseController;
import com.greathammer.service.CategoryService;
import com.greathammer.service.ProductionService;
import com.framework.util.PageData;
import net.sf.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by fy on 2016/8/22.
 */
@Controller
@RequestMapping(value = "/base")
public class CategoryController extends BaseController {

    @Resource
    private ProductionService productionService;

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    /**
     * 分类树
     *
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/listCategory")
    public ModelAndView listCategory() throws Exception {
        List<Map> categoryList = categoryService.listCategory();

        ModelAndView mv = this.getMV();
        mv.addObject("categoryList", JSONArray.fromObject(categoryList));
        mv.addObject("msg", this.getPageData().getString("msg"));
        mv.addObject("maxCategoryId", calMaxCategoryId(categoryList, 0));
        mv.setViewName("base/production/category_list");
        return mv;
    }

    /**
     * 计算最大的categoryId
     *
     * @param categoryList
     * @param maxCategoryId
     * @return
     */
    private int calMaxCategoryId(List<Map> categoryList, int maxCategoryId) {
        for (Map category : categoryList) {
            int id = (int) category.get("id");
            if (id > maxCategoryId)
                maxCategoryId = id;
        }
        return maxCategoryId;
    }

    @RequestMapping(value = "/saveAllCategory")
    public ModelAndView saveAllCategory() throws Exception {
        PageData pd = this.getPageData();
        String categoryListStr = pd.getString("categoryList");
        List<Map> categoryList = com.alibaba.fastjson.JSON.parseArray(categoryListStr, Map.class);
        categoryService.saveAllCategory(categoryList);
        return new ModelAndView("redirect:/base/listCategory?msg=saved");
    }

}
