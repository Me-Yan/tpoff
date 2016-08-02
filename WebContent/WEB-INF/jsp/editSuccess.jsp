<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>密码修改成功-欢迎来到Me商城</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/regSuccess.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
</head>
<body>
    <div class="header">
        <div class="headerLogo">
            <a href="${pageContext.request.contextPath }/index.action"><img src="${pageContext.request.contextPath }/images/system/logo.png" alt=""></a>
            <span>注册情况</span>
        </div>
    </div>
    <!-- 华丽的分割线=============================================================== -->


    <div class="center">
        <span>密码修改成功，请重新登录账号！<span class="time">5</span>秒后自动跳转到登录页面！</span><a href="${pageContext.request.contextPath }/user_loginPage.action">点我立即跳转</a>
    </div>
    

    <!-- 华丽的分割线=============================================================== -->
    <div class="footer">
        <div class="footerAbout">
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


    <script>
        $(function(){
            var flag = 4;
            var val = setInterval(function(){
                if(flag==0) {
                    clearInterval(val);
                    window.location.href = "user_loginPage.action";
                }
                $('.time').text(flag);
                flag--;

            }, 1000);
        });
    </script>
</body>
</html>