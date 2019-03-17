<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/3/12
  Time: 13:46
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
<div style="width: 400px;height: 200px;margin: 0 auto;" >
    <div class="layui-upload">
        <button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
        <button type="button" class="layui-btn" id="test9">开始上传</button>
    </div>
</div>

</body>

<script>
    layui.use(['form','layer','upload'],function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var upload = layui.upload;


        form.render();
        //选完文件后不自动上传
        upload.render({
            elem: '#test8'
            ,url: '${ctx}/uploadIcon/${sid}'
            ,auto: false
            //,multiple: true
            ,bindAction: '#test9'
            ,done: function(res){
                console.log(res)
            }
        });


        // $("form").submit(function () {
        //
        //
        //     var index = parent.layer.getFrameIndex(window.name);
        //     parent.layer.close(index);//关闭当前页
        //     // window.parent.location.replace(location.href)//刷新父级页面
        //
        //
        // })
    });
</script>
</html>