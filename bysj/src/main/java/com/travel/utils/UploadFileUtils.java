package com.travel.utils;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * 类说明
 * 上传文件工具类
 * @author 茶茶
 * @date 2020-03-16 10:28 新建
 */
public class UploadFileUtils {

    public static String uploadImgFile(MultipartFile file,String param) throws IOException {
        //1.获取文件的原名称
        String originalFilename = file.getOriginalFilename();
        //2.获取文件的后缀
        String suffixName = originalFilename.substring(originalFilename.lastIndexOf("."));
        //3.生成新的文件名
        String newFilename = UUID.randomUUID().toString().replace("-","") + System.currentTimeMillis() + suffixName;
        //4.保存的位置
        String localFilename = "D:\\java\\SpringBoot\\bysj\\src\\main\\resources\\static\\images\\" + param + File.separator + newFilename;
        //5.将位置转化为文件对象
        File desFile = new File(localFilename);
        //6.将上传的文件以新的文件名保存到到服务器上
        file.transferTo(desFile);
        //7.上传成功
        System.out.println("上传至服务器成功");
        //8.返回新文件名，以便继续后面的操作
        return newFilename;
    }

}
