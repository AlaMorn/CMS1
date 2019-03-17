<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/2/20
  Time: 13:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/static/js/jquery-3.2.1.min.js" charset="utf-8"></script>
</head>
<body>
<form class="layui-form layui-form-pane" action="${ctx}/people/addForm">
    <input type="hidden" name="sid" value="${sid}">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="name" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-inline">
            <input type="text" name="gender" lay-verify="required"placeholder="请输入性别" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职务</label>
        <div class="layui-input-block">
            <input type="text" name="position" autocomplete="off" placeholder="请输入职务" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">座右铭</label>
        <div class="layui-input-inline">
            <input type="text" name="motto" lay-verify="required" placeholder="请输入座右铭" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
        </div>
    </div>

</form>
</body>
<script>
    layui.use(['form','layer'],function(){
        var form = layui.form;
        layer = layui.layer


        form.render();

        $("form").submit(function () {


            var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);//关闭当前页
            // window.parent.location.replace(location.href)//刷新父级页面


        })
    });

</script>
</html>
