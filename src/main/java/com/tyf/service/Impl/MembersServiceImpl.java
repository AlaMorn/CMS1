package com.tyf.service.Impl;

import com.tyf.mapper.MembersMapper;
import com.tyf.pojo.Page;
import com.tyf.pojo.members;
import com.tyf.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("MembersService")
public class MembersServiceImpl implements MembersService {

    @Autowired
    private MembersMapper membersMapper;
    @Override
    public members selectById(String id) {
        return membersMapper.selectById(id);
    }

    @Override
    public members selectBySid(String sid) {
        return membersMapper.selectBySid(sid);
    }

    @Override
    public List<members> AllSelect(Page page) {
        return membersMapper.AllSelect(page);
    }

    @Override
    public Integer CountMembers() {
        return membersMapper.CountMembers();
    }

    @Override
    public boolean UpdataImage(String img, String sid) {
        return membersMapper.UpdataImage(img,sid);
    }
}
