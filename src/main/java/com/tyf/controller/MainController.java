package com.tyf.controller;

import com.tyf.pojo.*;
import com.tyf.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;

@Controller
public class MainController {


    @Autowired
    private PeopleService peopleService;
    @Autowired
    private MembersService membersService;
    @Autowired
    private NotesService notesService;
    @Autowired
    private NoticeService noticeService;
    @Autowired
    private ActivityService activityService;

    //cinf页面
    @RequestMapping(value = "/survey/{sid}/{power}")
    public String survey(@PathVariable String sid, Model model,@PathVariable String power){
        List<people> list1=peopleService.selectBypeopleSid(sid);
        MainNotice mainNotice =noticeService.selectByMainNoticeSid(sid);
        List<notes>  list2=notesService.selectByNoteSid(sid);
        model.addAttribute("power",power);
        model.addAttribute("list1",list1);
        model.addAttribute("mainNotice",mainNotice);
        model.addAttribute("list2",list2);
        model.addAttribute("page","cinf");
        return "cmain";
    }


    //baisicdata页面
    @RequestMapping("/basicdata/{sid}/{power}")
    public String basicdata(@PathVariable String sid, Model model,@PathVariable String power){
        members m1=membersService.selectBySid(sid);
        Integer total1=peopleService.CountPeople(sid,null);
        Integer total2=activityService.CountActivity(sid,"无回复");
        model.addAttribute("countP",total1);
        model.addAttribute("countA",total2);
        model.addAttribute("member",m1);
        model.addAttribute("power",power);
        model.addAttribute("sid",sid);
        model.addAttribute("page","BasicData");
        return "cmain";

    }

    //infmodefy页面
    @RequestMapping("/fix/{sid}/{power}")
    public String fix(@PathVariable String sid, Model model,@PathVariable String power){
        model.addAttribute("power",power);

        model.addAttribute("sid",sid);
        model.addAttribute("page","infModify");
        return "cmain";

    }


    //activity页面
    @RequestMapping("/activitySub/{sid}/{power}")
    public String activitySub(@PathVariable String sid, Model model,@PathVariable String power){
        model.addAttribute("power",power);

        model.addAttribute("sid",sid);
        model.addAttribute("page","activity");
        return "cmain";

    }

    //queryaty页面
    @RequestMapping("/queryaty/{sid}/{power}")
    public String activitySel(@PathVariable String sid, Model model,@PathVariable String power){
        model.addAttribute("power",power);

        model.addAttribute("sid",sid);
        model.addAttribute("page","queryaty");
        return "cmain";

    }


    //Mmanagement页面
    @RequestMapping("/members/{sid}/{power}")
    public String Members(@PathVariable String sid, Model model,@PathVariable String power){
        model.addAttribute("power",power);

        model.addAttribute("sid",sid);
        model.addAttribute("page","Mmanagement");
        return "cmain";

    }



    //MOP页面
    @RequestMapping("/MoP/{sid}/{power}")
    public String MoP(@PathVariable String sid, Model model,@PathVariable String power){
        model.addAttribute("power",power);

        model.addAttribute("sid",sid);
        model.addAttribute("page","MoP");
        return "cmain";

    }
}
