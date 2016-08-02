<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>注册-欢迎来到Me家</title>
	<link rel="stylesheet" href="css/register.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/register.js"></script>
</head>
<body>
    <div class="header">
        <div class="headerLogo">
            <a href="${pageContext.request.contextPath }/index.action"><img src="${pageContext.request.contextPath }/images/system/logo.png" alt=""></a>
            <span>用户注册</span>
        </div>
    </div>

    <!--注册列表-->
    <div class="center">
        <div class="register">
            <div class="regTop">
                <span>用户注册</span>
                <a href="${pageContext.request.contextPath }/user_loginPage.action">用户登录</a>
            </div>
            <div class="regMain">
                <div class="regUser">
                    <form action="${pageContext.request.contextPath }/user_register.action" id="regForm" autocomplete="off" method="post">
                        <div class="regList">
                            <div class="listTop">
                                <span>用户名：</span>
                                <input type="text" id="username" name="username" placeholder="请输入用户名，支持4-20字符">
                            </div>
                            <div class="listError">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="regList">
                            <div class="listTop">
                                <span>邮箱：</span>
                                <input type="text" id="email" name="email" placeholder="输入邮箱地址">
                            </div>
                            <div class="listError">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="regList">
                            <div class="listTop">
                                <span>密码：</span>
                                <input type="password" id="password" name="password" placeholder="请设置您的密码支持6-16字符，区分大小写">
                            </div>
                            <div class="listError">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="regList">
                            <div class="listTop">
                                <span>确认密码：</span>
                                <input type="password" id="pwdConfirm" name="pwdConfirm" placeholder="请确认密码">
                            </div>  
                            <div class="listError">                         
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="regList">
                            <div class="listRule">
                                <span>验证码：</span>
                                <input type="text" name="code" id="code" placeholder="请填写验证码">
                                <img src="${pageContext.request.contextPath}/code.action" alt="">
                                <span><a>换一张？</a></span>
                            </div>
                            <div class="listError codeError">
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="regFinish">
                            <a class="regBtn">完成注册</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <div class="footerAbout">
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
        <br>
        <br>
        <br>
        <br>
    </div>
    
</body>
</html>