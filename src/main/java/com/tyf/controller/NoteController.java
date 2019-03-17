package com.tyf.controller;

import com.tyf.pojo.notes;
import com.tyf.service.NotesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.xml.crypto.Data;
import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
public class NoteController {
    @Autowired
    private NotesService notesService;

    @RequestMapping("/file/note")
    public String notes(notes notes) throws ParseException {
        String sqlPath = null;
        //定义文件保存的本地路径
        String localPath="D:\\File\\";
        MultipartFile multipartFile=notes.getFile();
        if(!notes.getFile().isEmpty()){
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



            }catch (IOException e){
                e.printStackTrace();
            }

        }
        notes.setImg(sqlPath);
        //日期转换
        DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        Date date=format1.parse(notes.getCdate());
        notes.setCreatedate(date);
        notesService.insertByNoteSid(notes);

        return "cmain";
    }
}
