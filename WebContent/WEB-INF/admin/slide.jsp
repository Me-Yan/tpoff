<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>轮播图</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/slide.css">
    <script src="${pageContext.request.contextPath }//js/jquery-1.8.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/admin/js/slide.js"></script>
    <script>
        $(function(){
        	var editFail = "${editFail}";
        	var editSuccess = "${editSuccess}";
       	    if(editFail!=null&&editFail!="") {
       	    	alert("修改失败！");
       	    } else if(editSuccess!=null&&editSuccess!="") {
       	    	alert("修改成功！");
       	    }
       	    
        });
    </script>
</head>
<body>
    <s:iterator var="s" value="slideList" status="sIndex">
	    <div class="number">
	        <div class="title">
	            <span>NO.<s:property value="#sIndex.index+1"/></span>
	            <a class="change">更换</a>
	            <div class="hid hidDiv">
	                <form action="${pageContext.request.contextPath }/adminSlide_slideEdit.action" method="post" enctype="multipart/form-data">
	                    <input type="text" name="filename" class="filename" readonly/>
	                    <label for="s1"><a>选择...</a></label>
	                    <input type="file" class="spath" name="slide" id="s1"/>
	                    <input type="hidden" name="sid" value="<s:property value="#s.sid"/>" />
	                </form>
	                <a class="upload">上传</a>
	            </div>
	        </div>
	        <div class="content">
	            <img id="con1" src="<s:property value="#s.spath"/>" alt="">
	        </div>
	    </div>
    </s:iterator>
    
    <div class="formTip" role="alert">
        <div class="cd-popup-container">
            <div class="tipTitle">
                <span>提示信息</span>
            </div>
            <p>您未选择任何图片！</p>
            <a href="javascript:void(0)" class="close img-replace">Close</a>
        </div>
        <!-- cd-popup-container -->
    </div>
    
    
</body>
</html>