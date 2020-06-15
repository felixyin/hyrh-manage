package com.greathammer.dao;

import com.framework.util.PageData;
import com.greathammer.entity.BizOrder;

import java.util.List;
import java.util.Map;

public interface BizOrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizOrder record);

    int insertSelective(BizOrder record);

    BizOrder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizOrder record);

    int updateByPrimaryKey(BizOrder record);

    List<Map> selectAll();

    int insertOne(PageData pd);
}