package com.greathammer.dao;

import com.greathammer.entity.BizPrice;

public interface BizPriceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizPrice record);

    int insertSelective(BizPrice record);

    BizPrice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizPrice record);

    int updateByPrimaryKey(BizPrice record);
}