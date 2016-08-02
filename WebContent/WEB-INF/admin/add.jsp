<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加商品</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/add.css">
    <script src="${pageContext.request.contextPath }/admin/js/add.js"></script>
    <script>
          $(function(){
        	 var tip = "${addFail}";
        	 if(tip=="0") {
        		 alert("添加失败！");
        	 }
          });  
    </script>
</head>
<body>
    <div class="add">
        <form action="${pageContext.request.contextPath }/adminProduct_productAdd.action" id="addForm" name="addForm" method="post" enctype="multipart/form-data">
            <!-- 基本信息 -->
            <div class="info">
                <div class="infoTitle">
                    <span>基本信息</span>
                </div>
                <div class="infoContent">
                    <table>
                        <tr>
                            <td>商品名称：</td>
                            <td><input type="text" name="pname" class="pname"></td>
                        </tr>
                        <tr>
                            <td>一级分类：</td>
                            <td>
                                <select name="category" id="category" class="category">
                                    <option value="0" selected>请选择</option>
                                    <s:iterator var="c" value="cList">
                                        <option value="<s:property value="#c.cid"/>"><s:property value="#c.cname"/></option>
                                    </s:iterator>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>二级分类：</td>
                            <td>
                                <select name="categorySecond.csid" id="categorySecond" class="categorySecond">
                                    <option value="0" selected>请选择</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>单价：</td>
                            <td><input type="text" name="price" class="price"></td>
                        </tr>
                        <tr>
                            <td>起订量：</td>
                            <td><input type="text" name="least" class="least"></td>
                        </tr>
                        <tr>
                            <td>计量单位：</td>
                            <td><input type="text" name="unit" class="unit"></td>
                        </tr>
                        <tr>
                            <td>列表图片：</td>
                            <td>
                                <div class="hid">
                                    <input type="text" name="filename" class="filename" readonly/>
                                    <label for="spath"><a>选择...</a></label>
                                    <input type="file" accept="image/*" class="spath" name="proimg" id="spath"/>                                 
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>功效：</td>
                            <td><textarea name="function" class="function"></textarea></td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- 图片展示 -->
            <div class="show">
                <div class="showTitle">
                    <span>图片展示</span>
                </div>
                <div class="showContent">
                    <div class="hid">
                        <input type="text" name="filename" class="filename" style="width:460px" readonly/>
                        <label for="pspath"><a>选择...</a></label>
                        <input type="file" accept="image/*" multiple="multiple" class="pspath" id="pspath" name="show" style="width:460px"/>      
                        <a class="remove">全部移除</a>
                    </div>
                    <div class="tip">
                        <span>提示：按住Ctrl选择多个文件！</span>
                    </div>
                </div>
                <div id="showImg"></div>    
                <div class="clearBoth"></div>           
            </div>

            <!-- 商品详情 -->
            <div class="detail">
                <div class="detailTitle">
                    <span>商品详情</span>
                </div>
                <div class="detailContent">
                    <div class="hid">
                        <input type="text" name="filename" class="filename" readonly style="width:460px"/>
                        <label for="pdpath"><a>选择...</a></label>
                        <input type="file" accept="image/*" multiple="multiple" class="pdpath" id="pdpath" name="detail" style="width:460px"/>  
                        <a class="remove">全部移除</a>      
                    </div>
                    <div class="tip">
                        <span>提示：按住Ctrl选择多个文件！</span>
                    </div>
                </div>  
                <div id="detailImg"></div>  
                <div class="clearBoth"></div>           
            </div>

            <!-- 提交表单 -->
            <div class="btn">
                <a class="sBtn">提交</a>
                <a class="cBtn">取消</a>
            </div>
        </form>
    </div>

    
    <!-- 表单验证提示 -->
    <div class="formTip" role="alert">
        <div class="cd-popup-container">
            <div class="title">
                <span>提示信息</span>
            </div>
            <p>请完善商品的所有信息！</p>
            <a href="javascript:void(0)" class="close img-replace">Close</a>
        </div>
        <!-- cd-popup-container -->
    </div>
</body>
</html>