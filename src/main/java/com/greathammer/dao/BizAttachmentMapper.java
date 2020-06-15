package com.greathammer.dao;

import com.greathammer.entity.BizAttachment;

import java.util.List;
import java.util.Map;

public interface BizAttachmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BizAttachment record);

    int insertSelective(BizAttachment record);

    BizAttachment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BizAttachment record);

    int updateByPrimaryKey(BizAttachment record);

    List<BizAttachment> listAttachmentForProduction(Map param);

    Map loadAttachmentById(Integer id);

    int save(Map attMap);

    int update(Map attMap);

    int delete(Integer id);

}