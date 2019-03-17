package com.tyf.controller;

import com.tyf.pojo.*;
import com.tyf.service.MembersService;
import com.tyf.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MoPController {

    @Autowired
    private MembersService membersService;
    @Autowired
    private PeopleService peopleService;
    @RequestMapping("/Mop/table")
    @ResponseBody
    public ResultMap<List<members>> MopTable(Page page){
        int c=page.getPage();
        int limit=page.getLimit();
        page.setPage((c-1)*limit);
        List<members>list=membersService.AllSelect(page);
        int total=membersService.CountMembers();
        return new ResultMap<List<members>>("",list,0,total);
    }
    @RequestMapping(value = "/EchartsData",method = RequestMethod.POST)
    @ResponseBody
    public HashMap<String,Object> EchartsData(){
        List<String> LsKey=peopleService.selectSid("sid");
        HashMap<String,Object>map=new HashMap<>();
        List<Integer> LsValue=new ArrayList<>();
        for(String sid:LsKey) {
            System.out.println(sid);
            Integer num = peopleService.CountPeople(sid, null);
            LsValue.add(num);
        }
        map.put("sid",LsKey);
        map.put("num",LsValue);
        System.out.println(map);
        return map;
    }

}
