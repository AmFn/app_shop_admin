package io.renren.modules.oss.controller;

import io.renren.common.utils.R;
import io.renren.modules.oss.service.SysOssService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
@RestController
@RequestMapping("/oss/upload")

public class UploadController {

        @Autowired
        private SysOssService ossService;
        @PostMapping()
        @ApiOperation("上传文件")
        public R uploadOssFiles(MultipartFile file){
            String url = ossService.uploadFileAvatar(file);
            return R.ok().put("url",url);
        }


}
