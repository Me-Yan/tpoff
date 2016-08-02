<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/info.css">
</head>
<body>
    <!-- 基本信息 -->
    <div class="info">
        <div class="infoTitle">
            <span>基本信息</span>
        </div>
        <ul class="infoContent">
            <li class="left">
                <ul class="leftName">
                    <li>商品名称&nbsp;：&nbsp;&nbsp;&nbsp;</li>
                    <li>二级分类&nbsp;：&nbsp;&nbsp;&nbsp;</li>
                    <li>单价&nbsp;：&nbsp;&nbsp;&nbsp;</li>
                    <li>起订量&nbsp;：&nbsp;&nbsp;&nbsp;</li>
                    <li>计量单位&nbsp;：&nbsp;&nbsp;&nbsp;</li>
                </ul>
                <ul class="leftValue">
                    <li><span><s:property value="model.pname"/></span></li>
                    <li><s:property value="model.categorySecond.csname"/></li>
                    <li>￥<s:property value="model.price"/>/<s:property value="model.unit"/></li>
                    <li><s:property value="model.salecount"/></li>
                    <li><s:property value="model.unit"/></li>
                </ul>
                <div class="clearBoth"></div>
            </li>
            <li class="right">
                <ul>
                    <li>
                        <img src="<s:property value="model.pimg"/>" alt="">
                    </li>
                    <li>
                        <s:property value="model.function"/>
                    </li>
                </ul>
            </li>
            <div class="clearBoth"></div>
        </ul>
    </div>

    <div class="cleartBoth"></div>
    <!-- 图片展示 -->
    <div class="show">
        <div class="showTitle">
            <span>图片展示</span>
        </div>
        <ul class="showContent">
            <s:iterator var="s" value="showList">
                <li><img src="${pageContext.request.contextPath }/<s:property value="#s.pspath"/>" alt=""></li>
            </s:iterator>
        </ul>
    </div>

    <div class="clearBoth"></div>
    <!-- 商品详情 -->
    <div class="detail">
        <div class="detailTitle">
            <span>商品详情</span>
        </div>
        <ul class="detailContent">
            <s:iterator var="d" value="detailList">
	            <li>
	                <img src="${pageContext.request.contextPath }/<s:property value="#d.pdpath"/>" alt="">
	            </li>
            </s:iterator>
        </ul>
    </div>
</body>
</html>