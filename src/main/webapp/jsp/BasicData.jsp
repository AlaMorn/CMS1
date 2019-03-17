<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/3/6
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="layui-row">
        <div class="grid-demo">
            <fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
                <legend>我的资料</legend>
            </fieldset>
            <div style="padding: 20px; background-color: #F2F2F2;">
                <div class="layui-row layui-col-space15">
                    <div class="layui-col-md2">
                        <div class="layui-card">
                            <div class="layui-card-header">头像</div>
                            <div class="layui-card-body">
                                <style>
                                    .acion{


                                        height: 120px;
                                        width: 120px;
                                        position: absolute;
                                        top: 10px;
                                        left: 15px;
                                        text-align: center;
                                        line-height:120px;
                                        background:rgba(30,144 ,255,0.7);
                                        z-index: 100;
                                        opacity: 0;

                                    }
                                    .acion:hover{
                                        opacity: 1;
                                    }
                                </style>
                                <img src="${ctx}/static/image/1.jpg" style="height: 120px;width: 120px">
                                <div id="acion" class="acion"><a href="#">修改图片</a></div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <div class="layui-card">
                            <div class="layui-card-header">基本信息</div>
                            <div class="layui-card-body">
                                <p style="margin-bottom: 5px"><span class="layui-badge layui-bg-orange" >姓名:</span>${member.name}</p>
                                <p style="margin-bottom: 5px"><span class="layui-badge layui-bg-blue">性别:</span>${member.gender}</p>
                                <p style="margin-bottom: 5px"><span class="layui-badge layui-bg-black">专业:</span>${member.major}</p>
                                <p style="margin-bottom: 5px"><span class="layui-badge layui-bg-cyan">生日:</span> <fmt:formatDate value="${member.birthday}" pattern="yyyy-MM-dd" /></p>
                                <p style="margin-bottom: 5px"><span class="layui-badge layui-bg-gray">手机:</span>${member.phone}</p>
                                <p style="margin-bottom: 5px"><span class="layui-badge layui-bg-cyan">社团:</span>${member.sid}</p>
                            </div>
                        </div>
                    </div>
                    <div class="layui-col-md5">
                        <div class="layui-card">
                            <div class="layui-card-header">统计信息</div>
                            <div class="layui-card-body">
                               <P>社团人数：${countP}人</P>
                                <p>未回复申请数：${countA}个</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate','element','jquery'], function() {
        var form = layui.form,
            layer = layui.layer,
            element=layui.element,
            $=layui.jquery;
        $(document).on('click','#acion',function(){
            layer.open({
                type: 2,
                title: "修改图片",
                closeBtn: 1,
                shadeClose: true,

                content: ['${ctx}/modifyIcon/${sid}',"no"],
                area:['30%', '30%']


            });
        });
    });
</script>