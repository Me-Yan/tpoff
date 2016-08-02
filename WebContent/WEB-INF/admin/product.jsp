<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>商品列表</title>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/product.css">
    <script src="${pageContext.request.contextPath }/admin/js/jqthumb.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/product.js"></script>
</head>
<body>
    <div class="search">
        <form action="${pageContext.request.contextPath }/adminProduct_productPage.action" id="searchForm" name="searchForm" method="get">
            <input type="text" name="keyword" />
            <a>查询</a>
        </form>    
        <div class="findAll">
            <a href="${pageContext.request.contextPath }/adminProduct_productPage.action">所有商品</a>
            <div class="clearBoth"></div>
        </div>     
    </div>
    <div class="clearBoth"></div>
    <div class="product">
        <ul class="proTitle">
            <li>#</li>
            <li>&nbsp;</li>
            <li>商品名称</li>
            <li>单价</li>
            <li>销量</li>
            <li>上架时间</li>
            <li>操作</li>
        </ul>
        <ul class="proContent">
            <s:if test="pageBean.list!=null">
                <s:iterator var="p" value="pageBean.list" status="sIndex">
                    <li>
	                    <ul>
	                        <li><s:property value="#sIndex.index+1"/></li>
	                        <li><img src="<s:property value="#p.pimg"/>"></li>
	                        <li><span><s:property value="#p.pname"/></span></li>
	                        <li>￥<s:property value="#p.price"/>/<s:property value="#p.unit"/></li>
	                        <li><s:property value="#p.salecount"/></li>
	                        <li><s:date name="#p.pdate" format="yyyy-MM-dd"/></li>              
	                        <li class="oBtn"><a class="detail" href="${pageContext.request.contextPath }/adminProduct_productDetail.action?pid=<s:property value="#p.pid"/>">详情</a><span>|</span><a href="${pageContext.request.contextPath }/adminProduct_productComment.action?pid=<s:property value="#p.pid"/>">评论</a><span>|</span><a href="${pageContext.request.contextPath }/adminProduct_productEdit.action?pid=<s:property value="#p.pid"/>" class="edit">修改</a><span>|</span><a class="downshelf" pid="<s:property value="#p.pid"/>">下架</a></li>
	                    </ul>
	                </li>
                </s:iterator>
                <div class="clearBoth"></div>
                
                <div class="pagination">
	                <div class="pageInner">
	                    <span>共有<s:property value="pageBean.totalCount"/>个记录</span>
	                    <s:if test="pageBean.page!=1">
	                        <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=1" class="first">首页</a>
	                        <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
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
	                                <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                    <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                    <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
	                                    <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
	                                </s:else>
	                            </s:iterator>
	                        </s:elseif>
	                    </s:elseif>
	                    
	                    <s:if test="pageBean.totalPage!=page">
	                        <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
	                        <a href="${pageContext.request.contextPath }/adminProduct_productPage.action?page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
	                    </s:if>
	                    <s:else>
	                         <a href="javascript:void(0)" style="cursor: text" class="next">下一页</a>
	                         <a href="javascript:void(0)" style="cursor: text" class="last">末页</a>
	                    </s:else>
	                </div>
	            </div>           
            </s:if>
            <s:else>
                <li style="border-bottom: none;text-align:center;line-height:70px" id="noRecord">没有商品记录！</li>
            </s:else>
	            
            <div class="clearBoth"></div>
        </ul>
    </div>

    <div class="clearBoth"></div>

    <!-- 下架 -->
    <div class="shelf" role="alert">
        <div class="cd-popup-container">
            <div class="title">
                <span>提示信息</span>
            </div>
            <p>确定下架该商品吗？</p>
            <ul class="cd-buttons">
                <li><a class="downConfirm">确认</a></li>
                <li><a class="downCancel">取消</a></li>
            </ul>
            <a href="javascript:void(0)" class="cd-popup-close img-replace">Close</a>
        </div>
    </div>
    
    <script>
        $('img').jqthumb({
            width: 70,
            height: 70
        });
        
        //下架判断
        var downSuccess = "${downSuccess}";
        if(downSuccess!=null&&downSuccess!="") {
            alert(downSuccess);
        }
        //添加判断
        var addSuccess = "${addSuccess}";
        if(addSuccess!=null&&addSuccess!="") {
        	alert(addSuccess);
        }
        
    </script>
    
</body>
</html>