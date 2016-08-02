<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>一级分类</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/category.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/category.js"></script>
    <script>
         $(function(){
        	 var content = "${content}";
        	 
        	 if(content=="1") {
        		 alert("一级分类最多为9个！");
        	 } else if(content=="2") {
        		 alert("添加成功！");
        	 }
         });
    </script>
</head>
<body>
    <div class="title">
        <span>一级分类</span>
    </div>
    <div class="head">
        <a class="add">添加</a>
        <div class="hid">
            <form action="${pageContext.request.contextPath }/adminCategory_categoryAdd.action" method="post">
	            <input type="text" name="cname" class="category">
	            <a class="btn">确认</a>
	            <a class="merge">收起</a>
            </form>
        </div>
        <div class="clearBoth"></div>
    </div>
    <ul class="content">
        <s:iterator var="c" value="categoryList">
	        <li>
	            <span><s:property value="#c.cname"/></span>
	            <a class="delete">删除</a>
	            <a class="edit">编辑</a>
	            <div class="hid">
	                <input type="hidden" name="cid" value="<s:property value="#c.cid"/>" class="cid"/>
	                <input type="text" name="cname" class="category">
	                <a class="sBtn">确认</a>
	                <a class="merge">收起</a>
	            </div>
	        </li>
        </s:iterator>

        <div class="clearBoth"></div>
    </ul>
</body>
</html>