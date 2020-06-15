package com.framework.service.base;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by fy on 2016/9/14.
 */
@Service
public class CommonService {

    @Resource(name = "sqlSessionTemplate")
    private SqlSessionTemplate sqlSessionTemplate;
//    @Resource
//    private CommonMapper commonMapper;

    /**
     * @param columnName
     * @param columnValue
     * @return
     */
    @Transactional
    public int countColumn(String tableName, String columnName, String columnValue) {
        Map<String, String> param = new HashMap<>();
        param.put("tableName", tableName);
        param.put("columnName", columnName);
        param.put("columnValue", columnValue);
        return sqlSessionTemplate.selectOne("CommonMapper.countColumn", param);
//        return commonMapper.countColumn(param);
    }

}
