package com.greathammer.service;/**
 * Created by liuyaping on 2016/10/27.
 */

import com.framework.service.base.BaseService;
import com.greathammer.dao.DicProductionMapper;
import com.framework.entity.Page;
import com.framework.util.PageData;
import com.greathammer.entity.BizContract;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class ContractService extends BaseService<BizContract>{

}