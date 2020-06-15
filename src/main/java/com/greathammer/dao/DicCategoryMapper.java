package com.greathammer.dao;

import com.greathammer.entity.DicCategory;

import java.util.List;
import java.util.Map;

public interface DicCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DicCategory record);

    int insertSelective(DicCategory record);

    DicCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DicCategory record);

    int updateByPrimaryKey(DicCategory record);

    List<Map> listCategory();

    int saveCategory(Map categoryMap);

    int clearCategory();

}