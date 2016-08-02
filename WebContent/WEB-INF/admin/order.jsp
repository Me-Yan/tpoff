<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>订单列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/order.css">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script>
         $(function(){
        	 $('.send').mouseover(function(){
                 $(this).html('确认发货');
            }).mouseout(function(){
            	$(this).html('等待发货');
            }).click(function(){
                var that = this;
                var oid = $(this).next().text();
                if(confirm("确认发货？")) {
                    $.ajax({
                       url: "${pageContext.request.contextPath}/adminOrder_sendGoods.action",
                       type: "post",
                       data: {oid:oid},
                       success: function(data) {
                           if(data=="yes") {
                               $(that).parent().html('等待收货');
                           }
                       }
                    });
                }
            }); 
        	 
        	//查询按钮
       	    $('.search form a').click(function(){
       	    	var flag = true;
       	        if($('.search input').val()==""||$('.search input').val()==null) {
       	            $('.search input').css('border', '1px solid #e14041');
       	            flag = false;
       	        }
       	        if(flag) {
	       	        $('#searchForm').serialize();
	       	        $('#searchForm').submit();
       	        }
       	    });
       	    $('.search input').focus(function(){
       	    	$(this).css('border', '1px solid #ccc');
       	    })
         });
    </script>
</head>
<body>
    <div class="top">
        <div class="search">
            <form action="${pageContext.request.contextPath }/adminOrder_orderPage.action" id="searchForm" name="searchForm" method="get">
                <input type="text" placeholder="请输入订单编号" name="number">
                <a>查询</a>
            </form>         
        </div>
        <div class="state">
            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?state=2">等待发货</a>
            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?state=3">等待收货</a>
            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?state=4">交易成功</a>
            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?state=1">未付款</a>
            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?state=0">已取消</a>
            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action">所有订单</a>
        </div>
        <div class="clearBoth"></div>
    </div>
    <div class="clearBoth"></div>
    
    <div class="order">
        <table class="orderTitle">
            <tr>
                <td>商品</td>
                <td>单价</td>
                <td>数量</td>
                <td>总价</td>
                <td>状态</td>
            </tr>
        </table>

        <!-- 订单详情 -->
        <s:if test="pageBean!=null">
            <s:iterator var="o" value="pageBean.list">
		        <table class="orderContent">
		            <tr class="info">
		                <td colspan="3"><span><s:date name="#o.odate" format="yyyy-MM-dd HH:MM:ss"/></span>订单号：<s:property value="#o.number"/></td>
		            </tr>
		            
		            <tr class="productList">
		                <td class="proInfo">
		                    <s:iterator var="oi" value="#o.orderItems">
			                    <ul>
			                        <li><img src="${pageContext.request.contextPath }/<s:property value="#oi.product.pimg"/>" alt=""></li>
			                        <li><span><s:property value="#oi.product.pname"/></span></li>
			                        <li>￥<s:property value="#oi.product.price"/>/<s:property value="#oi.product.unit"/></li>
			                        <li><s:property value="#oi.subtotal"/></li>
			                        <div class="clearBoth"></div>
			                    </ul>              
		                    </s:iterator>
		                </td>
		
		                <td class="proTotal">
		                  <s:if test="#o.paytotal-#o.total!=0">
		                      <div> ￥<span><s:property value="#o.paytotal"/></span></div>
		                      <div style="color:#797979">(含运费:15元)</div>		                    
		                  </s:if>
		                  <s:else>
		                      <div> ￥<span><s:property value="#o.paytotal"/></span></div>
		                  </s:else>
		                </td>
		                <s:if test="#o.state==0">
			                <td class="proStatus">已取消</td>
		                </s:if>
		                <s:elseif test="#o.state==1">
		                    <td class="proStatus">未付款</td>
		                </s:elseif>
		                <s:elseif test="#o.state==2">
		                    <td class="proStatus"><a class="send">等待发货</a><span style="display:none"><s:property value="#o.oid"/></span></td>
                        </s:elseif>
                        <s:elseif test="#o.state==3">
                            <td class="proStatus">等待收货</td>
                        </s:elseif>
                        <s:elseif test="#o.state==4">
                            <td class="proStatus">交易成功</td>
                        </s:elseif>
		            </tr>
		            <tr>
		                <td colspan="3" class="address">
		                    <span>收货人：<s:property value="#o.receiver"/></span>
		                    <span>地址：<s:property value="#o.addr"/></span>
		                    <span>联系电话：<s:property value="#o.phone"/></span>
		                </td>
		            </tr>
		        </table>
            </s:iterator>
            
            <div class="pagination">
	            <div class="pageInner">
	                <span>共有<s:property value="pageBean.totalCount"/>个记录</span>
	                <s:if test="pageBean.page!=1">
	                    <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=1" class="first">首页</a>
	                    <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
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
	                            <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                            </s:else>
	                        </s:iterator>
	                    </s:elseif>
	                </s:elseif>
	                
	                <s:if test="pageBean.totalPage!=page">
	                    <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
	                    <a href="${pageContext.request.contextPath }/adminOrder_orderPage.action?page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
	                </s:if>
	                <s:else>
	                     <a href="javascript:void(0)" style="cursor: text" class="next">下一页</a>
	                     <a href="javascript:void(0)" style="cursor: text" class="last">末页</a>
	                </s:else>
	            </div>
	        </div>
        </s:if>
        <s:else>
            <table class="orderContent" style="border-bottom: 1px solid #ccc;">
                <tr>
                    <td colspan="3" style="text-align:center;line-height:100px;">没有记录！</td>
                </tr>
            </table>
        </s:else>


        <div class="clearBoth"></div>
    </div>
</body>
</html>