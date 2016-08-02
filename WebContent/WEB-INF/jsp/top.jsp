<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<div class="header">
        <!--头部 链接导向栏-->
        <div class="headerTop">
            <div class="topNav">
                <div class="topNavWel"><span>欢迎来到Me家！</span></div>
                <ul class="topNavLogin">
                    <s:if test="#session.user==null">
	                    <li><a href="${pageContext.request.contextPath }/user_loginPage.action" class="topNavLoginLiA">登录</a></li>
	                    <li class="ltwo"><a href="${pageContext.request.contextPath }/user_registerPage.action">注册</a></li>
                    </s:if>
                    <s:else>
                        <li class="lone"><a href="${pageContext.request.contextPath }/recent.action" class="topNavLoginLiA"><s:property value="#session.user.username"/></a></li>
                        <li class="ltwo"><a href="${pageContext.request.contextPath }/user_logout.action">退出</a></li>
                    </s:else>
                </ul>
                <ul class="topNavEntry">
                    <li class="topNavEntryA"><a href="${pageContext.request.contextPath }/order_orderPage.action">我的订单</a></li>
                    <li class="topNavEntryA"><a href="${pageContext.request.contextPath }/collection_collectionPage.action">我的收藏</a></li>
                    <li><a href="">帮助中心</a>&nbsp;<i class="fa fa-angle-down fa-lg"></i></li>
                </ul>
            </div>
        </div>
        <div class="clearBoth"></div>
        <!--头部 搜索栏-->   
        <div class="headerBody">
            <div class="bodySearch">
                <div class="logo">
                    <a href="${pageContext.request.contextPath }/index.action"><img src="${pageContext.request.contextPath }/images/system/logo.png" alt=""></a>
                </div>
                <div class="searchKey">
                    <form action="${pageContext.request.contextPath }/product_findProductByKeyword.action" id="keyForm" method="get">
	                    <input name="keyword" type="text" class="keywords" placeholder="请输入关键词">
	                    <input type="hidden" name="page" value="1"/>
	                    <input type="hidden" name="style" value="pdate"/>
	                    <input type="hidden" name="sort" value="desc"/>
	                    <a class="searchButton"><i class="fa fa-search fa-3x" style="color:red"></i></a>
	                </form>
                </div>
                <div class="cart">
                    <div class="mycart">
                        <i class="fa fa-cart-arrow-down fa-2x" style="color:red"></i>
                        <a href="${pageContext.request.contextPath }/cart_cartPage.action">我的购物车</a>
                    </div>                  
                    <s:if test="count!=null">
                        <span><strong><s:property value="count"/></strong></span>
                    </s:if>
                    <s:else>
                        <span><strong>0</strong></span>
                    </s:else>
                </div>
            </div>
        </div>
        <div class="clearBoth"></div>
        <!--菜单分类--> 
        <div class="headerMenu">
            <div class="menuTop">
                <ul class="headerNav">
                    <li class="category"><i class="fa fa-reorder"></i><strong>&nbsp;&nbsp;商品分类</strong></li>
                </ul>
            </div>
        </div>
        <div class="headerBottom">
            <div class="menuList">
                <ul class="menuListUl">
                    <s:iterator var="c" value="clist">
	                    <li><a href="${pageContext.request.contextPath }/product_findProductByCid.action?cid=<s:property value="#c.cid"/>&page=1&style=pdate&sort=desc"><s:property value="#c.cname"/></a></li>	                    
	                </s:iterator>
	                <div class="clearBoth"></div>
                </ul>
                <div class="menuDetailList">
                    <s:iterator var="c" value="clist">
	                    <ul class="menuDetail">
	                       <s:iterator var="cs" value="#c.categorySeconds">
	                           <li><a href="${pageContext.request.contextPath }/product_findProductByCsid.action?csid=<s:property value="#cs.csid"/>&page=1&style=pdate&sort=desc"><s:property value="#cs.csname"/></a></li>
	                       </s:iterator>
	                        <div class="clearBoth"></div>                       
	                    </ul>
	                </s:iterator>
                </div>
                <s:if test="slist!=null&&slist.size()>0">
	                <ul class="menuRight">
	                    <s:iterator var="s" value="slist">
	                        <s:if test="#s.flag==0">
			                    <li>
			                        <a target="_blank" href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#s.product.pid"/>"><img src="${pageContext.request.contextPath }/<s:property value="#s.spath"/>" alt=""></a>
			                    </li>
		                    </s:if>
		                </s:iterator>
	                </ul>   
	           </s:if>
            </div>
        </div>
    </div>