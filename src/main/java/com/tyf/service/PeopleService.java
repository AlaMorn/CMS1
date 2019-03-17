package com.tyf.service;

import com.sun.javafx.logging.PulseLogger;
import com.tyf.pojo.Page;
import com.tyf.pojo.people;

import java.util.List;

public interface PeopleService {

    public List<people> selectBypeopleSid(String sid);
    public List<people> SelectByPeople(Page page);
    public boolean insertBypeopleSid(people people);
    public boolean deleteBypeopleId(Integer id);
    public Integer  CountPeople(String sid,String name);
    public List<String>selectSid(String str);

}
