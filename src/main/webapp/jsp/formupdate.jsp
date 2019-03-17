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
<form class="layui-form layui-form-pane" action="${ctx}/activity/update">
    <input type="hidden" name="cid" value="${activity.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">主题</label>
        <div class="layui-input-inline">
            <input type="text" name="title" lay-verify="required" value="${activity.title}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">地点</label>
        <div class="layui-input-inline">
            <input type="text" name="place" lay-verify="required"value="${activity.place}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">内容</label>
        <div class="layui-input-block">
            <input type="text" name="content" autocomplete="off" value="${activity.content}" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">经费</label>
        <div class="layui-input-inline">
            <input type="text" name="money" lay-verify="required" value="${activity.money}" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">赞助商</label>
        <div class="layui-input-inline">
            <input type="text" name="company" lay-verify="required" value="${activity.company}" autocomplete="off" class="layui-input">
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
