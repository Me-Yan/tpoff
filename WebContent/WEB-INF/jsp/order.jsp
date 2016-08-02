<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>我的订单</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/order.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
    <script>
        $(function(){
        	$('.confirmGet').click(function(){
        		var oid = $(this).next().val();
        		$.ajax({
        			url: "${pageContext.request.contextPath}/order_confirmGet.action",
        			type: "post",
        			data: {oid:oid},
        			success: function(data) {
        				if(data=="yes") {
        					$('.proStatus').html('<span>交易成功</span><br><a href="${pageContext.request.contextPath}/order_goComment.action?oid='+ oid +'">去评论</a>');
        				}
        			}
        		});
        	});
        });
    </script>
</head>
<body>
    <%@ include file="top.jsp" %>
    
    <!--中间主要内容部分-->
    <div class="center">
        <div class="myOrder">
            <div class="route">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/recent.action">我的Me家</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/order_orderPage.action">我的订单</a>
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
                <div class="orderTitle">
                    我的订单
                </div>
                <div class="orderList">
                    <s:if test="pageBean.list!=null">
	                    <div class="listInner">
	                        <div class="infoTitle">
	                            <ul>
	                                <li class="goods">商品</li>
	                                <li class="price">单价</li>
	                                <li class="count">数量</li>
	                                <li class="subtotal">总价</li>
	                                <li class="status">状态</li>
	                                <div class="clearBoth"></div>
	                            </ul>
	                        </div>
	
	                        <!--例子-->
	                        
	                        <s:iterator var="o" value="pageBean.list">
		                        <table class="orderInfo">
		                            <tr class="info">
		                                <td colspan="3"><span><s:date name="#o.odate" format="yyyy-MM-dd HH:mm:ss"/></span>订单号：<s:property value="#o.number"/></td>
		                            </tr>
		                            
		                            <tr class="productList">
		                                <td class="proInfo">
		                                   <s:iterator var="om" value="#o.orderItems">
			                                    <div class="product">
			                                        <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#om.product.pid"/>" class="proImg"><img src="${pageContext.request.contextPath }/<s:property value="#om.product.pimg"/>" alt=""></a>
			                                        <span class="proName"><a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#om.product.pid"/>"><s:property value="#om.product.pname"/></a></span>
			                                        <span class="proPrice">￥<s:property value="#om.product.price"/>/<s:property value="#om.product.unit"/></span>
			                                        <span class="proCount"><s:property value="#om.subcount"/></span>
			                                        <div class="clearBoth"></div>
			                                    </div>
		                                   </s:iterator>
		                                </td>
		
		                                <td class="proTotal">
		                                    ￥<span><s:property value="#o.total"/></span>
		                                </td>
		                                <td class="proStatus">
		                                  <s:if test="#o.state==0">
		                                      <span>已取消</span>
		                                  </s:if>
		                                  <s:elseif test="#o.state==1">
		                                      <span>未付款</span>
		                                      <br>
		                                      <a href="${pageContext.request.contextPath }/order_payPage.action?oid=<s:property value="#o.oid"/>" class="goPay">去付款</a>
		                                  </s:elseif>
		                                  <s:elseif test="#o.state==2">
                                              <span>等待发货</span>
                                          </s:elseif>
                                          <s:elseif test="#o.state==3">
                                              <a class="confirmGet">确认收货</a>
                                              <input type="hidden" value="<s:property value="#o.oid"/>">
                                          </s:elseif>
                                          <s:elseif test="#o.state==4&&#o.flag==0">
                                              <span>交易成功</span>
                                              <br>
                                              <a href="${pageContext.request.contextPath}/order_goComment.action?oid=<s:property value="#o.oid"/>">去评论</a>
                                          </s:elseif>
                                          <s:elseif test="#o.state==4&&#o.flag==1">
                                              <span>交易成功</span>
                                          </s:elseif>
		                                </td>
		                            </tr>
		                        </table>    
	                        </s:iterator>
	
	
	                        <div class="clearBoth"></div>
	                        <!--分页-->
	                        <div class="page">
	                                <div class="pageInner">
	                                    <s:if test="pageBean.page!=1">
	                                        <a href="${pageContext.request.contextPath }/order_orderPage.action?page=1" class="first">首页</a>
	                                        <a href="${pageContext.request.contextPath }/order_orderPage.action?page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
	                                    </s:if>
	                                    <s:else>
	                                         <a href="javascript:void(0)" style="cursor: text" class="first">首页</a>
	                                         <a href="javascript:void(0)" style="cursor: text" class="pre">上一页</a>
	                                    </s:else>
	                                    
	                                    <s:if test="pageBean.totalPage<=3">
	                                        <s:iterator begin="1" end="pageBean.totalPage" step="1" var="ps">
	                                            <s:if test="#ps==pageBean.page">
	                                                <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                                            </s:if>
	                                            <s:else>
	                                                <a href="${pageContext.request.contextPath }/order_orderPage.action?&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                                            </s:else>
	                                        </s:iterator>
	                                    </s:if>
	                                    <s:elseif test="pageBean.totalPage>3">
	                                        <s:if test="pageBean.page==1 || pageBean.page==2">
	                                            <s:iterator begin="1" end="3" step="1" var="ps">
	                                                <s:if test="#ps==pageBean.page">
	                                                    <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                                                </s:if>
	                                                <s:else>
	                                                    <a href="${pageContext.request.contextPath }/order_orderPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                                                </s:else>
	                                            </s:iterator>
	                                            &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                                        </s:if>
	                                        <s:elseif test="pageBean.page>2&&pageBean.page<pageBean.totalPage-1">
	                                            &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                                            <s:iterator begin="pageBean.page-1" end="pageBean.page+1" step="1" var="ps">
	                                                <s:if test="#ps==pageBean.page">
	                                                    <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                                                </s:if>
	                                                <s:else>
	                                                    <a href="${pageContext.request.contextPath }/order_orderPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                                                </s:else>
	                                            </s:iterator>
	                                            &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                                        </s:elseif>
	                                        <s:elseif test="pageBean.page==pageBean.totalPage || pageBean.page==pageBean.totalPage-1">
	                                            &nbsp;&nbsp;&nbsp;.&nbsp;.&nbsp;.&nbsp;&nbsp;
	                                            <s:iterator begin="pageBean.totalPage-2" end="pageBean.totalPage" step="1" var="ps">
	                                                <s:if test="#ps==pageBean.page">
	                                                    <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                                                </s:if>
	                                                <s:else>
	                                                    <a href="${pageContext.request.contextPath }/order_orderPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                                                </s:else>
	                                            </s:iterator>
	                                        </s:elseif>
	                                    </s:elseif>
	                                    
	                                    <s:if test="pageBean.totalPage!=page">
	                                        <a href="${pageContext.request.contextPath }/order_orderPage.action?page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
	                                        <a href="${pageContext.request.contextPath }/order_orderPage.action?page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
	                                    </s:if>
	                                    <s:else>
	                                         <a href="javascript:void(0)" style="cursor: text" class="next">下一页</a>
	                                         <a href="javascript:void(0)" style="cursor: text" class="last">末页</a>
	                                    </s:else>
	                                </div>
	                            </div>
	                                   
	                    </div>
	                </s:if>
	                <s:else>
	                   <div style="height:195px;line-height:195px;text-align:center">目前没有任何订单！</div>
	                </s:else>                  
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
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