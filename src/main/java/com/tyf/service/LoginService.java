package com.tyf.service;

import com.tyf.pojo.login;

import java.util.List;

public interface LoginService {
    public login selectUserByUsernameAndPassword(login login);
}
