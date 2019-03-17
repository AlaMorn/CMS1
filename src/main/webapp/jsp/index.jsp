<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>登录</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/layui/css/layui.css" media="all">
        <link rel="stylesheet" type="text/css" href="${ctx}/static/css/login.css"/>
        <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
        <script src="${ctx}/static/js/jquery-3.2.1.min.js" charset="utf-8"></script>
    </head>
    <body>
    <div class="logindiv">
        <p class="loginp">学生社团管理系统</p>
        <form class="layui-form" action="${ctx}/clogin" lay-filter="example" method="post">
            <div class="layui-form-item">
                <label class="layui-form-label">账号</label>
                <div class="layui-input-block">
                    <input type="text" name="id" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input logintext">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-block">
                    <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input logintext">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">权限</label>
                <div class="layui-input-block">
                    <input type="radio" name="power" value="1" title="管理员" checked="">
                    <input type="radio" name="power" value="2" title="社团">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button id="bt" class="layui-btn layui-btn-normal layui-btn-radius loginbutton">登录</button>
                </div>
            </div>
        </form>
    </div>
    </body>
    <script>
        layui.use('form',function(){
            var form = layui.form;


            form.render();
        });





    </script>
</html>