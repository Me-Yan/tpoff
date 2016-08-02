<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>支付-欢迎来到Me商城</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/pay.css">
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
                <span class="cartImg"><img src="${pageContext.request.contextPath }/images/system/three.png" alt=""></span>
            </div>
        </div>
    </div>
    <!--*******************************************************-->



    <!--中间主要内容-->
    <div class="center">
        <div class="pay">
            <div class="title">
                收银台
            </div>
            <div class="payStyle">
                <form action="" id="payForm">
                    <div class="topTitle">
                        <span class="statement">订单提交成功，请您尽快付款！订单号：<s:property value="order.number"/></span>
                        <span class="money">应付金额：<span class="rmb">￥<span><s:property value="order.total"/></span></span>元</span>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="payList">
                        <div class="list">
                            <div class="payRadio">
                                <span class="inner"></span>
                            </div>
                            <div class="payImg">
                                <img src="${pageContext.request.contextPath }/images/system/zfb.png" alt="">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="list">
                            <div class="payRadio">
                                <span class="inner"></span>
                            </div>
                            <div class="payImg">
                                <img src="${pageContext.request.contextPath }/images/system/cft.png" alt="">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="list">
                            <div class="payRadio">
                                <span class="inner"></span>
                            </div>
                            <div class="payImg">
                                <img src="${pageContext.request.contextPath }/images/system/wx.png" alt="">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                    <div class="confirmPay">
                        <a href="javascript:void(0)">确认支付</a>
                    </div>
                </form>
            </div>
        </div>
    </div>








    <!--*******************************************************-->
    <!--底部-->
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

    <script>
        $(function(){
            
        	$('.payList .list:first').css('border', '1px solid #e14041');
        	$('.payList .list .inner:first').css('display', 'block');
        	
            //选择付款方式
            $('.list').click(function(){
                $('.list').css('border', '1px solid #ccc');
                $('.inner').hide();

                $(this).css('border', '1px solid #e14041');
                $(this).find('.inner').css('display', 'block');
            });

            //提交表单
            $('.confirmPay a').click(function(){
                $('#payForm').serialize();
                $('#payForm').submit();
            });



        });

    </script>
</body>
</html>