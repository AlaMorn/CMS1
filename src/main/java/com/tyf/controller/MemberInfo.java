package com.tyf.controller;

import com.tyf.pojo.ResultMap;
import com.tyf.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Map;

@Controller
public class MemberInfo {


    @Autowired
    private MembersService membersService;

    @RequestMapping("/modifyIcon/{sid}")
    public String modifyIcon(@PathVariable String sid,Model model){
        model.addAttribute("sid",sid);
        return "modifyIcon";
    }

    @RequestMapping("/uploadIcon/{sid}")
    @ResponseBody
    public ResultMap<String> uploadIcon(MultipartFile file, @PathVariable String sid){
        String sqlPath=null;
        if(file !=null) {
            String myFileName = file.getOriginalFilename();// 文件原名称
            String newFile="simple"+myFileName.substring(myFileName.lastIndexOf("."));
            //定义文件保存的本地路径
            String localPath="D:\\File\\";

            File ifile=new File(localPath+newFile);
            //上传
            try {

                file.transferTo(ifile);
                //把图片的相对路径保存至数据库
                sqlPath = "/images/"+newFile;
            }catch (IOException e){
                e.printStackTrace();
            }

        }
        membersService.UpdataImage(sqlPath,sid);

        return new ResultMap<String>("",null,0,1);
    }
}
