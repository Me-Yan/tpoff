<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>用户列表</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/fontAwesome/css/font-awesome.min.css"/>
    <script src="${pageContext.request.contextPath }/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/user.css">
    <script src="${pageContext.request.contextPath }/admin/js/user.js"></script>
    <script>
         $(function(){
        	  var addSuccess = "${sessionScope.addSuccess}";
        	  var deleteSuccess = "${sessionScope.deleteSuccess}";
        	  var editSuccess = "${sessionScope.editSuccess}";
        	  if(addSuccess!=null&&addSuccess!="") {
        		  alert(addSuccess);
        	  }
        	  if(deleteSuccess!=null&&deleteSuccess!="") {
        		  alert(deleteSuccess);
        	  }
        	  if(editSuccess!=null&&editSuccess!="") {
        		  alert(editSuccess);
        	  }
         });
    </script>
</head>
<body>
    <div class="operate">
        <!-- <a><i class="fa fa-download"></i>导出数据</a> -->
        <a class="addUser"><i class="fa fa-user-plus"></i>添加用户</a>      
    </div>
    <div class="user">
        <ul class="userTitle">
            <li>#</li>
            <li>用户名</li>
            <li>性别</li>
            <li>邮箱</li>
            <li>手机号码</li>
            <li>注册时间</li>
            <li>状态</li>
            <li>操作</li>         
        </ul>
        <ul class="userContent">
            <s:if test="pageBean!=null">
                <s:iterator var="u" value="pageBean.list" status="uIndex">
		            <li>
		                <ul>
		                    <li><s:property value="#uIndex.index+1"/></li>
		                    <li><s:property value="#u.username"/></li>
		                    <s:if test="#u.gender!=null">
		                      <li><s:property value="#u.gender"/></li>
		                    </s:if>
		                    <s:else>
		                      <li>未填写</li>		                    
		                    </s:else>
		                    <li><s:property value="#u.email"/></li>
		                    <s:if test="#u.phone!=null">
		                      <li><s:property value="#u.phone"/></li>
		                    </s:if>
		                    <s:else>
		                      <li>未填写</li>
		                    </s:else>
		                    <li><s:date name="#u.regtime" format="yyyy-MM-dd"/></li>
		                    <s:if test="#u.state==1">
                                <li>已激活</li>
                            </s:if>
                            <s:else>
                                <li>未激活</li>
                            </s:else>
		                    <li>
		                        <a class="editUser"><i class="fa fa-edit fa-lg"></i></a>
		                        <!-- <a class="delUser"><i class="fa fa-remove fa-lg"></i></a> -->
		                    </li>
		                    <span style="display:none"><s:property value="#u.realname"/></span>
		                    <span style="display:none"><s:property value="#u.province"/></span>
		                    <span style="display:none"><s:property value="#u.uid"/></span>
		                </ul>
		            </li>
	            </s:iterator>
            </s:if>
            <s:else>
                <li style="padding:40px 0;text-align:center;border-bottom:none" id="noelse"><span>暂时没有用户注册记录！</span></li>
            </s:else>
        </ul>
    </div>
    
    <s:if test="pageBean!=null">
	     <div class="pagination">
	        <div class="pageInner">
	            <span>共有<s:property value="pageBean.totalCount"/>个记录</span>
		        <s:if test="pageBean.page!=1">
		            <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=1" class="first">首页</a>
		            <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=<s:property value="pageBean.page-1"/>" class="pre">上一页</a>
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
		                    <a href="${pageContext.request.contextPath }/adminUser_userPage.action?&page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
		                        <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
		                        <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
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
		                        <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=<s:property value="#ps"/>"><s:property value="#ps"/></a>
		                    </s:else>
		                </s:iterator>
		            </s:elseif>
		        </s:elseif>
		        
		        <s:if test="pageBean.totalPage!=page">
		            <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=<s:property value="pageBean.page+1"/>" class="next">下一页</a>
		            <a href="${pageContext.request.contextPath }/adminUser_userPage.action?page=<s:property value="pageBean.totalPage"/>" class="last">末页</a>
		        </s:if>
		        <s:else>
		             <a href="javascript:void(0)" style="cursor: text" class="next">下一页</a>
		             <a href="javascript:void(0)" style="cursor: text" class="last">末页</a>
		        </s:else>
		    </div>
		</div>
    </s:if>
    
    <!-- 添加用户弹窗 -->
    <div class="add" role="alert">
        <div class="cd-popup-container">
            <div class="title">
                <span>添加用户</span>
            </div>
            <form action="${pageContext.request.contextPath }/adminUser_addUser.action" id="addForm" name="addForm" method="post">
                <table class="addTab">
                    <tr>
                        <td></td>
                        <td>用户名：</td>
                        <td><input class="username" type="text" name="username"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>登录密码：</td>
                        <td><input class="password" type="text" name="pwd"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>实名：</td>
                        <td><input class="realname" type="text" name="realname"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>性别：</td>
                        <td>
                            <select name="gender" class="gender">
                                <option value="男" selected>男</option>
                                <option value="女">女</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>所在省份：</td>
                        <td><input class="province" type="text" name="province"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>手机号码：</td>
                        <td><input class="phone" type="text" name="phone"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>邮箱：</td>
                        <td><input class="email" type="text" name="email"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>是否激活：</td>
                        <td>
                            <select name="state" class="state">
                                <option value="1" selected>是</option>
                                <option value="0">否</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </form>
            <ul class="cd-buttons">
                <li><a class="addConfirm">确认</a></li>
                <li><a class="addCancel">取消</a></li>
            </ul>
            <a href="#0" class="addClose img-replace">Close</a>
        </div>
        <!-- cd-popup-container -->
    </div>

    
    <!-- 编辑用户 -->
    <div class="edit" role="alert">
        <div class="cd-popup-container">
            <div class="title">
                <span>修改用户</span>
            </div>
            <form action="${pageContext.request.contextPath }/adminUser_editUser.action" id="editForm" name="editForm" method="post">
                <input type="hidden" class="uid" name="uid">
                <table class="editTab">
                    <tr>
                        <td></td>
                        <td>用户名：</td>
                        <td><input class="username" type="text" name="username"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>登录密码：</td>
                        <td><input class="editPassword" type="text" name="pwd"/></td>
                        <td>* 为空表示不修改！</td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>实名：</td>
                        <td><input class="realname" type="text" name="realname"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>性别：</td>
                        <td>
                            <select name="gender" class="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                                <option value=""></option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>所在省份：</td>
                        <td><input class="province" type="text" name="province"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>手机号码：</td>
                        <td><input class="phone" type="text" name="phone"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>邮箱：</td>
                        <td><input class="email" type="text" name="email"/></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>是否激活：</td>
                        <td>
                            <select name="state" class="state">
                                <option value="1">是</option>
                                <option value="0">否</option>
                            </select>
                        </td>
                        <td></td>
                    </tr>
                </table>
            </form>
            <ul class="cd-buttons">
                <li><a href="javascript:void(0)" class="editConfirm">确认</a></li>
                <li><a href="javascript:void(0)" class="editCancel">取消</a></li>
            </ul>
            <a href="javascript:void(0)" class="editClose img-replace">Close</a>
        </div>
        <!-- cd-popup-container -->
    </div>

    
    <!-- 删除弹窗 -->
    <div class="delete" role="alert">
        <div class="cd-popup-container">
            <div class="title">
                <span>提示信息</span>
            </div>
            <p>确定删除该用户吗？</p>
            <ul class="cd-buttons">
                <li><a href="javascript:void(0)" class="delBtn">删除</a></li>
                <li><a href="javascript:void(0)" class="cancelBtn">取消</a></li>
            </ul>
        </div>
        <!-- cd-popup-container -->
    </div>
</body>
</html>