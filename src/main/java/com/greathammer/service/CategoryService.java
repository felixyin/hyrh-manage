package com.greathammer.service;

import com.greathammer.dao.DicCategoryMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by fy on 2016/8/22.
 */
@Service
@Transactional
public class CategoryService {

    @Resource
    private DicCategoryMapper dicCategoryMapper;

    @Transactional(readOnly = true)
    public List<Map> listCategory() throws Exception {
//        return (List<Map<String, Object>>) dao.findForList("CategoryMapper.listCategory", null);
        return dicCategoryMapper.listCategory();
    }

    public void saveAllCategory(List<Map> categoryList) throws Exception {
//        dao.delete("CategoryMapper.clearCategory", null);
//        dao.batchSave("CategoryMapper.saveCategory", categoryList);
        dicCategoryMapper.clearCategory();
        for (Map categoryMap : categoryList) {
            dicCategoryMapper.saveCategory(categoryMap);
        }
    }


}
