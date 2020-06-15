package com.greathammer.dao;

import com.framework.util.PageData;
import com.greathammer.entity.BizAddress;

import java.util.List;
import java.util.Map;

public interface BizAddressMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizAddress record);

    int insertSelective(BizAddress record);

    BizAddress selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizAddress record);

    int updateByPrimaryKey(BizAddress record);

    int addAddressInfo(PageData pd);

    List<Map> listAddress(Integer consigneeId);

    Map loadAddressInfo(String id);

    int updateAddressInfo(PageData pd);

    int updateDefaultAddress(PageData pd);

    int resetDefaultAddress(PageData pd);

    int deleteAddressInfo(String id);
}