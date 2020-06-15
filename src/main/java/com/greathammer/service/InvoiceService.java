package com.greathammer.service;

import com.framework.service.base.BaseService;
import com.greathammer.dao.BizInvoiceMapper;
import com.greathammer.entity.BizInvoice;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Map;


/**
 * Created by lcd on 2016/9/18.
 */
@Service
@Transactional
public class InvoiceService extends BaseService<BizInvoice> {

    @Resource
    private BizInvoiceMapper bizInvoiceMapper;

    public BizInvoice selectThisInvoice(String invoiceCode) {
        return bizInvoiceMapper.selectThisInvoice(invoiceCode);
    }
}
