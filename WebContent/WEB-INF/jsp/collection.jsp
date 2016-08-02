<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>我的收藏-欢迎来到Me商城</title>
	</head>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/collection.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
<body>
    <%@ include file="top.jsp" %>
    <div class="clearBoth"></div>
    
    <!-- 中间重要部分 -->
    <div class="center">
        <div class="collection">
            <div class="route">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/recent.action">我的Me家</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/collection_collectionPage.action">我的收藏</a>
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
	                <div class="proTitle">
	                    我的收藏
	                </div>
	               <s:if test="pageBean!=null">
	                <div class="col">
	                    <div class="colInner">
	                        <div class="colTitle">
	                            <span class="colInfo">商品信息</span>
	                            <span class="colDate">收藏日期</span>
	                            <span class="colPrice">单价</span>
	                            <span class="operate">操作</span>
	                        </div>
	
	                        <!--内容距离-->
	                        <s:if test="pageBean!=null">
	                            <s:iterator var="c" value="pageBean.list">
			                        <div class="colList">
			                            <div class="proInfo">
			                                <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#c.product.pid"/>" class="proImg"><img src="${pageContext.request.contextPath }/<s:property value="#c.product.pimg"/>" alt=""></a>
			                                <span class="proName"><a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#c.product.pid"/>"><s:property value="#c.product.pname"/></a></span>
			                                <div class="clearBoth"></div>
			                            </div>
			                            <div class="proDate">
			                                <s:date name="#c.coldate" format="yyyy-MM-dd"/>
			                            </div>
			                            <div class="proPrice">
			                                ￥<s:property value="#c.product.price"/>/<s:property value="#c.product.unit"/>
			                            </div>
			                            <div class="proOperate">
			                                <a href="${pageContext.request.contextPath }/collection_deleteCollectionByColid.action?colid=<s:property value="#c.colid"/>">删除</a>
			                            </div>
			                        </div>
	                            </s:iterator>
	                        </s:if>
	                        <!--分页-->
	                        <div class="page">
	                            <div class="pageInner">
	                                <s:if test="pageBean.page!=1">
	                                    <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=1" class="first">首页</a>
	                                    <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
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
	                                            <a href="${pageContext.request.contextPath }/collection_collectionPage.action?&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                                <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                                <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                                <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                                            </s:else>
	                                        </s:iterator>
	                                    </s:elseif>
	                                </s:elseif>
	                                
	                                <s:if test="pageBean.totalPage!=page">
	                                    <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
	                                    <a href="${pageContext.request.contextPath }/collection_collectionPage.action?page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
	                                </s:if>
	                                <s:else>
	                                     <a href="javascript:void(0)" style="cursor: text" class="next">下一页</a>
	                                     <a href="javascript:void(0)" style="cursor: text" class="last">末页</a>
	                                </s:else>
	                            </div>
	                        </div> 
	                    </div>
	                </div>
			        </s:if>
			        <s:else>
			           <div class="col" style="height:195px;text-align: center;line-height:195px;font-size:17px;color:#696969">
			               您暂未收藏任何商品！
			           </div>
			        </s:else>    
	            </div>
	            
            <div class="clearBoth"></div>
        </div>
    </div>
    <div class="clearBoth"></div>
    
    <!-- 底部 -->
    <%@ include file="bottom.jsp" %>
    
    <script type="text/javascript">
        var r = "${route}";
        var al = $('.list a');
        al.each(function(){
            if($(this).html()==r) {
                $(this).parent().css({'background-color':'#dddddd', 'color':'#fff'});
            }
        });
        
        /* 删除收藏 */
        $('.proOperate a').click(function(){
        	if(!confirm("确定删除该商品？")) {
        		return false;
        	}
        });
    </script>
</body>
</html>