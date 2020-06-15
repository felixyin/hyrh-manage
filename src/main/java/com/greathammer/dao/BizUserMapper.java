package com.greathammer.dao;

import com.framework.util.PageData;
import com.greathammer.entity.BizUser;

public interface BizUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizUser record);

    int insertSelective(BizUser record);

    BizUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizUser record);

    int updateByPrimaryKey(BizUser record);

    int insertUser(PageData pd);

    int addUser(PageData pd);

}