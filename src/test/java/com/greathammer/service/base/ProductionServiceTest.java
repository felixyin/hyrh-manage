package com.greathammer.service.base;

import com.greathammer.BaseTest;
import com.framework.util.PageData;
import com.greathammer.entity.DicProduction;
import com.greathammer.service.ProductionService;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * Created by fy on 2016/8/22.
 */
public class ProductionServiceTest extends BaseTest {

    @Test
    public void addProduction() throws Exception {
        PageData pd = new PageData();

        pd.put("category_id", 12);
        pd.put("number", "xxxx");
        pd.put("name", "xxxx");
        pd.put("content", "xxxx");
        pd.put("comment", "xxxx");
        pd.put("price", 555);
        pd.put("pack", "xxxx");
        pd.put("unit", "xxxx");
        pd.put("min_quantity", 2);
        pd.put("sequence", 32);
        pd.put("creator_id", 22);
        pd.put("content", "xxxx");
        pd.put("status", 1);

        productionService.addProduction(pd);
    }

    @Resource(name = "productionService")
    private ProductionService productionService;

    @Test
    public void listProductions() throws Exception {
//        Paging page = new Page();
//        PageData pd = new PageData();
//        pd.put("categoryId", 102);
//        page.setPd(pd);
//        List<PageData> pageDatas = productionService.searchListPage(page);
//        System.out.println("--------->" + pageDatas.size());
//        for (PageData pageData : pageDatas) {
//            System.out.println(pageData);
//        }
    }

    @Test
    public void selectOne() throws Exception {
        DicProduction dicProduction = productionService.selectOne(1);
        System.out.println("=----------------------------:");
        System.out.println(dicProduction.getName());

    }

}