<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>评论页面</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/comment.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
	<script>
	   $(function(){
		   var btn = null;
		  /* 显示弹窗 */
		  $('.btn').click(function(){
			  /* 显示 */
			  btn = $(this).parent();
			  $('.commentPop').fadeIn();
			  $('.mask').fadeIn();
			  
			  $('.hidOid').val($(this).next().next().val());
			  $('.hidId').val($(this).next().val());	
			  $('.hidOmid').val($(this).next().next().next().val());
		  });
		  
		  /* 隐藏弹窗 */
		  $('.mask, .close').click(function(){
			 $('.commentPop').fadeOut();
			 $('.mask').fadeOut();
			 $('.content').val('');
			 $('.tip').html('');
		  });
		  
		  /* 提交 */
		  $('.cBtn').click(function(){
			 var c = $('.content').val();
			 if(c==null||c=="") {
				 $('.tip').html('内容不能为空！');
				 return false;
			 } else if(c.length>220) {
				 $('.tip').html('字数不能超过220个！');
				 return false;
			 }
			 
			 var pid = $(this).next().next().val();
			 var oid = $(this).next().val();
			 var omid = $(this).next().next().next().val();
			 
			 $.ajax({
				url: "${pageContext.request.contextPath}/order_submitComment.action",
				type: "post",
				data: {pid:pid, content:c, oid:oid, omid:omid},
				success: function(data) {
					if(data=="yes") {
						$('.commentPop').fadeOut();
			            $('.mask').fadeOut();
			            $('.content').val('');
			            $('.tip').html('');
						btn.html('<span>已评论</span>');
					}
				}
			 });
			 
		  });
		  
	   });
	</script>
</head>
<body>
    <div class="header">
        <!--头部 链接导向栏-->
        <div class="headerTop">
            <div class="headerNav">
                <div class="topNav">
                    <div class="topNavWel"><span>欢迎来到Me家！</span></div>
                    <ul class="topNavLogin">
                        <s:if test="#session.user==null">
                            <li><a href="${pageContext.request.contextPath }/user_loginPage.action" class="topNavLoginLiA">登录</a></li>
                            <li><a href="${pageContext.request.contextPath }/user_registerPage.action">注册</a></li>
                        </s:if>
                        <s:else>
                            <li><a href="${pageContext.request.contextPath }/recent.action" class="topNavLoginLiA"><s:property value="#session.user.username"/></a></li>
                            <li><a href="${pageContext.request.contextPath }/user_logout.action">退出</a></li>                    
                        </s:else>
                    </ul>
                    <ul class="topNavEntry">
                        <li class="topNavEntryA"><a href="${pageContext.request.contextPath }/order_orderPage.action">我的订单</a></li>
                        <li class="topNavEntryA"><a href="${pageContext.request.contextPath }/collection_collectionPage.action">我的收藏</a></li>
                        <li><a href="">帮助中心</a>&nbsp;<i class="fa fa-angle-down fa-lg"></i></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>

    <!--主要部分-->
    <div class="center">
        <div class="cart">
             <div class="details">
                 <div class="topTitle">
                     <span class="goods">商品</span>
                     <span class="price">单价(元)</span>
                     <span class="number">数量</span>
                     <span class="total">小计(元)</span>
                     <span class="operate">操作</span>
                 </div>
                 <s:iterator var="om" value="order.orderItems">
                      <div class="productList">
                          <div class="proImg">
                              <img src="${pageContext.request.contextPath }/<s:property value="#om.product.pimg"/>" alt="">
                          </div>
                          <div class="proName">
                              <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#om.product.pid"/>"><s:property value="#om.product.pname"/></a>
                          </div>
                          <div class="proPrice">
                              <s:property value="#om.product.price"/>
                          </div>
                          <div class="proNumber">
                              <s:property value="#om.subcount"/>
                          </div>
                          <div class="proTotal">
                              <s:property value="#om.subtotal"/>
                          </div>
                          <div class="proOperate">
                              <s:if test="#om.state==0">
                                    <a class="btn">评论</a>
                                    <input type="hidden" value="<s:property value="#om.product.pid"/>">
                                    <input type="hidden" value="<s:property value="#om.order.oid"/>">
                                    <input type="hidden" value="<s:property value="#om.omid"/>">
                              </s:if>
                              <s:else>
                                    <span>已评论</span>
                              </s:else>
                              <div class="clearBoth"></div>
                          </div>
                      </div>                    
                 </s:iterator>
                 <div class="clearBoth"></div>
             </div>
        </div>
    </div>
    
    <div class="commentPop">
        <div class="popTitle">评论</div>
        <div class="inner">
            <div class="innerContent">
                <textarea class="content"></textarea>
            </div>
            <div class="tip"></div>
            <div class="innerBtn">
                <a class="cBtn">确认</a>
                <input type="hidden" class="hidOid">
                <input type="hidden" class="hidId">
                <input type="hidden" class="hidOmid">
            </div>
        </div>
        <a class="fa fa-close fa-2x close"></a>
    </div>
    
    <!-- 遮罩 -->
    <a class="mask"></a>
    
    
    

    
    <div class="clearBoth"></div>
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
    </div>
</body>
</html>