<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>评论</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/comment.css">
    <script>
        $(function(){
        	var deleteComment = "${deleteComment}";
        	if(deleteComment!=null&&deleteComment!="") {
        		alert(deleteComment);
        	}
        	
        	$('.delete').click(function(){
        		if(confirm("确定删除吗？")) {
        			return true;
        		}
        		return false;
        	});
        });
    </script>
</head>
<body>
    <div class="comment">
        <ul class="title">
            <li>#</li>
            <li>内容</li>
            <li>时间</li>
            <li>用户</li>
            <li>操作</li>
            <div class="clearBoth"></div>
        </ul>
        <ul class="content">
            <s:if test="pageBean.list!=null">
                <s:iterator var="c" value="pageBean.list" status="sIndex">
                    <li>
	                    <table>
	                        <tr>
	                            <td><s:property value="#sIndex.index+1"/></td>
	                            <td><s:property value="#c.content"/></td>
	                            <td><s:date name="#c.cdate" format="yyyy-MM-dd HH:MM:ss"/></td>
	                            <td><i class="fa fa-user fa-lg"></i><span><s:property value="#c.username"/></span></td>
	                            <td><a href="${pageContext.request.contextPath }/adminProduct_deleteComment.action?pcid=<s:property value="#c.pcid"/>&pid=<s:property value="#c.product.pid"/>" class="delete">删除</a></td>
	                        </tr>
	                    </table>
                    </li>
                </s:iterator>
            </s:if>
            <s:else>
                <li><span style="display:block;padding:40px 0px;text-align:center;" id="sComment">暂时没有任何评论！</span></li>
            </s:else>
        </ul>
    </div>
    
    <!-- 分页 -->
    <s:if test="pageBean!=null">
		    <div class="pagination">
		        <div class="pageInner">
		            <span>共有<s:property value="pageBean.totalCount"/>个记录</span>
		            <s:if test="pageBean.page!=1">
		                <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=1" class="first">首页</a>
		                <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
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
		                        <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
		                            <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
		                            <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
		                            <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
		                        </s:else>
		                    </s:iterator>
		                </s:elseif>
		            </s:elseif>
		            
		            <s:if test="pageBean.totalPage!=page">
		                <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
		                <a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="model.pid"/>&page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
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