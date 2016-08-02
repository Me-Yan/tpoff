<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>我的购物车-欢迎来到Me商城</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/cart.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/cart.js"></script>
</head>
<body>
    <div class="header">
        <!--头部 链接导向栏-->
        <div class="headerTop">
            <div class="headerNav">
	            <div class="topNav">
	                <div class="topNavWel"><span>欢迎来到Me家！</span></div>
	                <ul class="topNavLogin">
	                    <s:if test="#session.user==null">
		                    <li><a href="${pageContext.request.contextPath }/user_loginPage.action" class="topNavLoginLiA">登录</a></li>
		                    <li><a href="${pageContext.request.contextPath }/user_registerPage.action">注册</a></li>
	                    </s:if>
	                    <s:else>
	                        <li><a href="${pageContext.request.contextPath }/recent.action" class="topNavLoginLiA"><s:property value="#session.user.username"/></a></li>
	                        <li><a href="${pageContext.request.contextPath }/user_logout.action">退出</a></li>                    
	                    </s:else>
	                </ul>
	                <ul class="topNavEntry">
	                    <li class="topNavEntryA"><a href="${pageContext.request.contextPath }/order_orderPage.action">我的订单</a></li>
	                    <li class="topNavEntryA"><a href="${pageContext.request.contextPath }/collection_collectionPage.action">我的收藏</a></li>
	                    <li><a href="">帮助中心</a>&nbsp;<i class="fa fa-angle-down fa-lg"></i></li>
	                </ul>
	            </div>
            </div>
            <!--购物车状态栏-->
            <div class="status">
                <a href="${pageContext.request.contextPath }/index.action" class="logo"><img src="${pageContext.request.contextPath }/images/system/logo.png" alt=""></a>
                <span class="cartImg"><img src="${pageContext.request.contextPath }/images/system/one.png" alt=""></span>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
    


    <!--主要部分-->
    <div class="center">
        <div class="cart">
        <div class="title">购物车 </div>
        <s:if test="cart!=null&&cart.cartItems!=null&&cart.cartItems.size()>0">
	         <div class="details">
	             <div class="topTitle">
	                 <span class="goods">商品</span>
	                 <span class="price">单价(元)</span>
	                 <span class="number">数量</span>
	                 <span class="total">小计(元)</span>
	                 <span class="operate">操作</span>
	             </div>
	             <s:iterator var="c" value="cart.cartItems">
		              <div class="productList">
		                  <div class="proImg">
		                      <img src="${pageContext.request.contextPath }/<s:property value="#c.product.pimg"/>" alt="">
		                  </div>
		                  <div class="proName">
		                      <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#c.product.pid"/>"><s:property value="#c.product.pname"/></a>
		                  </div>
		                  <div class="proPrice">
		                      <s:property value="#c.product.price"/>
		                  </div>
		                  <div class="proNumber">
		                      <a class="less fa fa-minus fa-0.1x" href="javascript:void(0)"></a>
		                      <input type="text" class="countInput" name="count" value="<s:property value="#c.subcount"/>">
		                      <a class="add fa fa-plus" href="javascript:void(0)"></a>
		                      <span class="dw"><s:property value="#c.product.unit"/></span>
		                      <span class="qd" style="display:none"><s:property value="#c.product.least"/></span>
		                      <span class="buy" style="display:none"><s:property value="#c.subcount"/></span>
		                      <span class="pid" style="display:none"><s:property value="#c.product.pid"/></span>
		                  </div>
		                  <div class="proTotal">
		                      <s:property value="#c.subtotal"/>
		                  </div>
		                  <div class="proOperate">
		                      <a class="delBtn" href="${pageContext.request.contextPath }/cart_deleteProductFromCart.action?pid=<s:property value="#c.product.pid"/>">删除</a>
		                  </div>
		              </div>                    
	             </s:iterator>
	             <div class="clearBoth"></div>
	         </div>
	         <div class="conCart">
	            <div class="conRight">
	                <span class="subtotal">总计：<span><s:property value="cart.total"/></span>元</span>
	                <span class="conClick"><a href="${pageContext.request.contextPath }/order_orderFormPage.action">结算</a></span>
	            </div>
             </div>
        </s:if>
        <s:else>
            <div class="detailNull">
                <span>购物车内暂时没有任何商品！<a href="${pageContext.request.contextPath }/index.action">继续购物</a></span>
            </div>
        </s:else>  
        </div>
    </div>

    
    <div class="clearBoth"></div>
    <div class="footer">
        <!--关于我们-->
        <div class="aboutUs">
            <ul>
                <li class="fi"><a href="">关于我们</a></li>
                <li class="fi"><a href="">法律声明</a></li>
                <li class="fi"><a href="">服务协议</a></li>
                <li><a href="">隐私声明</a></li>
            </ul>
            <p>
                Copyright©Me家版权所有,违者必究
            </p>
        </div>
    </div>


    <div class="rotate"><i class="fa fa-spinner fa-pulse fa-3x"></i></div>



    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script type="text/javascript">
        <!--回到顶部-->
        $('.to-top').toTop();
    </script>
</body>
</html>