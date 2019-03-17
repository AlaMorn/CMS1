package com.tyf.service.Impl;

import com.tyf.mapper.LoginMapper;
import com.tyf.pojo.login;
import com.tyf.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("LoginService")
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;
    @Override
    public login selectUserByUsernameAndPassword(login login) {
        return loginMapper.selectUserByUsernameAndPassword(login);
    }
}
