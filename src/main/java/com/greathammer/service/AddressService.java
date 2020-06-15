package com.greathammer.service;

import com.framework.util.PageData;
import com.greathammer.dao.BizAddressMapper;
import com.greathammer.entity.BizAddress;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.framework.service.base.BaseService;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by david on 2016/9/7.
 *
 */
@Transactional
@Service(value = "bizAddressService")
public class AddressService extends BaseService<BizAddress> {

    @Resource
    private BizAddressMapper bizAddressMapper;

    @Transactional
    public void addAddressInfo(PageData pd) throws Exception {
        bizAddressMapper.addAddressInfo(pd);
    }

    @Transactional(readOnly = true)
    public List<Map> listAddress(Integer consigneeId) throws Exception {
        return bizAddressMapper.listAddress(consigneeId);
    }

    @Transactional(readOnly = true)
    public Map loadAddressInfo(String id) throws Exception {
        return bizAddressMapper.loadAddressInfo(id);
    }

    public void updateAddressInfo(PageData pd) throws Exception {
        bizAddressMapper.updateAddressInfo(pd);
    }

    public void updateDefaultAddress(PageData pd) throws Exception {
        pd.put("status", 1);
        bizAddressMapper.resetDefaultAddress(pd);

        pd.put("status", 2);
        bizAddressMapper.updateDefaultAddress(pd);
    }

}
