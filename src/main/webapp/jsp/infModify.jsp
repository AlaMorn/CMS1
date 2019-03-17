<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
	  <div class="layui-row layui-col-space15 indeXBG">
		  <!--上传图片-->
		  <div class="layui-col-md12">
			  <div class="layui-card">
				  <div class="layui-card-body">
					  <form action="${ctx}/file/upload" method="post" enctype="multipart/form-data">
						  <input type="hidden"  name="sid" value="${sid}" />
						  <label>上传公告1：</label><input type="file" name="file[0]"><br>
						  <hr class="layui-bg-blue">
						  <label>上传公告2：</label><input type="file" name="file[1]"><br>
						  <hr class="layui-bg-blue">
						  <label>上传公告3：</label><input type="file" name="file[2]"><br>
						  <hr class="layui-bg-blue">
						  <label>上传公告4：</label><input type="file" name="file[3]"><br>
						  <hr class="layui-bg-blue">
						  <label>上传公告5：</label><input type="file" name="file[4]"><br>
						  <hr class="layui-bg-blue">
						  <div class="layui-form-item layui-form-text">
							  <label class="layui-form-label">社团简介修改</label>
							  <div class="layui-input-block">
								  <textarea placeholder="请输入内容" class="layui-textarea" name="summary"></textarea>
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
 		
 		<!--事记修改-->
 		<div class="layui-col-md12">
      	<div class="layui-card">
        <div class="layui-card-body">
        <fieldset class="layui-elem-field layui-field-title">
  		<legend>事记修改</legend>
		</fieldset>
 		<form class="layui-form" action="${ctx}/file/note"  method="post" enctype="multipart/form-data">
			<input type="hidden"  name="sid" value="${sid}" />
 			<div class="layui-form">
  			<div class="layui-form-item">
    		<div class="layui-inline">
      		<label class="layui-form-label">日期</label>
      		<div class="layui-input-inline">
        	<input type="text" class="layui-input" name="cdate"  id="createdate" placeholder="yyyy-MM-dd" />
      		</div>
    		</div>
    		</div>
    		
    		<div class="layui-form-item layui-form-text">
    		<label class="layui-form-label">主要事迹</label>
    		<div class="layui-input-block">
      		<textarea placeholder="请输入内容" class="layui-textarea" name="summary"></textarea>
    		</div>
  			</div>
    		
    		<!--上传图片-->
    		<div class="layui-form-item">
    		<div class="layui-input-block">
 			<label>上传图片：</label><input type="file" name="file"><br>
 			</div>
    		</div>
    		<div class="layui-form-item">
    		<div class="layui-input-block">
      		<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
    		</div>
 			</div>
    		</div>
			</form>
 		
        </div>
      </div>
    </div>
        </div>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
});



layui.use('laydate', function(){
  var laydate = layui.laydate;

  //常规用法
  laydate.render({
    elem: '#createdate'
  });
 });

  
  
  
    
  
</script>
	</body>
</html>
