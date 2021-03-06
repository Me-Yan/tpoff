<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit">
	<title>欢迎来到Me家</title>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/top.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/footer.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/productList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/hide.css">
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/plugins/scrollTop/jquery.toTop.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/sameNav.js"></script>
    <script src="${pageContext.request.contextPath }/js/productList.js"></script>
</head>
<body>
    
    
    <%@ include file="top.jsp" %>
    
    
    <div class="clearBoth"></div>
    <!--重点部分-->
    <div class="center">
        <div class="main">
            <div class="route">
                <a href="${pageContext.request.contextPath }/index.action">首页</a><i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=pdate&sort=desc"><s:property value="category.cname"/></a>
                <s:if test="categorySecond!=null">
                    <i class="fa fa-angle-right"></i><a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=pdate&sort=desc"><s:property value="categorySecond.csname"/></a>
                </s:if>
            </div>
            <div class="left">
                <span><s:property value="category.cname"/></span>
                <s:iterator var="cs" value="category.categorySeconds">
                    <s:if test="categorySecond.csid == #cs.csid">
                        <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="#cs.csid"/>&page=1&style=pdate&sort=desc" style="background-color:#dddddd"><s:property value="#cs.csname"/></a>
                    </s:if>
                    <s:else>
                        <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="#cs.csid"/>&page=1&style=pdate&sort=desc"><s:property value="#cs.csname"/></a>
                    </s:else>
                </s:iterator>
            </div>
            <div class="right">
                <s:if test="categorySecond!=null">
	                <div class="items">
	                   <s:if test="olist[1]=='desc'">
		                    <a class="priceda" href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=price&sort=asc">价格<i class="fa fa-sort"></i></a>
		                    <a class="salesda" href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=salecount&sort=asc">销量<i class="fa fa-sort"></i></a>
		                    <a class="timeda" href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=pdate&sort=asc">上架时间<i class="fa fa-arrow-down"></i></a>
		               </s:if>
		               <s:else>
		                    <a class="priceda" href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=price&sort=desc">价格<i class="fa fa-sort"></i></a>
                            <a class="salesda" href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=salecount&sort=desc">销量<i class="fa fa-sort"></i></a>
                            <a class="timeda" href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=pdate&sort=desc">上架时间<i class="fa fa-arrow-down"></i></a>
		               </s:else>
	                </div>
	            </s:if>
	            <s:else>
	               <div class="items">
                       <s:if test="olist[1]=='desc'">
                            <a class="priceda" href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=price&sort=asc">价格<i class="fa fa-sort"></i></a>
                            <a class="salesda" href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=salecount&sort=asc">销量<i class="fa fa-sort"></i></a>
                            <a class="timeda" href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=pdate&sort=asc">上架时间<i class="fa fa-arrow-down"></i></a>
                       </s:if>
                       <s:else>
                            <a class="priceda" href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=price&sort=desc">价格<i class="fa fa-sort"></i></a>
                            <a class="salesda" href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=salecount&sort=desc">销量<i class="fa fa-sort"></i></a>
                            <a class="timeda" href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=pdate&sort=desc">上架时间<i class="fa fa-arrow-down"></i></a>
                       </s:else>
                    </div>
	            </s:else>
                <div class="clearBoth"></div>
                <div class="list">
                    <ul class="listUl">
                        <s:iterator var="p" value="pageBean.list">
	                        <li>
	                            <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" class="listImg"><img src="${pageContext.request.contextPath }/<s:property value="#p.pimg"/>" alt=""></a>
	                            <p class="listName"><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>"><s:property value="#p.pname"/></a></p>
	                            <p class="listPrice">
	                                <span class="lPrice">￥<span class="price"><s:property value="#p.price"/></span></span>
	                                <a class="lCart">加入购物车</a>
	                                <input type="hidden" name="pid" value="<s:property value="#p.pid"/>" class="hidpid">
	                                <input type="hidden" name="subcount" value="<s:property value="#p.least"/>" class="hidsubcount">
	                            </p>
	                        </li>
	                   </s:iterator>
                    </ul>
                    <div class="clearBoth"></div>
                    
                    <!-- 按照一、二级分类进行分页 -->
                    
                    <s:if test="categorySecond!=null">
	                    <div class="page">
                            <div class="pageInner">
                                <span>共<s:property value="pageBean.totalCount"/>件商品</span>
                                <s:if test="pageBean.page!=1">
                                    <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=1&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="first">首页</a>
                                    <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="pageBean.page-1"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="pre">上一页</a>
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
                                            <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
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
                                                <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
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
                                                <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
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
                                                <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
                                            </s:else>
                                        </s:iterator>
                                    </s:elseif>
                                </s:elseif>
                                
                                <s:if test="pageBean.totalPage!=page">
                                    <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="pageBean.page+1"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="next">下一页</a>
                                    <a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="categorySecond.csid"/>&page=<s:property value="pageBean.totalPage"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="last">末页</a>
                                </s:if>
                                <s:else>
                                     <a href="javascript:void(0)" style="cursor: text">下一页</a>
                                     <a href="javascript:void(0)" style="cursor: text">末页</a>
                                </s:else>
                            </div>
                        </div> 
                    </s:if>	 
                    <s:else>
                        <div class="page">
                            <div class="pageInner">
                                <span>共<s:property value="pageBean.totalCount"/>件商品</span>
                                <s:if test="pageBean.page!=1">
	                                <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=1&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="first">首页</a>
	                                <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="pageBean.page-1"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="pre">上一页</a>
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
                                            <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
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
	                                            <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
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
                                                <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
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
                                                <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="#ps"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>"><s:property value="#ps"/></a>
                                            </s:else>
                                        </s:iterator>
	                                </s:elseif>
                                </s:elseif>
                                
	                            <s:if test="pageBean.totalPage!=page">
	                                <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="pageBean.page+1"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="next">下一页</a>
	                                <a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="category.cid"/>&page=<s:property value="pageBean.totalPage"/>&style=<s:property value="olist[0]"/>&sort=<s:property value="olist[1]"/>" class="last">末页</a>
                                </s:if>
                                <s:else>
                                     <a href="javascript:void(0)" style="cursor: text">下一页</a>
                                     <a href="javascript:void(0)" style="cursor: text">末页</a>
                                </s:else>
                            </div>
                        </div> 
                    </s:else>   
                    
                                                 
                </div>
            </div>
        </div>
    </div>

    <!--成功加入购物车显示消息-->
    <div class="successCart">
        成功加入购物车
    </div>
    <div class="clearBoth"></div>


    <%@ include file="bottom.jsp" %>
    

    <!--回到顶部-->
    <a class="to-top fa fa-arrow-circle-o-up fa-4x toTop"></a>

    <script type="text/javascript">
        <!--回到顶部-->
        $('.to-top').toTop();
        
        var orderby = "${olist[0]}";
        var sort = "${olist[1]}";
        
        if(orderby=='pdate') {
            if(sort=='desc') {
                $('.timeda i').removeClass().addClass("fa fa-arrow-down");
                $('.salesda i').removeClass().addClass("fa fa-sort");
                $('.priceda i').removeClass().addClass("fa fa-sort");
            } else if(sort=='asc') {
                $('.timeda i').removeClass().addClass("fa fa-arrow-up");
                $('.salesda i').removeClass().addClass("fa fa-sort");
                $('.priceda i').removeClass().addClass("fa fa-sort");
            }
        } else if(orderby=='price') {
            if(sort=='desc') {
                $('.priceda i').removeClass().addClass("fa fa-arrow-down");
                $('.salesda i').removeClass().addClass("fa fa-sort");
                $('.timeda i').removeClass().addClass("fa fa-sort");
            } else if(sort=='asc') {
                $('.priceda i').removeClass().addClass("fa fa-arrow-up");
                $('.salesda i').removeClass().addClass("fa fa-sort");
                $('.timeda i').removeClass().addClass("fa fa-sort");
            }
        } else if(orderby=='salecount') {
            if(sort=='desc') {
                $('.salesda i').removeClass().addClass("fa fa-arrow-down");
                $('.timeda i').removeClass().addClass("fa fa-sort");
                $('.priceda i').removeClass().addClass("fa fa-sort");
            } else if(sort=='asc') {
                $('.salesda i').removeClass().addClass("fa fa-arrow-up");
                $('.timeda i').removeClass().addClass("fa fa-sort");
                $('.priceda i').removeClass().addClass("fa fa-sort");
            }
        }
    </script>
    
</body>
</html>