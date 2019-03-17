package com.tyf.service;

import com.tyf.pojo.Page;
import com.tyf.pojo.activity;

import java.util.List;

public interface ActivityService {
    public boolean InsertActivity(activity activity);
    public List<activity> SelectByAtySid(Page page);
    public boolean UpdateReplyByid(activity activity);
    public activity selectByid(Integer id);
    public Integer CountActivity(String sid,String reply);
}
