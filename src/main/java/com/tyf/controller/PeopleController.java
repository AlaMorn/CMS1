package com.tyf.controller;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.tyf.mapper.PeopleMapper;
import com.tyf.pojo.Page;
import com.tyf.pojo.ResultMap;
import com.tyf.pojo.people;
import com.tyf.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class PeopleController {


    @Autowired
    private PeopleService peopleService;
    @RequestMapping("/Mmambers/table/{sid}")
    @ResponseBody
    public ResultMap<List<people>> table(@PathVariable String sid, Page page){
        int c=page.getPage();
        int limit=page.getLimit();
        page.setSid(sid);
        System.out.println(page.getName());
        page.setPage((c-1)*limit);
        List<people>list=peopleService.SelectByPeople(page);
        int total=peopleService.CountPeople(sid,page.getName());
        return new ResultMap<List<people>>("",list,0,total);
    }



    @RequestMapping("/addPeople/{sid}")
    public String addPeople(@PathVariable String sid, Model model){
        model.addAttribute("sid",sid);

        return "addPeople";
    }






    @RequestMapping("/people/addForm")
    public String addForm(people people){
        peopleService.insertBypeopleSid(people);
        return"close";
    }




    @RequestMapping("/delPeople")
    public String delPeople(@RequestParam("id") Integer id){
        peopleService.deleteBypeopleId(id);
        return "cmain";

    }
}
