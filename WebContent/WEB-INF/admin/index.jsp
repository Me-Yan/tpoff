<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Me商城后台管理系统</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/index.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/index.js"></script>
</head>
<body>
    <div class="top">           
        <div class="user">
            <a href="javascript:void(0)"><i class="fa fa-user"></i><span><s:property value="#session.adminUser.name"/></span><i class="fa fa-chevron-down"></i></a>
            <ul class="userList">
                <li><a href="${pageContext.request.contextPath }/adminUser_editPwdPage.action" target="navFrame">修改密码</a></li>
                <li><a href="${pageContext.request.contextPath }/adminUser_logout.action">退出</a></li>
            </ul>
        </div>
        <a class="homePage" href="${pageContext.request.contextPath }/adminIndex_mainPage.action" target="navFrame">
            <i class="fa fa-home"></i>主页
        </a>    
    </div>

    <div class="center">
        <div class="left">
            <ul id="accordion" class="accordion">
                <li>
                    <div class="link"><i class="fa fa-paint-brush"></i>用户<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath }/adminUser_userPage.action" target="navFrame">用户列表</a></li>
                        <li><a href="${pageContext.request.contextPath }/adminUser_headImgPage.action" target="navFrame">头像列表</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link"><i class="fa fa-code"></i>商品<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath }/adminProduct_productPage.action" target="navFrame">上架商品</a></li>
                        <li><a href="${pageContext.request.contextPath }/adminProduct_addPage.action" target="navFrame">添加商品</a></li>
                        <li><a href="${pageContext.request.contextPath }/adminProduct_downPage.action" target="navFrame">下架商品</a></li>
                    </ul>
                </li>
                <li>
                    <div class="link"><i class="fa fa-mobile"></i>订单<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath }/adminOrder_orderPage.action" target="navFrame">订单列表</a></li>
                    </ul>
                </li>
                <li><div class="link"><i class="fa fa-globe"></i>轮播<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath }/adminSlide_slidePage.action" target="navFrame">轮播图列表</a></li>
                    </ul>
                </li>
                <li><div class="link"><i class="fa fa-globe"></i>分类<i class="fa fa-chevron-down"></i></div>
                    <ul class="submenu">
                        <li><a href="${pageContext.request.contextPath }/adminCategory_categoryPage.action" target="navFrame">一级分类</a></li>
                        <li><a href="${pageContext.request.contextPath }/adminCategorySecond_categorySecondPage.action" target="navFrame">二级分类</a></li>
                    </ul>
                </li>
            </ul>
        </div>

        <div class="right">
            <iframe id="navFrame" name="navFrame" src="${pageContext.request.contextPath }/adminIndex_mainPage.action" frameborder="0"></iframe>
        </div>
    </div>
</body>
</html>