<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>修改密码</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/editPassword.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/editPassword.js"></script>
    <script>
        $(function(){
            var errorFail = "${sessionScope.errorFail}";
            if(errorFail!=""||errorFail!=null) {
                $('.content').html(errorFail);
            }
        });
    </script>
</head>
<body>
    <div class="outer">
        <div class="inner">
            <form action="${pageContext.request.contextPath }/adminUser_editPassword.action" name="editForm" id="editForm" method="post">
                <p class="tip">
                    <div class="content"></div>
                    &nbsp;&nbsp;&nbsp;&nbsp;旧密码：<input type="text" name="oldPwd" class="old"/><span></span>
                </p>
                <p>
                    &nbsp;&nbsp;&nbsp;&nbsp;新密码：<input type="password" name="newPwd" class="new"/><span></span>
                </p>
                <p>
                    确认密码：<input type="password" name="confirm" class="confirm"><span></span>
                </p>
                <p>
                    <a class="btn">确认</a>
                    <a class="cancel">取消</a>
                </p>
            </form>
        </div>
    </div>
</body>
</html>