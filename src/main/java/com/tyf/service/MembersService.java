package com.tyf.service;

import com.tyf.pojo.Page;
import com.tyf.pojo.login;
import com.tyf.pojo.members;

import java.util.List;

public interface MembersService {
    public members selectById(String id);
    public  members selectBySid(String sid);
    public List<members> AllSelect(Page page);
    public Integer  CountMembers();
    public boolean UpdataImage(String img,String sid);

}
