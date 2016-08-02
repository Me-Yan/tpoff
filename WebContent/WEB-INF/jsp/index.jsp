<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>首页-欢迎来到Me家</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/top.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/fontAwesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">     
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/slideImg/css/slide.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/slideImg/js/slide.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/scrollTop/jquery.toTop.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/plugins/scrollTop/jquery.toTop.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/index.js"></script>
	<style type="text/css">
	    .ck-slide { width: 100%; height: 342px; margin: 0 auto;}
	    .ck-slide ul.ck-slide-wrapper { height: 342px;}
	</style>
</head>
<body>

    <%@ include file="top.jsp" %>

    <!--左右切换图片-->
    <div class="ck-slide">
        <ul class="ck-slide-wrapper">
            <s:iterator var="s" value="slist">
                <s:if test="#s.flag==1">
                    <li style="display:none"><a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#s.product.pid"/>"><img src="${pageContext.request.contextPath }/<s:property value="#s.spath"/>" alt=""></a></li>
                </s:if>
            </s:iterator>
        </ul>
        <div class="ck-slidebox">
            <div class="slideWrap">
                <div class="dot-wrap">
                    <ul>
                        <li class="current"><em>1</em></li>
                        <li><em>2</em></li>
                        <li><em>3</em></li>
                        <li><em>4</em></li>
                        <li><em>5</em></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    
    <!--具体分类-->
    <div class="bodyfloor">
        <s:iterator var="pl" value="plist" status="sindex">
	        <div class="bodyfloor1">
                <div class="leftTop">
                    <span class="topTitle"><s:property value="clist[#sindex.index].cname"/></span>
                    <span class="bottomMore"><a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="clist[#sindex.index].cid"/>&page=1&style=pdate&sort=desc">更多&gt;&gt;</a></span>
                </div>
	            <div class="floorRight">
	            
	               <s:iterator var="p" value="#pl">
		                <div class="rightImg">
		                    <a target="_blank" href="${pageContext.request.contextPath}/product_findByPid.action?pid=<s:property value="#p.pid"/>">
		                        <img src="${pageContext.request.contextPath}/<s:property value="#p.pimg"/>" alt="">
		                    </a>
		                    <div class="rightIntroduce">
		                        <p>
		                            <s:property value="#p.pname"/>
		                        </p>
		                        <p style="color:#e14041">
		                            ￥<s:property value="#p.price"/>/<s:property value="#p.unit"/>
		                        </p>
		                    </div>
		                </div>
	                </s:iterator>	                
	            </div>
	       </div>
	       <div class="clearBoth"></div>
        </s:iterator>        
    </div>
    <div class="clearBoth"></div>

    <%@ include file="bottom.jsp" %>

    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script>
        <!--幻灯片-->
        $('.ck-slide').ckSlide({
            autoPlay: true
        });

        <!--回到顶部-->
        $('.to-top').toTop();

        
    </script>
</body>
</html>