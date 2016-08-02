<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/main.css">
</head>
<body>
    <div class="latest">

        <!-- 最新动态 -->
        <div class="latestStatus">
            <div class="statusTitle">
                <span>最新动态</span>
            </div>
            <ul class="statusContent">
                <li>
                    <ul>
                        <li><s:property value="userCount"/></li>
                        <li>注册用户</li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li><s:property value="orderCount"/></li>
                        <li>订单数量</li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <li><s:property value="orderSuccessCount"/></li>
                        <li>交易成功量</li>
                    </ul>
                </li>
                <li>
                    <ul>
                        <s:if test="turnover!=null">
                            <li>￥<s:property value="turnover"/></li>
                        </s:if>
                        <s:else>
                            <li>0</li>
                        </s:else>
                        
                        <li>成功交易额</li>
                    </ul>
                </li>   
                <div class="clearBoth"></div>           
            </ul>
        </div>

        <!-- 最近注册用户 -->
        <div class="latestRegister">
            <div class="registerTitle">
                <span>最近注册用户</span>
            </div>
            <div class="registerContent">
                <ul>
                    <li>
                        <ul>
                            <li>用户名</li>
                            <li>邮箱</li>
                            <li>注册时间</li>
                            <li>状态</li>
                        </ul>
                    </li>
                    <s:if test="userList!=null">
                        <s:iterator var="u" value="userList">
	                        <li>
	                            <ul>
	                                <li><s:property value="#u.username"/></li>
	                                <li><s:property value="#u.email"/></li>
	                                <li><s:date name="#u.regtime" format="yyyy-MM-dd HH:MM:ss" /></li>
	                                <s:if test="#u.state==1">
	                                   <li>已激活</li>
	                                </s:if>
	                                <s:else>
	                                   <li>未激活</li>
	                                </s:else>
	                                   
	                            </ul>
	                        </li>
                        </s:iterator>
                    </s:if>
                    <s:else>
                        <li style="height:100px;line-height:100px;text-align:center">暂时没有用户注册！</li>
                    </s:else>
                    
                </ul>
            </div>          
        </div>

        <!-- 最近成功交易情况 -->
        <div class="latestDeal">
            <div class="dealTitle">
                <span>最近成功交易</span>
            </div>
            <div class="dealContent">
                <ul>
                    <li>
                        <ul>
                            <li>用户名</li>
                            <li>订单编号</li>
                            <li>购买量</li>
                            <li>消费额</li>
                        </ul>
                    </li>
                    <s:if test="orderSuccessList!=null">
                        <s:iterator var="o" value="orderSuccessList">
		                    <li>
		                        <ul>
		                            <li><s:property value="#o.user.username"/></li>
		                            <li><s:property value="#o.number"/></li>
		                            <li><s:property value="#o.count"/></li>
		                            <li style="color: #e14041">￥<s:property value="#o.total"/></li>
		                        </ul>
		                    </li>
	                    </s:iterator>
                    </s:if>
                    <s:else>
                        <li style="height:100px;line-height:100px;text-align:center">暂时没有任何成功交易记录！</li>
                    </s:else>
                </ul>
            </div>          
        </div>
    </div>
</body>
</html>