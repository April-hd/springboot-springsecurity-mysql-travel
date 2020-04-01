package com.hut.travel.utils;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.UUID;

/**
 * 类说明
 * 上传文件工具类
 * @author 茶茶
 * @date 2020-03-16 10:28 新建
 */
public class UploadFileUtils {

    public static String uploadImgFile(MultipartFile file, HttpServletRequest request,String param) throws IOException {
        //1.获取文件的原名称
        String originalFilename = file.getOriginalFilename();
        //2.获取文件的后缀
        String suffixName = originalFilename.substring(originalFilename.lastIndexOf("."));
        //3.生成新的文件名
        String newFilename = UUID.randomUUID().toString().replace("-","") + System.currentTimeMillis() + suffixName;
        //4.获取当前项目的真实地址，拼接新的文件名，并保存在服务器的静态资源目录下
        String desFilename = request.getServletContext().getRealPath("") + "WEB-INF\\classes\\static\\images\\" + param + File.separator + newFilename;
        //5.同时备份在本地项目上，以便重构项目时，资源依旧存在
        String localFilename = "D:\\soft\\project\\travel\\src\\main\\resources\\static\\images\\" + param + File.separator + newFilename;
        //6.将desFileName转化为抽象路径文件对象
        File desFile = new File(desFilename);
        //7.将上传的文件以新的文件名复制到服务器上
        file.transferTo(desFile);
        System.out.println("上传至服务器成功");
        //8.备份到本地项目
        UploadFileUtils.copyFile(desFilename,localFilename);
        System.out.println("备份到本地项目成功");
        //9.返回新文件名，以便继续后面的操作
        return newFilename;
    }

    /**
     *  复制文件
     * @param inpath 输入路径
     * @param outpath 输出路径
     */
    public static void copyFile(String inpath,String outpath){
        FileInputStream in = null;
        FileOutputStream out = null;
        try {
            in = new FileInputStream(inpath);
            out = new FileOutputStream(outpath);
            byte[] b = new byte[1048576*10];
            int length = 0;
            while ((length = in.read(b)) != -1){
                out.write(b,0,length);
            }
            out.flush();
            out.close();
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
