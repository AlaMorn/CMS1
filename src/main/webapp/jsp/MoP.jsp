<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2019/2/24
  Time: 13:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script src="${ctx}/static/js/echarts.js" charset="utf-8"></script>
<div class="layui-row">
    <div class="layui-col-xs12 layui-col-md8">
        <div class="grid-demo grid-demo-bg1">
            <div class="layui-inline">
                <input class="layui-input" name="name" id="name"  placeholder="请输入姓名" autocomplete="off">
            </div>
            <button class="layui-btn" id="reload" data-type="reload">搜索</button>

            <table class="layui-hide" id="test" lay-filter="test"></table>
            <script type="text/html" id="toolbarDemo">
                <div class="layui-btn-container" style="float: left">
                    <button class="layui-btn layui-btn-sm" lay-event="addPeople">添加社长</button>
                </div>
            </script>
            <script type="text/html" id="barDemo">
                <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
            </script>

        </div>
    </div>
    <div class="layui-col-xs6 layui-col-md4">
        <div class="grid-demo" ></div>
    </div>
    <div class="layui-col-xs6 layui-col-md12">
        <div style="height: 50px"></div>
        <div id="main" style="width: 400px;height:400px;"></div>
    </div>
</div>
<script>

    layui.use(['element','form', 'layedit', 'laydate','laypage'], function(){
        var element = layui.element;
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;
        var laypage = layui.laypage;


    });

    layui.use('table', function(){

        var table = layui.table;
        var $ = layui.$;


            table.render({
            elem: '#test'
            ,id:'test'
            ,url:'${ctx}/Mop/table'
            ,title: '成员表'
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                {field:'id', title:'id', width:80}
                ,{field:'name', title:'姓名', width:120}
                ,{field:'gender', title:'性别', width:80}
                ,{field:'major', title:'专业', width:100}
                ,{field:'phone', title:'手机'}
                ,{field:'birthday', title:'生日', width:120,templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy-MM-dd')}}</div>"}
                ,{field:'sid', title:'社团', width:80}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page:true
            ,limit:1
            ,limits:[1,2,3]
                ,done: function(res, curr, count){
                    $.ajax({
                        method:'post',
                        url:'${ctx}/EchartsData',
                        dataType:'json',
                        success:function(data){
                            initChat(data);


                        }
                    });
                }

        });
        function initChat(data) {
            var myChart = echarts.init(document.getElementById('main'));
            var count = data.num;
            var name = data.sid;
            // 指定图表的配置项和数据
            var option = {
                title: {
                    text: '各社团成员数',
                    x: 'center'
                },
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    x: 'left',
                    data: name
                },
                toolbox: {
                    show: true,
                    feature: {
                        mark: {show: true},
                        dataView: {show: true, readOnly: false},
                        magicType: {
                            show: true,
                            type: ['pie', 'funnel'],
                            option: {
                                funnel: {
                                    x: '25%',
                                    width: '50%',
                                    funnelAlign: 'left',
                                    max: 1548
                                }
                            }
                        },
                        restore: {show: true},
                        saveAsImage: {show: true}
                    }
                },
                calculable: true,
                series: [
                    {
                        name: '成员数',
                        type: 'pie',
                        radius: '55%',
                        center: ['50%', '60%'],
                        data: (function () {
                            var arrNum = [];
                            for (var i=0;i<count.length;i++){
                                arrNum.push({"value": count[i],"name":name[i]});
                            }
                            return arrNum;
                        })(),
                    }
                ]
            };

            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        };
        //头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id);
            switch(obj.event){
                case 'addPeople':
                    layer.open({
                        type: 2,
                        title: "更新",
                        closeBtn: 1,
                        shadeClose: true,
                        content: ['${ctx}/addMember/${sid}'],
                        area:['50%', '50%']
                    });
                    break;

            };
        });

            var active = {
            reload: function(){
                var name = $('#name');
                //执行重载
                table.reload('test', {
                    method:'post'
                    ,page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {

                        name: name.val()
                    }
                });
            }
        };

        $('#reload').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });
        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            var id=data.id;
            //console.log(obj)
            if(obj.event === 'del'){
                layer.confirm('真的删除行么', function(index){
                    window.location.href="${ctx}/delPeople?id="+id;
                    layer.close(index);
                });


            }


        });
    });



    layui.use('form',function(){
        var form = layui.form;


        form.render();
    });

</script>


