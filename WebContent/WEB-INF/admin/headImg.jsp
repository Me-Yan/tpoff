<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户头像</title>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/jqthumb.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/headImg.css">
    <script>
        $(function(){
            $('img').jqthumb({
                width: 100,
                height: 100
            });

            $('.operate a').click(function(){
            	var that = this;
            	var uid = $(this).parent().next().text();
            	$.ajax({
           		  url: "${pageContext.request.contextPath}/adminUser_setDefaultHeadImg.action",
           		  type: "post",
           		  data: {uid:uid},
           		  success: function(data) {
	      				  $(that).parent().prev().fadeIn();
	      				  $(that).parent().prev().prev().find('.jqthumb').remove();
	      				  $(that).parent().prev().prev().find('img').attr('src', '${pageContext.request.contextPath}/'+data);
	      				  $(that).parent().prev().prev().find('img').jqthumb({width: 100, height: 100});
	      			      setTimeout(function(){
	      			           $(that).parent().prev().fadeOut();
   			         }, 2000);
           		  }
            	});
            	
            	
            });
            
        });
    </script>
</head>
<body>
    <ul>
        <s:if test="pageBean!=null">
	        <s:iterator var="u" value="pageBean.list">
		        <li class="yes">
		            <div class="imgContent"><img src="${pageContext.request.contextPath }/<s:property value="#u.upath"/>" alt=""></div>
		            <div class="tip">设置成功</div>
		            <s:if test="'images/headImg/headImg.png'.equals(#u.upath)">
		               <div class="operate"><span style="cursor:text">设置默认头像</span></div>
		            </s:if>
		            <s:else>
		               <div class="operate"><a>设置默认头像</a></div>
		            </s:else>
		            <span style="display:none"><s:property value="#u.uid"/></span>
		        </li>
	        </s:iterator>
        </s:if>
        <s:else>
            <li class="no" style="border-bottom: 1px solid #555;text-align:center;line-height:70px">
                <span>暂时没有任何用户注册！</span>
            </li>
        </s:else>
        <div class="clearBoth"></div>
    </ul>
    
    
    
    <div class="clearBoth"></div>
    <!-- 分页 -->
    <s:if test="pageBean!=null">
	    <div class="pagination">
	        <div class="pageInner">
	            <s:if test="pageBean.page!=1">
	                <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=1" class="first">首页</a>
	                <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
	            </s:if>
	            <s:else>
	                 <a href="javascript:void(0)" style="cursor: text" class="first">首页</a>
	                 <a href="javascript:void(0)" style="cursor: text" class="pre">上一页</a>
	            </s:else>
	            
	            <s:if test="pageBean.totalPage<=3">
	                <s:iterator begin="1" end="pageBean.totalPage" step="1" var="ps">
	                    <s:if test="#ps==pageBean.page">
	                        <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                    </s:if>
	                    <s:else>
	                        <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                    </s:else>
	                </s:iterator>
	            </s:if>
	            <s:elseif test="pageBean.totalPage>3">
	                <s:if test="pageBean.page==1 || pageBean.page==2">
	                    <s:iterator begin="1" end="3" step="1" var="ps">
	                        <s:if test="#ps==pageBean.page">
	                            <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                        </s:if>
	                        <s:else>
	                            <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                        </s:else>
	                    </s:iterator>
	                    &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                </s:if>
	                <s:elseif test="pageBean.page>2&&pageBean.page<pageBean.totalPage-1">
	                    &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                    <s:iterator begin="pageBean.page-1" end="pageBean.page+1" step="1" var="ps">
	                        <s:if test="#ps==pageBean.page">
	                            <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                        </s:if>
	                        <s:else>
	                            <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                        </s:else>
	                    </s:iterator>
	                    &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                </s:elseif>
	                <s:elseif test="pageBean.page==pageBean.totalPage || pageBean.page==pageBean.totalPage-1">
	                    &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                    <s:iterator begin="pageBean.totalPage-2" end="pageBean.totalPage" step="1" var="ps">
	                        <s:if test="#ps==pageBean.page">
	                            <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                        </s:if>
	                        <s:else>
	                            <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                        </s:else>
	                    </s:iterator>
	                </s:elseif>
	            </s:elseif>
	            
	            <s:if test="pageBean.totalPage!=page">
	                <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
	                <a href="${pageContext.request.contextPath }/adminUser_headImgPage.action?page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
	            </s:if>
	            <s:else>
	                 <a href="javascript:void(0)" style="cursor: text" class="next">下一页</a>
	                 <a href="javascript:void(0)" style="cursor: text" class="last">末页</a>
	            </s:else>
	        </div>
	    </div>
    </s:if>
    
</body>
</html>