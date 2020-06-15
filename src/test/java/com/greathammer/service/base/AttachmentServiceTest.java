package com.greathammer.service.base;

import com.greathammer.BaseTest;
import com.greathammer.entity.BizAttachment;
import com.greathammer.service.AttachmentService;
import org.junit.Test;

import javax.annotation.Resource;

import java.util.List;

/**
 * Created by Jenkin on 2016/8/24.
 */
public class AttachmentServiceTest extends BaseTest {
    @Resource(name = "attachmentService")
    private AttachmentService attachmentService;

    @Test
    public void loadAttachmentForProduction() throws Exception {
        List<BizAttachment> maps = attachmentService.loadAttachmentForProduction(1, 1);
        for (BizAttachment map : maps) {
            System.out.println(map);
        }
    }

}