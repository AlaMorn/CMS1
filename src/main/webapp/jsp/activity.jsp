<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

        <!-- 内容主体区域 -->
<div class="layui-col-md12">
      <div class="layui-card">
        <div class="layui-card-body">
         <div class="carddiv">
          	<form class="layui-form" action="${ctx}/activity/submit" lay-filter="example">
                <input type="hidden" name="sid" value="${sid}">
  			<div class="layui-form-item">
        <label class="layui-form-label">主题</label>
    <div class="layui-input-inline">
      <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入主题" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">地点</label>
    <div class="layui-input-inline">
      <input type="text" name="place" placeholder="请输入地点" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">具体内容</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入具体内容" class="layui-textarea" name="content"></textarea>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">活动经费（元）</label>
    <div class="layui-input-inline">
      <input type="text" name="money" placeholder="请输入经费" autocomplete="off" class="layui-input">
    </div>
  </div>
  
     <div class="layui-form-item">
    <label class="layui-form-label">赞助商</label>
    <div class="layui-input-inline">
      <input type="text" name="company" placeholder="请输入赞助商" autocomplete="off" class="layui-input">
    </div>
  </div>
  
 
 
 
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
    </div>
  </div>
</form>
          	
         </div>
        </div>
      </div>
</div>
<script>
    //JavaScript代码区域
    layui.use(['element','form', 'layedit', 'laydate'], function(){
        var element = layui.element;
        var form = layui.form
  		,layer = layui.layer
  		,layedit = layui.layedit
  		,laydate = layui.laydate;
  		
  		
    });
</script>
</body>
</html>