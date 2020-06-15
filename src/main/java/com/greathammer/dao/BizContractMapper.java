package com.greathammer.dao;

import com.greathammer.entity.BizContract;

public interface BizContractMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizContract record);

    int insertSelective(BizContract record);

    BizContract selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizContract record);

    int updateByPrimaryKey(BizContract record);
}