<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>欢迎来到Me家</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/product.css">  
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/plugins/productSwitch/zoom.css">   
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/productSwitch/zoom.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
    <script src="${pageContext.request.contextPath }/js/product.js"></script>
</head>
<body>
    
    <%@ include file="top.jsp" %>
    
    <!--主体-->
    <div class="proInfo">
        <div class="product">
            <div class="proRoute">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="product.categorySecond.category.cid"/>&page=1&style=pdate&sort=desc"><s:property value="product.categorySecond.category.cname"/></a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="product.categorySecond.csid"/>&page=1&style=pdate&sort=desc"><s:property value="product.categorySecond.csname"/></a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="product.pid"/>"><s:property value="product.pname"/></a>
            </div>
            <div class="proIntroduce">
                <div class="introLeft">
                    <div id="vertical" class="bigImg">
                        <img src="${pageContext.request.contextPath }/<s:property value="slist[0].pspath"/>" width="420" height="420" alt="" id="midimg" />
                        <div style="display:none;" id="winSelector"></div>
                    </div><!--bigImg end--> 
                    <div class="smallImg">
                        <div class="scrollbutton smallImgUp disabled"></div>
                        <div id="imageMenu">
                            <ul>
                                <s:iterator var="s" value="slist">
                                    <li><img src="${pageContext.request.contextPath }/<s:property value="#s.pspath"/>"/></li>
                                </s:iterator>
                            </ul>
                        </div>
                        <div class="scrollbutton smallImgDown"></div>
                    </div><!--smallImg end-->   
                    <div id="bigView" style="display:none;"><img width="800" height="800" alt="" src="" /></div>
                </div>
                <div class="introRight">
                    <span class="name"><s:property value="product.pname"/></span>
                    <p class="price"><span class="pr">价格</span><span class="sm">￥<span class="sPrice"><s:property value="product.price"/></span></span></p>
                    <p class="require">
                        <span>起订量：<s:property value="product.least"/></span>
                        <span>计量单位：<s:property value="product.unit"/></span>
                    </p>
                    <div class="count">
                        <form action="${pageContext.request.contextPath }/order_addToCart.action" method="get" id="orderForm">
	                        <span class="sl">数量</span>
	                        <a class="less fa fa-minus fa-0.1x"></a>
	                        <input type="text" name="subcount" class="countInput" value="<s:property value="product.least"/>">
	                        <a class="add fa fa-plus"></a>
	                        <span class="dw">斤</span>
	                        <span class="qd"><s:property value="product.least"/></span>
	                        <input type="hidden" class="pid" name="pid" value="<s:property value="product.pid"/>">
	                    </form>
                    </div>
                    <div class="buy">
                        <a class="bNow bnc"><span>立即购买</span></a>
                        <a class="bCart bnc"><i class="fa fa-cart-arrow-down fa-1x"></i><span>加入购物车</span></a>
                        <s:if test="collection!=null">
                            <a class="bCollection bnc"><i class="fa fa-star"></i><span>已收藏</span></a>
                        </s:if>
                        <s:else>
                            <a class="bCollection bnc"><i class="fa fa-star-o"></i><span>收藏</span></a>
                        </s:else>
                    </div>
                    <p class="describle">
                        <span class="dValue">功效</span>
                        <span class="dContent">
                            <s:property value="product.function"/>
                        </span>
                    </p>
                </div>
            </div>
            <div class="proLeft">
                <span class="recTitle">相关商品</span>
                <s:iterator var="p" value="plist">
	                <div class="recommend">
	                    <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" class="recImg">
	                        <img src="${pageContext.request.contextPath }/<s:property value="#p.pimg"/>" alt="">
	                    </a>
	                    <p class="recName"><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>"><s:property value="#p.pname"/></a></p>
	                    <p class="recPrice">￥<span><s:property value="#p.price"/></span></p>
	                </div>
                </s:iterator>
            </div>



            <div class="proRight">
                <div class="tabList">
                    <ul class="tabControl">
                        <li class="detail tClick">商品详情</li>
                        <s:if test="num!=null">
                            <li class="evaluate">评论(<s:property value="num"/>)</li>
                        </s:if>
                        <s:else>
                            <li class="evaluate">评论(0)</li>
                        </s:else>
                    </ul>
                </div>

                <div class="tabContent">
                    <div class="tabImg">
                        <p class="tabP">
                            <s:iterator var="d" value="dlist">
                                <img src="${pageContext.request.contextPath }/<s:property value="#d.pdpath"/>" alt="">
                            </s:iterator>
                        </p>
                    </div>
                    <s:if test="pageBean!=null">
	                    <div class="tabWord">
	                        <ul class="tabUl">
	                            <s:iterator var="com" value="pageBean.list">
		                            <li>
		                                <span class="tabEvaluate"><s:property value="#com.content"/></span>
		                                <span class="tabDate"><s:date name="#com.cdate" format="yyyy-MM-dd HH:mm:ss"/></span>
		                                <span class="tabName"><i class="fa fa-user fa-lg"></i><s:property value="#com.username"/></span>
		                            </li>
		                        </s:iterator>
	                        </ul>
	                        <div class="page">
	                            <div class="pageInner">
	                                <s:if test="pageBean.page!=1">
	                                    <a href="${pageContext.request.contextPath }/product_findByPid.action?page=1&pid=<s:property value="product.pid"/>&conPage=yes" class="first">首页</a>
	                                    <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="pageBean.page-1"/>&pid=<s:property value="product.pid"/>&conPage=yes" class="pre">上一页</a>
	                                </s:if>
	                                <s:else>
	                                     <a href="javascript:void(0)" style="cursor: text">首页</a>
	                                     <a href="javascript:void(0)" style="cursor: text">上一页</a>
	                                </s:else>
	                                
	                                <s:if test="pageBean.totalPage<=3">
	                                    <s:iterator begin="1" end="pageBean.totalPage" step="1" var="ps">
	                                        <s:if test="#ps==pageBean.page">
	                                            <a href="javascript:void(0)" style="cursor: text;background-color:#e14041;color:#fff"><s:property value="#ps"/></a>
	                                        </s:if>
	                                        <s:else>
	                                            <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="#ps"/>&pid=<s:property value="product.pid"/>&conPage=yes"><s:property value="#ps"/></a>
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
	                                                <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="#ps"/>&pid=<s:property value="product.pid"/>&conPage=yes"><s:property value="#ps"/></a>
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
	                                                <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="#ps"/>&pid=<s:property value="product.pid"/>&conPage=yes"><s:property value="#ps"/></a>
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
	                                                <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="#ps"/>&pid=<s:property value="product.pid"/>&conPage=yes"><s:property value="#ps"/></a>
	                                            </s:else>
	                                        </s:iterator>
	                                    </s:elseif>
	                                </s:elseif>
	                                
	                                <s:if test="pageBean.totalPage!=page">
	                                    <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="pageBean.page+1"/>&pid=<s:property value="product.pid"/>" class="next">下一页</a>
	                                    <a href="${pageContext.request.contextPath }/product_findByPid.action?page=<s:property value="pageBean.totalPage"/>&pid=<s:property value="product.pid"/>" class="last">末页</a>
	                                </s:if>
	                                <s:else>
	                                     <a href="javascript:void(0)" style="cursor: text">下一页</a>
	                                     <a href="javascript:void(0)" style="cursor: text">末页</a>
	                                </s:else>
	                            </div>
	                        </div>
	                    </div>
                    </s:if>
                    <s:else>
                        <div class="tabWord" style="height:100px;line-height:100px;text-align:center;font-size:17px">
                            <span>暂时没有任何评论！</span>
                        </div>
                    </s:else>
                </div>
            </div>
        </div>
    </div>
    
    <div class="clearBoth"></div>
    
    <%@ include file="bottom.jsp" %>
    
    <!--成功加入购物车显示消息-->
    <div class="successCart we">
        成功加入购物车
    </div>
    
    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>
    
    <script type="text/javascript">
        $('.close').click(function(){
        	$('.confirmPop').fadeOut();
        });
    
    
        <!--回到顶部-->
        $('.to-top').toTop();
        
        var conPage = "${conPage}";
        if(conPage=="yes") {
        	$(window).scrollTop(800);
        	$('.evaluate').addClass('tClick').removeClass('tDefault');
            $('.detail').addClass('tDefault').removeClass('tClick');
            $('.tabImg').hide();
            $('.tabWord').show();
        }
        
        
        //收藏
	    $('.bCollection').click(function(){
	    	var user = "${sessionScope.user}";
            if(user==null||user=="") {
            	window.location.href = "${pageContext.request.contextPath}/user_loginPage.action";
                return false;
            }
	    	if($('.bCollection span').text()=="已收藏") {
	    		return false;
	    	}
	        var pid = "${product.pid}";
	        var that = this;
	        $.ajax({
	            url: "${pageContext.request.contextPath}/collection_addToCollection.action",
	            type: "post",
	            data: {pid:pid},
	            success: function(data) 
	            {  $('body').text(data);
	                if(data=="yes") {
	                    $(that).find('i').removeClass('fa-star-o').addClass('fa-star');
	                  
	                }
	            }
	        });
	    });
	  //加入购物车
	    $('.bCart').click(function(){
	        var user = "${sessionScope.user}";
	        if(user==null||user=="") {
	            window.location.href = "${pageContext.request.contextPath}/user_loginPage.action";
	            return false;
	        }
	        var pid = $('.pid').val();
	        var subcount = $('.countInput').val();
	        $.ajax({
	            type: "post",
	            url: "${pageContext.request.contextPath}/cart_addToCart.action",
	            data: {pid:pid, subcount:subcount},
	            success: function(data){
	                var json = JSON.parse(data);    
	                    if(json.flag=="yes") {
	                        $('.successCart').show();
	                        $('.successCart').animate({width:'300px'}, 400);
	                        setTimeout(function(){
	                            $('.successCart').animate({width:'0px'}, 400);
	                        }, 1300);
	                    }
	                    $('.cart strong').text(json.count);
	                },
	        });
	    });
	  
    </script>
    
</body>
</html>