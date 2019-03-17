package com.tyf.controller;

import com.tyf.pojo.Page;
import com.tyf.pojo.ResultMap;
import com.tyf.pojo.activity;
import com.tyf.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ActivityController {


    @Autowired
    private ActivityService activityService;

    @RequestMapping("/activity/submit")
    public String atysubmit(activity activity, Model model) throws ParseException {
        activity.setReply("无回复");
        SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
        String sdate=format1.format(new Date());
        activity.setSubmit(sdate);
        Date date=format1.parse(sdate);
        activity.setSubmitdate(date);
        boolean flag=activityService.InsertActivity(activity);
        //判断
        return "cmain";

    }

    @RequestMapping("/activity/table/{sid}")

    @ResponseBody
    public ResultMap<List<activity>> table(@PathVariable String sid, @RequestParam(value = "page")Integer page,@RequestParam("limit")Integer limit){
        Page page1=new Page();
        page1.setPage((page-1)*limit);
        page1.setLimit(limit);
        page1.setSid(sid);
        List<activity>list=activityService.SelectByAtySid(page1);



       System.out.println(page);

        return new ResultMap<List<activity>>("",list,0,4);
    }


    @RequestMapping("/activity/reply")
    public String reply(activity activity){
        int id1=Integer.valueOf(activity.getCid());
        activity.setId(id1);
        activityService.UpdateReplyByid(activity);

        return "close";
    }

    @RequestMapping("/formreply")
    public String formrely(@RequestParam("id") Integer id,Model model){
        model.addAttribute("id",id);
        System.out.println(id);
        return "formreply";
    }


    @RequestMapping("/formupdate")
    public String formupdate(@RequestParam("id")Integer id,Model model){
        activity activity=activityService.selectByid(id);
        model.addAttribute("activity",activity);

        return "formupdate";
    }
    @RequestMapping("/activity/update")
    public String update(activity activity){
        int id1=Integer.valueOf(activity.getCid());
        activity.setId(id1);
        activityService.UpdateReplyByid(activity);
        return "close";
    }


}
