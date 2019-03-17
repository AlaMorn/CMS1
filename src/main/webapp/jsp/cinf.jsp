
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

  <div class="layui-row layui-col-space15 indeXBG">
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">社团简介</div>
        <div class="layui-card-body">
        	<!--轮播图片-->
        <div class="layui-carousel" id="test1" lay-filter="test1">
  		<div carousel-item="">
            <div><img src="${ctx}${mainNotice.img1}" style="height: 280px;width: 600px"></div>
            <div><img src="${ctx}${mainNotice.img2}"  style="height: 280px;width: 600px"></div>
            <div><img src="${ctx}${mainNotice.img3}"  style="height: 280px;width: 600px"></div>
            <div><img src="${ctx}${mainNotice.img4}"  style="height: 280px;width: 600px"></div>
            <div><img src="${ctx}${mainNotice.img5}"  style="height: 280px;width: 600px"></div>

  		</div>
		</div>          
        </div>
        
        <div class="layui-card">
		<blockquote class="layui-elem-quote layui-quote-nm">
		<hr class="layui-bg-red">
  		${mainNotice.summary}
		</blockquote>
      	</div>
      	
        <div class="layui-card">
		<fieldset class="layui-elem-field">
  		<legend>主要成员介绍</legend>
  		<div class="layui-field-box">
    		<div class="layui-form">
        <table class="layui-table">
            <colgroup>
         <col width="150">
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
      <tr>
        <th>人物</th>
        <th>性别</th>
        <th>职位</th>
        <th>格言</th>
      </tr> 
    </thead>
    <tbody>
     <c:forEach var="li" items="${list1}">
         <tr>
             <td>${li.name}</td>
             <td>${li.gender}</td>
             <td>${li.position}</td>
             <td>${li.motto}</td>
         </tr>
     </c:forEach>
    </tbody>
  </table>
</div>
  		</div>
		</fieldset>
      	</div>
        
      </div>
    </div>
    <div class="layui-col-md6">
      <div class="layui-card">
        <div class="layui-card-header">社团事记</div>
        <div class="layui-card-body">
        <ul class="layui-timeline">
        	<!--从这里开始写json-->
            <c:forEach items="${list2}" var="lm">
                <li class="layui-timeline-item">
                    <i class="layui-icon layui-timeline-axis"></i>
                    <div class="layui-timeline-content layui-text">
                        <h3 class="layui-timeline-title">
                            <fmt:formatDate value="${lm.createdate}" pattern="yyyy-MM-dd" />
                        </h3>
                        <p class="pp">
                            ${lm.summary} <i class="layui-icon"></i>
                        </p>
                        <img src="${ctx}${lm.img}" style="width: 120px; height: 120px;">
                    </div>
                </li>
            </c:forEach>

  		
		</ul>  
        </div>
      </div>
    </div>
  </div>
<script>
//JavaScript代码区域
layui.use(['carousel', 'form'], function(){
  var carousel = layui.carousel
  ,form = layui.form;
  
  //常规轮播
  carousel.render({
    elem: '#test1'
    ,arrow: 'always'
  });
  
  //监听开关
  form.on('switch(autoplay)', function(){
    ins3.reload({
      autoplay: this.checked
    });
  });

  
  
});



</script>