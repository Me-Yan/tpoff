<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>二级分类</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/categorySecond.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/categorySecond.js"></script>
</head>
<body>
    <div class="title">
        <span>二级分类</span>
    </div>
    
    <s:if test="categoryList!=null">
		    <s:iterator var="c" value="categoryList">
			    <div class="list">
			        <div class="ha">
			            <div class="head">
			                <span><s:property value="#c.cname"/></span>
			            </div>
			            <a class="add">添加</a>
			            <div class="hid">
			               <form method="post">
				                <input type="text" name="csname" class="categorySecond"/>
				                <input type="hidden" name="category.cid" value="<s:property value="#c.cid"/>" class="category"/>
			                </form>
			                <a class="btn">确认</a>
			                <a class="merge">收起</a>
			            </div>
			            <div class="clearBoth"></div>
			        </div>          
			        <ul class="content">
			           <s:iterator var="cs" value="#c.categorySeconds">
				            <li>
				                <span><s:property value="#cs.csname"/></span>
				                <a class="delete">删除</a>
				                <a class="edit">编辑</a>
				                <div class="hid">
				                    <input type="hidden" name="csid" value="<s:property value="#cs.csid"/>" class="csid"/>
				                    <input type="text" name="csname" class="categorySecond">
				                    <input type="hidden" name="category.cid" value="<s:property value="#c.cid"/>"/>
				                    <a class="sBtn">确认</a>
				                    <a class="merge">收起</a>
				                </div>
				            </li>
			            </s:iterator>
		
			            <div class="clearBoth"></div>
			        </ul>
			    </div>
		    </s:iterator>
    </s:if>
    <s:else>
        <div style="width:100%;padding:50px;border-bottom:1px solid #555;text-align:center">请先参加一级分类，才能添加二级分类！</div>
    </s:else>
</body>
</html>