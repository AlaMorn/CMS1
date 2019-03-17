package com.tyf.controller;

import com.tyf.pojo.MainNotice;
import com.tyf.pojo.notice;
import com.tyf.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Controller

public class NoticeController {



    @Autowired
    private NoticeService noticeService;
    @RequestMapping("/file/upload")
    public String Mupload(notice notice, Model model){
        List<MultipartFile> Mu=notice.getFile();
        List<String> filenames=new ArrayList<>();
        MainNotice mainNotice=new MainNotice();
        //保存数据库的路径
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath="D:\\File\\";
        if(!notice.getFile().isEmpty()){
            for (MultipartFile multipartFile:Mu) {
                //获取原始文件名
                String OrignFileName=multipartFile.getOriginalFilename();
                String FilenamePrefix=OrignFileName.substring(0,OrignFileName.lastIndexOf("."));
                //加工 文件名，加上时间
                String NewFilenamePrefix=FilenamePrefix+new Date().getTime();
                String NewFilename=NewFilenamePrefix+OrignFileName.substring(OrignFileName.lastIndexOf("."));
                //构建文件对象
                File file=new File(localPath+NewFilename);
                //上传
                try {

                    multipartFile.transferTo(file);
                    //把图片的相对路径保存至数据库
                    sqlPath = "/images/"+NewFilename;

                    filenames.add(sqlPath);


                }catch (IOException e){
                    e.printStackTrace();
                }

            }
        }
        mainNotice.setSid(notice.getSid());
        mainNotice.setImg1(filenames.get(0));
        mainNotice.setImg2(filenames.get(1));
        mainNotice.setImg3(filenames.get(2));
        mainNotice.setImg4(filenames.get(3));
        mainNotice.setImg5(filenames.get(4));
        mainNotice.setSummary(notice.getSummary());

        boolean i=noticeService.updateByNoticeSid(mainNotice);
        if(i){
            return "cmain";
        }
        else{
            model.addAttribute("flag","上传失败");
            return "cmain";
        }



    }

}
