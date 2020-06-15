package com.greathammer.service;

import com.framework.service.base.BaseService;
import com.greathammer.entity.BizUser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by lichangde on 2016/9/14.
 */
@Service(value = "bizUserService")
@Transactional
public class BizUserService extends BaseService<BizUser> {

}
