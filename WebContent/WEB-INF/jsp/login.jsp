<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>请登录-欢迎来到Me家</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/login.js"></script>
</head>
<body>
    <div class="header">
        <div class="headerLogo">
            <a href="${pageContext.request.contextPath }/index.action"><img src="${pageContext.request.contextPath }/images/system/logo.png" alt=""></a>
            <span>登录</span>
        </div>
    </div>
    <div class="mainLogin">
        <div class="login">
            <div class="loginImg">
                <img src="${pageContext.request.contextPath }/images/system/login_banner.jpg" alt="">
            </div>
            <form action="${pageContext.request.contextPath }/user_login.action" id="loginForm" method="post" >
                <div class="loginBox">
                    <h2>会员登录</h2>
                    <div class="loginError" id="upError">
                        <s:actionmessage/>
                    </div>
                    <div class="loginList">
                        <input type="text" id="username" class="loginInput" name="username" placeholder="用户名">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="loginError" id="userError">
                    </div>
                    <div class="loginList">
                        <input type="password" id="password" class="loginInput" name="password" placeholder="密码" autocomplete="off">
                        <i class="fa fa-lock"></i>
                    </div>
                    <div class="loginError" id="pwdError">
                    </div>
                    <div class="loginCode">
                        <div class="codeBox">
                            <span>验证码：</span><input type="text" id="code" class="code" name="code">
                        </div>
                        <div class="codeImg">
                            <img src="${pageContext.request.contextPath}/code.action" alt="">
                        </div>
                        <a>换一张？</a>
                    </div>
                    <div class="loginError" id="codeError">
                        <s:actionerror/>
                    </div>
                    <div class="loginBtn">
                        <a>登&nbsp;录</a>
                    </div>
                    <div class="loginRegister">
                        <a href="${pageContext.request.contextPath }/user_registerPage.action">免费注册</a>
                        <a href="" class="fp">忘记密码？</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
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
        <br>
        <br>
        <br>
    </div>
    
    <script>
        $(function(){
        	$('.loginCode a, .codeImg img').click(function(){
                $(".codeImg img").attr('src', "${pageContext.request.contextPath}/code.action?"+new Date().getTime());
            });
        });
    </script>
</body>
</html>