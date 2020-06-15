package com.greathammer.service.base;

import com.alibaba.fastjson.JSON;
import com.greathammer.BaseTest;
import com.greathammer.service.CategoryService;
import net.sf.json.JSONNull;
import net.sf.json.JsonConfig;
import net.sf.json.processors.DefaultValueProcessor;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by fy on 2016/8/22.
 */
public class CategoryServiceTest extends BaseTest {

    private static JsonConfig jsonConfig = new JsonConfig();

    public class MyDefaultIntegerValueProcessor implements DefaultValueProcessor {
        public MyDefaultIntegerValueProcessor() {
        }

        public Object getDefaultValue(Class type) {
            if (type == null) {
                return "";
            }
            return JSONNull.getInstance();
        }
    }

    @Test
    public void saveAllCategory() throws Exception {
        String categoryListStr = "[{\"name\":\"ff系列\",\"id\":1,\"pId\":0},{\"name\":\"系列4\",\"id\":4,\"pId\":0},{\"name\":\"系列2\",\"id\":2,\"pId\":4},{\"name\":\"系列3\",\"id\":3,\"pId\":2},{\"name\":\"系列5\",\"id\":5,\"pId\":0},{\"name\":\"new node1\",\"id\":101,\"pId\":5}]";
//        JSONArray jsonArray = JSONArray.fromObject(categoryListStr);
//        jsonConfig.registerDefaultValueProcessor(String.class, new MyDefaultIntegerValueProcessor());
//        List categoryList = JSONArray.toList(jsonArray, Map.class, jsonConfig);
        List<Map> categoryList = JSON.parseArray(categoryListStr, Map.class);
        System.out.println(categoryList);
//        categoryService.saveAllCategory(categoryList);
    }

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @Test
    public void listCategory() throws Exception {
        List<Map> maps = categoryService.listCategory();
        System.out.println(maps);

    }

    @Test
    public void listCategorypage() throws Exception {
        List<Map> categoryList = categoryService.listCategory();
        for (Map<String, Object> category : categoryList) {
            System.out.println(category);
        }
    }
}