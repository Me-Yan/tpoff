<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>跳转页面</title>
    <script src="../js/jquery-1.8.3.min.js"></script>
    <style>
        .outer {
            width: 100%;
        }
        .inner {
            margin: 0 auto;
            margin-top: 100px;
            width: 400px;
            text-align: center;
        }
        .inner span {
            color: #e14041;
        }
    </style>
</head>
<body>
    <div class="outer">
        <div class="inner">
            <span>密码修改成功，请重新登录！自动跳转到登录页面......</span>
            <script>
                var flag = 2;
                var st = setInterval(function(){
                    flag--;
                    if(flag==0) {
                    	clearInterval(st);
                    	window.top.location.href = "${pageContext.request.contextPath}/admin/login.jsp";
                    }
                }, 1000);                
            </script>
        </div>
    </div>
</body>
</html>