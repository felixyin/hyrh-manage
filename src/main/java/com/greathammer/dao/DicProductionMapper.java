package com.greathammer.dao;

import com.framework.entity.Paging;
import com.greathammer.entity.DicProduction;
import com.framework.entity.Page;
import com.framework.util.PageData;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface DicProductionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DicProduction record);

    int insertSelective(DicProduction record);

    DicProduction selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DicProduction record);

    int updateByPrimaryKeyWithBLOBs(DicProduction record);

    int updateByPrimaryKey(DicProduction record,String name);

    int addProduction(PageData pd);

    Map loadProduction(int id);

    int updateProduction(PageData pd);

    List<DicProduction> listProduction(String term);
}