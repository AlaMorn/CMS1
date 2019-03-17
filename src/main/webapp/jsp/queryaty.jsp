<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
        <!-- 内容主体区域 -->
        <%--<div class="site-demo-button" id="layerDemo" style="margin-bottom: 0;">--%>
        <%--<button data-method="notice" class="layui-btn">示范一个公告层</button>--%>
        <%--</div>--%>



	<table class="layui-hide" id="test" lay-filter="test"></table>
	<script type="text/html" id="barDemo">
  	<a class="layui-btn layui-btn-xs" lay-event="update">更新</a>
 	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="reply">回复</a>
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
    ,url:'${ctx}/activity/table/${sid}'
    ,title: '用户数据表'
    ,cols: [[
    		{field:'id', title:'id', width:80}
      ,{field:'sid', title:'社团', width:120}
      ,{field:'title', title:'主题', width:80}
      ,{field:'place', title:'地点', width:100}
      ,{field:'content', title:'内容'}
      ,{field:'money', title:'经费', width:80}
      ,{field:'company', title:'赞助商', width:120}
      ,{field:'submitdate', title:'提交日期', width:120,templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy-MM-dd')}}</div>"}
      ,{field:'reply', title:'回复', width:120}
      ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:150}
    ]]
      ,page:true
	  ,limit:1
      ,limits:[1,2,3]
  });
  
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    var id=data.id;
    //console.log(obj)
    if(obj.event === 'reply'){
		layer.open({
			type: 2,
			title: "回复",
			closeBtn: 1,
			shadeClose: true,

			content: ['${ctx}/formreply?id='+id,"no"],
			area:['20%', '20%']


		});


    }else if(obj.event === 'update'){
        layer.open({
            type: 2,
            title: "更新",
            closeBtn: 1,
            shadeClose: true,

            content: ['${ctx}/formupdate?id='+id],
            area:['50%', '50%']


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