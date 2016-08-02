<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>完善订单-欢迎来到Me商城</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/orderForm.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/orderForm.js"></script>
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
                <span class="cartImg"><img src="${pageContext.request.contextPath }/images/system/two.png" alt=""></span>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
    

    <!--遮罩层-->
    <div class="mask"></div>

    <!--添加地址-->
    <div class="addPop">
        <div class="popTitle">
            添加地址
        </div>

        <div class="popup">
            <form action="${pageContext.request.contextPath }/cart_addAddr.action" method="get" id="addressForm">
                <p class="popReceiver">
                    <span>&nbsp;&nbsp;&nbsp;收货人：</span><input type="text" name="receiver">
                </p>
                <p class="popPhone">
                    <span>联系电话：<input type="text" name="phone"></span>
                </p>
                <p class="popAddr">
                    <span>收货地址：<input type="text" name="addr"></span>
                </p>
                <p class="popEdit">
                    <a>保存</a>
                </p>
            </form>
        </div>
        <!--关闭按钮-->
        <a class="fa fa-close fa-2x close"></a>
    </div>




    <!--中间详细内容-->
    <div class="center">
        <div class="orderForm">
            <div class="title">
                完善并核对订单信息
            </div>
            <div class="addAddr">
                <a>添加新地址</a>
            </div>
            <form action="${pageContext.request.contextPath }/order_submitOrder.action" class="order" name="orderForm" id="orderForm">          
                <div class="address">
                    <div class="addrList">
                        <div class="choose">
                            选择地址
                        </div>
                        <div class="clearBoth"></div>
                        <s:iterator var="a" value="alist">
                            <s:if test="#a.state==1">
		                        <div class="list chooseList">
		                            <ul>
		                                <li class="user"><span class="name"><s:property value="#a.receiver"/></span><span class="phone"><s:property value="#a.phone"/></span></li>
		                                <li class="addr"><s:property value="#a.addr"/></li>
		                            </ul>
	                                   <input type="hidden" name="aid" value="<s:property value="#a.aid"/>">
		                        </div>
	                       </s:if>
	                       <s:else>
	                            <div class="list">
                                    <ul>
                                        <li class="user"><span class="name"><s:property value="#a.receiver"/></span><span class="phone"><s:property value="#a.phone"/></span></li>
                                        <li class="addr"><s:property value="#a.addr"/></li>
                                    </ul>
                                    <input type="hidden" name="aid" value="<s:property value="#a.aid"/>" disabled="disabled">
                                </div>
	                       </s:else>
	                    </s:iterator>         
                        <div class="clearBoth"></div>               
                    </div>
                </div>



                <!--具体商品内容-->
                <div class="details">
                    <div class="topTitle">
                        <span class="goods">商品</span>
                        <span class="price">单价(元)</span>
                        <span class="number">数量</span>
                        <span class="total">小计(元)</span>
                    </div>
                    <s:iterator var="cm" value="cart.cartItems">
	                    <div class="productList">
	                        <div class="proImg">
	                            <img src="${pageContext.request.contextPath }/<s:property value="#cm.product.pimg"/>" alt="">
	                        </div>
	                        <div class="proName">
	                            <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#cm.product.pid"/>"><s:property value="#cm.product.pname"/></a>
	                        </div>
	                        <div class="proPrice">
	                            <s:property value="#cm.product.price"/>
	                        </div>
	                        <div class="proNumber">
	                            <span><s:property value="#cm.subcount"/></span>
	                            <span class="dw"><s:property value="#cm.product.unit"/></span>
	                        </div>
	                        <div class="proTotal">
	                            <s:property value="#cm.subtotal"/>
	                        </div>
	                    </div>
	                </s:iterator>
                    <div class="clearBoth"></div>
                </div>
                
                <!--费用详情-->
                <div class="cost">
                    <div class="costRight">
                        <span>商品金额：￥<s:property value="cart.total"/>元</span>
                        <span>配送费：<span class="ep"></span></span>
                    </div>
                    <div class="clearBoth"></div>
                </div>

                <!--提交订单-->
                <div class="conCart">
                    <div class="conRight">
                        <span class="subtotal">总计：<span></span>元</span>
                        <span class="conClick"><a>提交订单</a></span>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </form> 
        </div>
    </div>
    <!--底部-->
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


    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>


    <script type="text/javascript">
        /*回到顶部*/
        $('.to-top').toTop();
        
        var total = "${cart.total}";
        if(total>100) {
            $('.ep').text('包邮');
            $('.subtotal').after('<input type="hidden" name="isPost" value="1"/>');
            $('.subtotal span').text(total);
        } else {
        	total = parseFloat(total);
            $('.subtotal span').text(total+15);
        	$('.subtotal').after('<input type="hidden" name="isPost" value="0"/>');
        	$('.ep').text('￥15元');
        }
    </script>
</body>
</html>