package com.greathammer.controller.base;

import com.framework.controller.base.BaseController;
import com.greathammer.service.AttachmentService;
import com.framework.util.PageData;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.io.File;
import java.util.Map;

/**
 * Created by fy on 2016/8/29.
 */
@Controller
@RequestMapping("/base")
public class AttachmentController extends BaseController {

    @Resource(name = "attachmentService")
    private AttachmentService attachmentService;

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download() throws Exception {
        PageData pd = this.getPageData();
        Integer attachmentId = pd.getInt("attachmentId");

        Map attachmentMap = attachmentService.loadAttachmentById(attachmentId);

        File file = new File(attachmentMap.get("filepath").toString());
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String((attachmentMap.get("filename").toString()).getBytes("UTF-8"), "iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

}
