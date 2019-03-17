<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/2/19
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>关闭</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/login.css"/>
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/static/js/jquery-3.2.1.min.js" charset="utf-8"></script>
</head>
<body>
<script>


    layui.use(['element','form', 'layedit', 'laydate','laypage'], function(){
        var element = layui.element;
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        var laypage = layui.laypage;

        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);//关闭当前页
        // window.parent.location.replace(location.href)//刷新父级页面


    });
</script>

</body>
</html>
