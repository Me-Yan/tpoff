<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>编辑页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/edit.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/edit.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/admin/js/ajaxFileUpload.js"></script>
</head>
<body>
    <!-- 基本信息 -->
    <div class="info">
        <div class="operate">
            <div class="infoTitle">
                <span>基本信息</span>
            </div>
            <div class="confirm">
                <a class="s">提交</a>
                <a class="c">取消</a>
            </div>
            <div class="clearBoth"></div>
        </div>
        <div class="infoContent">
            <form action="" name="basicForm" id="basicForm" enctype="multipart/form-data">
                <input type="hidden" name="pid" value="<s:property value="model.pid"/>" id="infoPid"/>
                <table>
                    <tr>
                        <td>商品名称：</td>
                        <td><input type="text" name="pname" class="pname" value="<s:property value="model.pname"/>"></td>
                    </tr>
                    <tr>
                        <td>一级分类：</td>
                        <td>
                            <select name="category" id="category" class="category">
                                <option value="0" selected>请选择</option>
                                <s:iterator var="c" value="cList">
                                    <s:if test="model.categorySecond.category.cname==#c.cname">
                                        <option value="<s:property value="#c.cid"/>" selected><s:property value="#c.cname"/></option>
                                    </s:if>
                                    <s:else>
                                        <option value="<s:property value="#c.cid"/>"><s:property value="#c.cname"/></option>
                                    </s:else>
                                </s:iterator>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>二级分类：</td>
                        <td>
                            <select name="categorySecond.csid" id="categorySecond" class="categorySecond">
                                <s:iterator var="cs" value="csList">
	                                <s:if test="model.categorySecond.csid==#cs.csid">
		                                <option value="<s:property value="#cs.csid"/>" selected><s:property value="#cs.csname"/></option>
	                                </s:if>
	                                <s:else>
		                                <option value="<s:property value="#cs.csid"/>"><s:property value="#cs.csname"/></option>
	                                </s:else>
                                </s:iterator>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>单价：</td>
                        <td><input type="text" name="price" class="price" value="<s:property value="model.price"/>"></td>
                    </tr>
                    <tr>
                        <td>起订量：</td>
                        <td><input type="text" name="least" class="least" value="<s:property value="model.least"/>"></td>
                    </tr>
                    <tr>
                        <td>计量单位：</td>
                        <td><input type="text" name="unit" class="unit" value="<s:property value="model.unit"/>"></td>
                    </tr>
                    <tr>
                        <td>列表图片：</td>
                        <td>
                            <div class="headImg">
                                <img src="${pageContext.request.contextPath }/<s:property value="model.pimg"/>" alt="">
                                <a>修改</a>
                            </div>
                            <div class="headContent">
                                <div class="hid">
                                    <input type="text" name="filename" class="filename" readonly="">
                                    <label for="spath"><a>选择...</a></label>
                                    <input type="file" accept="image/*" class="spath" name="proimg" id="spath">
                                </div>
                                <a class="headBtn">上传</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>功效：</td> 
                        <td><textarea name="function" class="function"><s:property value="model.function"/></textarea></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <!-- 图片展示 -->
    <div class="show">
        <div class="showAdd">
            <div class="showTitle">
                <span>图片展示</span>
            </div>
            <div class="addShow">
                <a>添加</a>
            </div>
            <div class="clearBoth"></div>
        </div>
        <ul class="delShow">
            <s:iterator var="s" value="showList">
	            <li>
	                <img src="${pageContext.request.contextPath }/<s:property value="#s.pspath"/>" alt="">
	                <a class="showBtn" sid="<s:property value="#s.sid"/>">删除</a>
	            </li>
            </s:iterator>
            <div class="clearBoth"></div>
        </ul>
        <div class="clearBoth"></div>
        <form action="">
            <div class="showContent">
                <div class="hid">
                    <input type="text" name="filename" class="filename" style="width:460px" readonly/>
                    <label for="pspath"><a>选择...</a></label>
                    <input type="file" accept="image/*" multiple="multiple" class="pspath" id="pspath" name="show" style="width:460px"/>
                </div>
                <a class="remove">全部移除</a>
                <a class="upload">上传</a>
                <input type="hidden" name="pid" value="<s:property value="model.pid"/>">
                <div class="tip">
                    <span>提示：按住Ctrl选择多个文件！</span>
                </div>
            </div>
        </form>
        <div id="showImg"></div>
        <div class="clearBoth"></div>           
    </div>

    <!-- 商品详情 -->
    <div class="detail">
        <div class="detailAdd">
            <div class="detailTitle">
                <span>商品详情</span>
            </div>
            <div class="addDetail">
                <a>添加</a>
            </div>
            <div class="clearBoth"></div>
        </div>
        <ul class="delDetail">
            <s:iterator var="d" value="detailList">
	            <li>
	                <img src="${pageContext.request.contextPath }/<s:property value="#d.pdpath"/>" alt="">
	                <a class="detailBtn" pdid="<s:property value="#d.pdid"/>">删除</a>
	            </li>
            </s:iterator>
        </ul>
        <form action="">
            <div class="detailContent">
                <div class="hid">
                    <input type="text" name="filename" class="filename" readonly style="width:460px"/>
                    <label for="pdpath"><a>选择...</a></label>
                    <input type="file" accept="image/*" multiple="multiple" class="pdpath" id="pdpath" name="detail" style="width:460px"/>
                </div>
                <a class="remove">全部移除</a>
                <a class="upload">上传</a>
                <input type="hidden" name="pid" value="<s:property value="model.pid"/>">
                <div class="tip">
                    <span>提示：按住Ctrl选择多个文件！</span>
                </div>
            </div>
        </form> 
        <div id="detailImg"></div>
        <div class="clearBoth"></div>           
    </div>

    <!-- 遮罩 -->
    <div class="mask">
        <i class="fa fa-spinner fa-pulse fa-3x"></i>
    </div>
    
    <script>
        
    
    </script>
    
</body>
</html>