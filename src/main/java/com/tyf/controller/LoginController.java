package com.tyf.controller;

import com.tyf.pojo.login;
import com.tyf.pojo.members;
import com.tyf.service.LoginService;
import com.tyf.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;


@Controller
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private MembersService membersService;


    @RequestMapping("/clogin")
    public String login(login login, HttpSession session ){
        login l = loginService.selectUserByUsernameAndPassword(login);
        if(l != null) {
           members k= membersService.selectById(l.getId());
            session.setAttribute("User",k);

            return "cmain";
        }
        else return "index";

    }


}
