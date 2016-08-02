<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>个人资料-欢迎来到Me商城</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/user.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
    <script src="${pageContext.request.contextPath }/js/user.js"></script>
</head>
<body>
    <%@ include file="top.jsp" %>
    
    <div class="center">
        <div class="infomation">
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
                <div class="userTitle">
                    个人资料        
                </div>
                <div class="userInfo">
                    <div class="inner">
                        <div class="info">
                            <p>
                                <span class="same">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：&nbsp;&nbsp;&nbsp;</span><span class="ue"><s:property value="#session.user.username"/></span>
                            </p>
                            <p>
                                <span class="same">实&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;&nbsp;&nbsp;</span><span class="re"><s:property value="#session.user.realname"/></span>
                            </p>
                            <p>
                                <span class="same">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;</span><span class="gr"><s:property value="#session.user.gender"/></span>
                            </p>                            
                            <p>
                                <span class="same">所在省份&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="pe"><s:property value="#session.user.province"/></span>
                            </p>
                            <p>
                                <span class="same">注册时间&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;</span><span><s:date name="#session.user.regtime" format="yyy-MM-dd"/></span>
                            </p>
                            <p class="editInfo">
                                <a class="editBtn">编辑</a>
                            </p>
                        </div>
                        <div class="infoImg">
                            <div class="imgTitle">
                                头像
                            </div>
                            <div class="userImg">
                                <img src="${pageContext.request.contextPath }/<s:property value="#session.user.upath"/>" alt="">
                            </div>                          
                            <div class="editImg" >
                                修改头像
                            </div>
                        </div>      
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>



    <!-- 弹窗 -->

    <!-- 遮罩 -->
    <div class="mask"></div>
    <!-- 个人资料 -->
    <div class="popup">
        <div class="popTitle">
            修改个人信息
        </div>
        <div class="popForm">
            <form action="${pageContext.request.contextPath }/user_editUser.action" id="infoForm" method="post">
                <p class="username">
                    <span>昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称：&nbsp;&nbsp;&nbsp;</span><input type="text" name="username" value=""><span class="state"></span>
                </p>
                <p class="realname">
                    <span>实&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：&nbsp;&nbsp;&nbsp;</span><input type="text" name="realname" value="">
                </p>
                <p class="sex">
                    <span>性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：&nbsp;&nbsp;&nbsp;</span><input id="man" type="radio" name="gender" value="男"><label for="man">&nbsp;&nbsp;男</label><input type="radio" id="woman" name="gender" value="女"><label for="woman">&nbsp;&nbsp;女</label>
                </p>                
                <p class="province">
                    <span>所在省份&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="text" name="province" value="">
                </p>
                <p class="confirm">
                    <a class="infoBtn">确认</a>
                </p>
            </form>
        </div>
        <a class="fa fa-close fa-2x close"></a>
    </div>

    <!-- 修改头像 -->
    <div class="imgPop">
        <div class="popTitle">
            修改头像
        </div>
        <div class="imgForm">
            <form action="${pageContext.request.contextPath }/user_editHeadImg.action" id="imgForm" enctype="multipart/form-data" method="post">
                <div class="showImg">
                    <img id="showImg" src="" alt="">
                </div>
                <div class="filename">
                    <input id="filename" type="file" value="" name="headImg" onchange="previewImage(this)">
                    <a class="imgBtn">上传</a>
                </div>
            </form>
        </div>
        <a class="fa fa-close fa-2x close"></a>
    </div>
    
    
    <%@ include file="bottom.jsp" %>
    
    <script>

        
      //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
          if (file.files && file.files[0])
          {
              var img = document.getElementById('showImg');
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;}
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            var img = document.getElementById('showImg');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
          }
        }
      
        /*页面选中背景*/
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