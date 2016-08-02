<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <title>后台管理系统登录页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/login.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script>
        $(function(){
        	var r = "${sessionScope.errorMessage}";
        	if(r!=""&&r!=null) {
        		$('.tip div').html(r);
        		$('.tip div').show();
        	}
            $('.btn').click(function(){
            	var flag = true;
                if($('.name').val()==""||$('.name')==null) {
                    $('.name').css('border', '1px solid #e14041');
                    flag = false;
                }
                if($('.password').val()==""||$('.name')==null) {
                    $('.password').css('border', '1px solid #e14041');
                    flag = false;
                }
                if(flag) {
                    $('#loginForm').serialize();
                    $('#loginForm').submit();
                }
            });
            $('input').focus(function(){
                $(this).css('border', '1px solid #3A4147');
                $('.tip div').html('');
                $('.tip div').hide();
            });
        });
    </script>
</head>
<body>
    <div class="logo">
        <div class="logoImg">
            <img src="${pageContext.request.contextPath }/images/system/adminLogo.png" alt="">
        </div>
        <div class="tip">
            <div></div>
        </div>
    </div>
    <div class="sign">
        <div class="inner">
            <form action="${pageContext.request.contextPath }/adminUser_login.action" name="loginForm" id="loginForm" method="post">                
                <p>
                    <input type="text" name="name" class="name" placeholder="请输入用户名"/>
                </p>
                <p>
                    <input type="password" name="password" class="password" placeholder="请输入密码"/>
                </p>
                <p>
                    <a class="btn">登录</a>
                </p>
            </form>
        </div>
    </div>

</body>
</html>