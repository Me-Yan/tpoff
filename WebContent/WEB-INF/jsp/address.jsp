<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>地址管理</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/address.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/address.js"></script>
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
</head>
<body>

    <%@ include file="top.jsp" %>
    
    <div class="center">
        <div class="address">
            <div class="route">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/recent.action">我的Me家</a>
                <s:if test="route!=null">
                    <i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/address_addrPage.action"><s:property value="route"/></a>
                </s:if>
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
                <div class="addressTitle">
                    地址管理
                </div>
                <div class="addrInfo">
                    <div class="info">
                        <div class="addrTitle">
                            <span class="addrAeceiver ad">收货人</span>
                            <span class="addrPhone ad">联系电话</span>
                            <span class="addrAddress ad">地址</span>
                            <span class="addrOperate ad">操作</span>
                        </div>
                        <table style="border-collapse:collapse;">
                            <s:iterator var="a" value="alist">
	                            <tr class="addrList">
	                                <input type="hidden" name="aid" value="<s:property value="#a.aid"/>" class="aid"/>
	                                <td class="receiver"><s:property value="#a.receiver"/></td>
	                                <td class="phone"><s:property value="#a.phone"/></td>
	                                <td class="addr"><s:property value="#a.addr"/></td>
	                                <td class="operate"><a class="editBtn">修改</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a class="deleteBtn" href="${pageContext.request.contextPath }/address_deleteAddr.action?aid=<s:property value="#a.aid"/>">删除</a></td>
	                                <td class="status">
	                                   <s:if test="#a.state==1">
	                                       <span class="one" style="display:inline">默认地址</span>
	                                   </s:if>
	                                   <s:else>
		                                  <span class="two"><a href="${pageContext.request.contextPath }/address_setDefaultAddr.action?aid=<s:property value="#a.aid"/>">设为默认地址</a></span>	                                   
	                                   </s:else>
		                                    
	                                </td>
	                            </tr>
                            </s:iterator>
                        </table>


                        <div class="add">
                            <a class="addAddr">添加地址</a>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!--遮罩层-->
    <div class="mask"></div>
    <!--修改地址-->
    <div class="editPop">
        <div class="popTitle">
            修改地址
        </div>
        <div class="popup">
            <form action="${pageContext.request.contextPath }/address_editAddr.action" id="editForm" method="get">
                <input type="hidden" name="aid" class="aid" value="">
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
                    <a>确认修改</a>
                </p>
            </form>
        </div>
        <!--关闭按钮-->
        <a class="fa fa-close fa-2x close"></a>
    </div>
    <!--添加地址-->
    <div class="addPop">
        <div class="popTitle">
            添加地址
        </div>
        <div class="popup">
            <form action="${pageContext.request.contextPath }/address_addAddr.action" id="addForm" method="get">
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
    
    <div class="clearBoth"></div>
    
    <%@ include file="bottom.jsp" %>
    
    <script type="text/javascript">
        var r = "${route}";
        var al = $('.list a');
        al.each(function(){
        	if($(this).html()==r) {
        		$(this).parent().css({'background-color':'#dddddd', 'color':'#fff'});
        	}
        });
    </script>
    
</body>
</html>