<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>我的Me家-欢迎来到Me家商城</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/sameNav.js"></script>
</head>
<body>
    <%@ include file="top.jsp" %>
    
    <div class="center">
        <div class="home">
            <div class="route">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/recent.action">我的Me家</a>
            </div>
            <div class="left">
                <div class="title">
                    <a href="${pageContext.request.contextPath }/recent.action">我的Me家</a>
                </div>
                <div class="list">
                    <ul>
                        <li><a href="${pageContext.request.contextPath }/order_orderPage.action">我的订单</a></li>
                        <li><a href="${pageContext.request.contextPath }/collection_collectionPage.action">我的收藏</a></li>
                        <li><a href="${pageContext.request.contextPath }/user_userPage.action">个人资料</a></li>
                        <li><a href="${pageContext.request.contextPath }/user_safetyPage.action">安全中心</a></li>
                        <li><a href="${pageContext.request.contextPath }/address_addrPage.action">地址管理</a></li>
                    </ul>
                </div>
            </div>
            <div class="right">
                <div class="recentOrder">
                    <div class="orderName">
                        最近订单
                    </div>
                    <s:if test="oBean!=null">
                        <div class="orderContent">
	                        <div class="orderTitle">
	                            <span class="orderGoods">订单商品</span>
	                            <span class="orderPrice">单价</span>
	                            <span class="orderCost">数量</span>
	                            <span class="orderDate">总金额</span>
	                            <span class="orderStatus">状态</span>
	                        </div>
	                        <div class="productOrder">
	                        
	                            <s:iterator var="o" value="oBean.list">
		                            <table class="orderInfo">
		                                <tr class="info">
		                                    <td colspan="3"><span><s:date name="#o.odate" format="yyyy-MM-dd HH:mm:ss"/></span>订单号：<s:property value="#o.number"/></td>
		                                </tr>
		                                
		                                <tr class="productList">
		                                    <td class="proInfo">
		                                       <s:iterator var="om" value="#o.orderItems">
		                                            <div class="product">
		                                                <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#om.product.pid"/>" class="proImg"><img src="${pageContext.request.contextPath }/<s:property value="#om.product.pimg"/>" alt=""></a>
		                                                <span class="proName"><a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#om.product.pid"/>"><s:property value="#om.product.pname"/></a></span>
		                                                <span class="proPrice">￥<s:property value="#om.product.price"/>/<s:property value="#om.product.unit"/></span>
		                                                <span class="proCount"><s:property value="#om.subcount"/></span>
		                                                <div class="clearBoth"></div>
		                                            </div>
		                                       </s:iterator>
		                                    </td>
		    
		                                    <td class="proTotal">
		                                        ￥<span><s:property value="#o.total"/></span>
		                                    </td>
		                                    <td class="proStatus">
		                                      <s:if test="#o.state==0">已取消</s:if>
		                                      <s:elseif test="#o.state==1">未付款</s:elseif>
		                                      <s:elseif test="#o.state==2">等待发货</s:elseif>
		                                      <s:elseif test="#o.state==3">等待收货</s:elseif>
		                                      <s:elseif test="#o.state==4">交易成功</s:elseif>
		                                    </td>
		                                </tr>
		                            </table>    
		                        </s:iterator>
	                            
	                            
	                        </div>
                        </div>
                   </s:if>
                   <s:else>
                      <div class="orderContent" style="height:150px;line-height:150px;text-align:center">目前没有任何订单！</div>
                   </s:else>
                </div>
                <div class="recentCollection">
                    <div class="collectionName">
                        最近收藏
                    </div>
                    <s:if test="cBean!=null">
	                    <div class="colContent">
	                        <div class="colTitle">
	                            <span class="colGoods">商品</span>
	                            <span class="cPrice">单价</span>
	                            <span class="cDate">收藏日期</span>
	                        </div>
	                        <div class="productCol">
	                        
	                            <s:iterator var="c" value="cBean.list">
		                            <div class="colList">
		                                <div class="colInfo">
		                                    <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#c.product.pid"/>" class="colImg"><img src="${pageContext.request.contextPath }/<s:property value="#c.product.pimg"/>" alt=""></a>
		                                    <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#c.product.pid"/>" class="colName"><s:property value="#c.product.pname"/></a>
		                                    <div class="clearBoth"></div>
		                                </div>
		                                <div class="colPrice">
		                                    ￥<span><s:property value="#c.product.price"/></span>/<s:property value="#c.product.unit"/>
		                                </div>
		                                <div class="colDate">
		                                   <s:date name="#c.coldate" format="yyyy-MM-dd"/>
		                                </div>
		                                <div class="clearBoth"></div>
		                            </div>
		                       </s:iterator>        
		                            
	                        </div>
	                    </div>
                    </s:if>
                    <s:else>
                        <div class="colContent" style="height:150px;line-height:150px;text-align:center">目前没有收藏任何商品！</div>
                    </s:else>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
        <div class="clearBoth"></div>
    </div>
    
    
    <%@ include file="bottom.jsp" %>
    
</body>
</html>