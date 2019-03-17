<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/2/19
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>申请</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <script src="${ctx}/static/js/jquery-3.2.1.min.js" charset="utf-8"></script>
</head>
<body>
<div style="width: 500px;height: 200px;margin: 0 auto;" >
    <form class="layui-form" action="${ctx}/activity/reply">
        <input type="hidden" name="cid" value="${id}">
        <div class="layui-form-item">
            <label class="layui-form-label">回复</label>
            <div class="layui-input-block">
                <input type="radio" name="reply" value="同意" title="同意" checked="">
                <input type="radio" name="reply" value="拒绝" title="拒绝">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button id="bt" onclick="javascript:window.close();" class="layui-btn layui-btn-normal layui-btn-radius loginbutton">提交</button>
            </div>
        </div>
    </form>
</div>

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
