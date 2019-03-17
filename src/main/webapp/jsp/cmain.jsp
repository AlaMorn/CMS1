<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/2/3
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>社团基本信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" type="text/css" href="${ctx}/static/layui/css/layui.css" media="all">
    <script src="${ctx}/static/layui/layui.js" charset="utf-8"></script>
    <link rel="stylesheet" type="text/css" href="${ctx}/static/css/index.css">
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-green">
        <div class="layui-logo layui-bg-green"><font class="indexp">CMS</font></div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right layui-bg-green">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${ctx}${User.img}" class="layui-nav-img">
                    ${User.name}
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="${ctx}/basicdata/${User.sid}/${User.power}">基本资料</a></dd>
                    <dd><a href="">密码修改</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-green">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree indeXBG"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">社团管理</a>
                    <dl class="layui-nav-child">
                        <dd>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">社团信息</a>
                    <dl class="layui-nav-child">

                        <dd><a href="${ctx}/survey/${User.sid}/${User.power}">社团概况</a></dd>
                        <dd><a href="${ctx}/fix/${User.sid}/${User.power}">社团档案管理</a></dd>
                        <dd><a href="javascript:;">留言板</a></dd>
                    </dl>
                </li>
                </dd>
                <dd>
                    <a href="${ctx}/members/${User.sid}/${User.power}">成员管理</a>
                </dd>
                <dd>
                    <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;">活动管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${ctx}/activitySub/${User.sid}/${User.power}">活动申请</a></dd>
                            <dd><a href="${ctx}/queryaty/${User.sid}/${User.power}">查看活动</a></dd>
                        </dl>
                    </li>
                </dd>
                <dd><a href="javascript:;">经费明细</a></dd>

                </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="${ctx}/MoP/${User.sid}/${User.power}">社长管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">活动审批</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body BodyBg">
        <!-- 内容主体区域 -->
        <c:if test="${page eq 'cinf'}" >
            <%--引入cinf页面--%>
            <jsp:include page="${ctx}/jsp/cinf.jsp" />
        </c:if>
        <c:if test="${page eq 'infModify'}" >
            <%--引入infModify页面--%>
            <jsp:include page="${ctx}/jsp/infModify.jsp" />
        </c:if>
        <c:if test="${page eq 'activity'}" >
            <%--引入activity页面--%>
            <jsp:include page="${ctx}/jsp/activity.jsp" />
        </c:if>
        <c:if test="${page eq 'queryaty'}" >
            <%--引入queryactivity页面--%>
            <jsp:include page="${ctx}/jsp/queryaty.jsp" />
        </c:if>
        <c:if test="${page eq 'Mmanagement'}" >
            <%--引入Mmanagement页面--%>
            <jsp:include page="${ctx}/jsp/Mmanagement.jsp" />
        </c:if>
        <c:if test="${page eq 'MoP' && power eq '1'}" >
            <%--引入MOP页面--%>
            <jsp:include page="${ctx}/jsp/MoP.jsp" />
        </c:if>
        <c:if test="${page eq 'BasicData' && power eq '2'}" >
            <%--引入MOP页面--%>
            <jsp:include page="${ctx}/jsp/BasicData.jsp" />
        </c:if>

    </div>
</div>
<div class="layui-footer">
    <!-- 底部固定区域 -->
    学生社团管理系统
</div>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
</body>
</html>

