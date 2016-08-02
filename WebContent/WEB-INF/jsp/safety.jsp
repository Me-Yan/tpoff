<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="renderer" content="webkit">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>安全中心-欢迎来到Me商城</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/safety.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
    <script src="${pageContext.request.contextPath }/js/safety.js"></script>
</head>
<body>
    <%@ include file="top.jsp" %>
    
    
    
    <div class="center">
        <div class="safety">
            <div class="route">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/recent.action">我的Me家</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/user_userPage.action">个人资料</a>
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
                <div class="safetyTitle">
                    安全中心
                </div>
                <div class="safetyInfo">
                    <div class="info">
                        <div class="edit">
                            <i class="fa fa-key fa-3x"></i>
                            <span class="e">
                                <strong>修改密码</strong>经常的更换您的账户密码，并且不要和其他账户共用同一个密码
                            </span>
                            <a class="editPwd">修改密码</a>
                        </div>
                        <div class="edit">
                            <i class="fa fa-envelope fa-3x"></i>
                            <span class="e">
                                <s:if test="#session.user.email==null">
                                    <strong>绑定邮箱</strong>绑定邮箱后，邮箱可以作为您的账号进行登录
                                </s:if>
                                <s:else>
                                    <strong>您绑定的邮箱</strong><s:property value="#session.user.email"/>
                                </s:else>
                            </span>
                            <a class="editEmail">修改邮箱</a>
                        </div>
                        
                       <%--  <div class="edit phone">
                            <i class="fa fa-mobile-phone fa-5x phone"></i>
                            <span class="e">
                                <s:if test="#session.user.phone==null">
                                    <strong>绑定手机</strong>绑定手机后，修改密码将必须要通过手机验证，避免他人恶意修改您的密码
                                </s:if>
                                <s:else>
                                    <strong>您绑定的手机</strong><s:property value="#session.user.phone"/>
                                </s:else>    
                            </span>
                            <a class="editPhone">修改手机号</a>
                        </div> --%>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
    


    <!--弹窗-->
    <div class="mask"></div>
    <!--修改密码-->
    <div class="pwdPop">
        <div class="popTitle">
            修改密码
        </div>
        <div class="popForm">
            <form action="${pageContext.request.contextPath }/user_editPwd.action" id="pwdForm" method="post">
                
                <p class="old">
                    <span class="pspan">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;旧密码：</span><input type="password" name="oldPwd" value=""><span class="ostate state"></span>
                </p>
                <p class="new">
                    <span class="pspan">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新密码：</span><input type="password" name="newPwd" value=""><span class="nstate state"></span>
                </p>
                <p class="conPwd">
                    <span class="pspan">确认新密码：</span><input type="password" class="confirmPwd" name="confirmPwd" value=""><span class="cstate state"></span>
                </p>
                <p class="confirm">
                    <a class="pwdBtn">确认</a>
                </p>
            </form>
        </div>
        <a class="fa fa-close fa-2x close"></a>
    </div>

    <!-- 修改邮箱 -->
    <div class="emailPop">
        <div class="popTitle">
            修改邮箱
        </div>
        <div class="popForm">
            <form action="" id="emailForm">
                <p class="email">
                    <span class="pspan">邮箱地址：</span><input type="text" name="email" value=""><span class="estate state"></span>
                </p>
                <p class="confirm">
                    <a class="emailBtn">发送邮件</a>
                </p>
            </form>
        </div>
        <a class="fa fa-close fa-2x close"></a>
    </div>

    <!-- 修改手机号 -->
    <!-- <div class="phonePop">
        <div class="popTitle">
            修改手机号
        </div>
        <div class="popForm">
            <form action="" id="phoneForm">
                <p class="telephone">
                    <span class="pspan">手机号码：</span><input type="text" name="phone" value=""><span class="pstate state"></span>
                </p>
                <p class="code">
                    <span class="pspan">&nbsp;&nbsp;&nbsp;&nbsp;验证码：</span><input id="code" type="text" name="code" value=""><a class="getCode">获取验证码</a><span class="gstate state"></span>
                </p>
                <p class="confirm">
                    <a class="phoneBtn">确认</a>
                </p>
            </form>
        </div>
        <a class="fa fa-close fa-2x close"></a>
    </div> -->
    
    
    <!-- 去邮箱进行确认 -->
    
    <div class="confirmPop">
        <span></span>
        <a class="fa fa-close fa-2x close"></a>
    </div>
    
    
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