<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="layui-inline">
    <input class="layui-input" name="name" id="name"  placeholder="请输入姓名" autocomplete="off">
</div>
<button class="layui-btn" id="reload" data-type="reload">搜索</button>
<table class="layui-hide" id="test" lay-filter="test"></table>
<script type="text/html" id="toolbarDemo">
    <div class="layui-btn-container" style="float: left">
        <button class="layui-btn layui-btn-sm" lay-event="addPeople">添加新成员</button>
    </div>

</script>
<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
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


            table.render({
            elem: '#test'
            ,id:'test'
            ,url:'${ctx}/Mmambers/table/${sid}'
            ,title: '成员表'
            ,toolbar: '#toolbarDemo'
            ,cols: [[
                {field:'id', title:'id', width:80}
                ,{field:'name', title:'姓名', width:120}
                ,{field:'gender', title:'性别', width:80}
                ,{field:'position', title:'职务', width:100}
                ,{field:'motto', title:'座右铭'}
                ,{field:'sid', title:'社团', width:80}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
            ]]
            ,page:true
            ,limit:1
            ,limits:[1,2,3]
        });
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
                        content: ['${ctx}/addPeople/${sid}'],
                        area:['50%', '50%']
                    });
                    break;

            };
        });

        var $ = layui.$, active = {
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


</body>
</html>