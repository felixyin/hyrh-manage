package com.greathammer.service;

import com.greathammer.dao.BizAttachmentMapper;
import com.greathammer.entity.BizAttachment;
import com.greathammer.entity.DicProduction;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by fy on 2016/8/22.
 */

@Service(value = "attachmentService")
public class AttachmentService {

    @Resource
    private BizAttachmentMapper bizAttachmentMapper;

    /**
     * 根据产品id和类型查询对应的附件
     *
     * @param productionId 产品主键
     * @param type         附件类型。0：未知，1：产品附件，2：产品图片，3：发票
     * @return
     * @throws Exception
     */
    public List<BizAttachment> loadAttachmentForProduction(Integer productionId, Integer type) throws Exception {
        Map<String, Object> param = new HashMap<>();
        param.put("productionId", productionId);
        param.put("type", type);
//        return (List<Map<String, Object>>) dao.findForList("AttachmentMapper.listAttachmentForProduction", param);
        return bizAttachmentMapper.listAttachmentForProduction(param);
    }


    public void saveAttachment(Map attMap) throws Exception {
//        dao.save("AttachmentMapper.save", attMap);
        bizAttachmentMapper.save(attMap);
    }

    public void updateAttachment(Map attMap) throws Exception {
//        dao.update("AttachmentMapper.update", attMap);
        bizAttachmentMapper.update(attMap);
    }

    public void deleteAttachment(Integer id) throws Exception {
//        dao.delete("AttachmentMapper.delete", id);
        bizAttachmentMapper.delete(id);
    }

    public Map loadAttachmentById(Integer id) throws Exception {
//        return ((List<Map>) dao.findForList("AttachmentMapper.loadAttachmentById", id)).get(0);
        return (Map) bizAttachmentMapper.loadAttachmentById(id).get(0);
    }


}
