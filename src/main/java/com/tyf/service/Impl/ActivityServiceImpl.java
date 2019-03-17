package com.tyf.service.Impl;

import com.tyf.mapper.ActivityMapper;
import com.tyf.pojo.Page;
import com.tyf.pojo.activity;
import com.tyf.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.InputStream;
import java.util.List;

@Service("ActivityService")
public class ActivityServiceImpl implements ActivityService {
    @Autowired
    private ActivityMapper activityMapper;
    @Override
    public boolean InsertActivity(activity activity) {

        return activityMapper.InsertActivity(activity);
    }


    @Override
    public List<activity> SelectByAtySid(Page page) {
        return activityMapper.SelectByAtySid(page);
    }

    @Override
    public boolean UpdateReplyByid(activity activity) {
        return activityMapper.UpdateReplyByid(activity);
    }

    @Override
    public activity selectByid(Integer id) {
        return activityMapper.selectByid(id);
    }

    @Override
    public Integer CountActivity(String sid,String reply) {
        return activityMapper.CountActivity(sid,reply);
    }
}
