package com.greathammer.service;

import com.framework.service.base.BaseService;
import com.framework.util.PageData;
import com.greathammer.dao.BizOrderMapper;
import com.greathammer.entity.BizOrder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by david on 2016/9/23.
 */
@Service
@Transactional
public class OrderService extends BaseService<BizOrder> {

    @Resource
    private BizOrderMapper bizOrderMapper;

    public List<Map> selectAll() {
        return bizOrderMapper.selectAll();
    }

    public void save(PageData pd) {
        bizOrderMapper.insertOne(pd);
    }
}
