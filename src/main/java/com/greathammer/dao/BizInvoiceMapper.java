package com.greathammer.dao;

import com.greathammer.entity.BizInvoice;

public interface BizInvoiceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizInvoice record);

    int insertSelective(BizInvoice record);

    BizInvoice selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizInvoice record);

    int updateByPrimaryKey(BizInvoice record);

    BizInvoice selectThisInvoice(String invoiceCode);
}