package com.greathammer.service;

import com.framework.service.base.BaseService;
import com.greathammer.dao.DicProductionMapper;
import com.framework.util.PageData;
import com.greathammer.entity.DicProduction;
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
public class ProductionService extends BaseService<DicProduction> {

    @Resource
    private DicProductionMapper dicProductionMapper;

    @Resource(name = "categoryService")
    private CategoryService categoryService;

    @Resource(name = "attachmentService")
    private AttachmentService attachmentService;

    public void addProduction(PageData pd) throws Exception {
        dicProductionMapper.addProduction(pd);
    }

    @Transactional(readOnly = true)
    public Map loadProduction(Integer productionId) throws Exception {
        return dicProductionMapper.loadProduction(productionId);
    }

    public void updateProduction(PageData pd) throws Exception {
        dicProductionMapper.updateProduction(pd);
    }

    public int length(String text) {
        return text.length();
    }

    public int length2(String text) {
        return text.length();
    }

    public String testString(String name) {
        return "hi," + name;
    }

    public boolean testBoolean(boolean isOk) {
        return !isOk;
    }

    public long testLong(long l) {
        return l + 200;
    }

    public Long testLong2(Long l) {
        return l * 2;
    }

    public List<DicProduction> listProducation(String term) {
        return dicProductionMapper.listProduction(term);
    }
}
