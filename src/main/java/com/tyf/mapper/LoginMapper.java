package com.tyf.mapper;

import com.tyf.pojo.login;

import java.util.List;

public interface LoginMapper {
    login selectUserByUsernameAndPassword(login login);

}
