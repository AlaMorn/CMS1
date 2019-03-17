package com.tyf.service.Impl;


import com.tyf.mapper.PeopleMapper;
import com.tyf.pojo.Page;
import com.tyf.pojo.people;
import com.tyf.service.PeopleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PeopleService")
public class PeopleServiceImpl implements PeopleService {

    @Autowired
    private PeopleMapper peopleMapper;
    @Override
    public List<people> selectBypeopleSid(String sid) {
        return peopleMapper.selectBypeopleSid(sid);
    }

    @Override
    public List<people> SelectByPeople(Page page) {
        return peopleMapper.SelectByPeople(page);
    }

    @Override
    public boolean insertBypeopleSid(people people) {
        return peopleMapper.insertBypeopleSid(people);
    }

    @Override
    public boolean deleteBypeopleId(Integer id) {
        return peopleMapper.deleteBypeopleId(id);
    }

    @Override
    public Integer CountPeople(String sid,String name) {
        return peopleMapper.CountPeople(sid,name);
    }

    @Override
    public List<String> selectSid(String str) {
        return peopleMapper.selectSid(str);
    }
}
