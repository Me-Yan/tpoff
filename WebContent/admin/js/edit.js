$(function(){
	// 基本信息
	// 修改列表图片
	var head = true;	//是否是隐藏状态
	$('.headImg a').click(function(){
		if(head) {
			$('.headContent').show();
			$(this).html('收起');
			head = false;
		} else {
			$('.headContent').hide();
			$(this).html('修改');
			head = true;
		}
	});
	$('.headContent #spath').live('change', function(){
		$(this).prev().prev().val($(this).val());
	});
	// 提交表单
	$('.confirm .s').click(function(){
		var flag = false;
		$('.infoContent input[class!="filename"][type!="file"]').each(function(){
            if($(this).val()==null||$(this).val()==''){
            	flag = true; 
                return false;
            }
        });
        if(flag) {
        	alert('请完善基本信息！');
        	return false;
        }
        if($('select').val()==''||$('select').val()==null||$('textarea').val()==''||$('textarea').val()==null) {
            alert('请完善基本信息！');
            return false;
        }
        
        $.ajax({
        	url: "${pageContext.request.contextPath}/adminProduct_editInfo.action",
        	type: "post",
        	data: $('#basicForm').serialize(),
        	success: function(data) {
        		if(data=="yes") {
        			alert('修改成功！');
        		} else {
        			alert('修改失败！');
        		}
        	}
        });
	});
	
	
	// 重置表单
	$('.confirm .c').click(function(){
		$('.infoContent input').val('');
		$('.infoContent textarea').val('');
	});

	// 图片展示
	var show = true;
	$('.addShow a').click(function(){
		if(show) {
			$('.showContent').show();
			$(this).html('收起');
			show = false;
		} else {
			$('.showContent').hide();
			$(this).html('添加');
			show = true;
		}
	});
	$('.pspath').change(function(){
		if($(this)[0].files.length>1) {
			$(this).prev().prev().val("选中"+$(this)[0].files.length+"个文件");
		} else {
			$(this).prev().prev().val($(this).val());
		}
		var docObj = document.getElementById("pspath");
        var dd = document.getElementById("showImg"); 
		preview(docObj, dd, 'show');
		
	});
	$('.showContent .remove').click(function(){
		$(this).prev().find('input').val('');
		$(this).parent().parent().next().html('');
	});
	//修改图片展示
	$('.showContent .upload').click(function(){
		var v = $(this).prev().prev().find('input:last');
		if(v.val()==""||v.val()==null) {
			alert('您未选择任何图片！');
			return false;
		}
		var pid = $(this).next().val();
		$.ajaxFileUpload({
			url: "${pageContext.request.contextPath}/adminProduct_editShow.action",
    		fileElementId: "pspath",
    		data: {pid:pid},
    		dataType: "json",
    		success: function(data){
				var content = "";
				$.each(data, function(index, item) {
					content += '<li><img src="'+ item.pspath +'" alt=""><a class="showBtn" psid="'+ item.sid +'">删除</a></li>';
				});
				$(content).appendTo($('.delShow'));
				$('.showContent .hid').find('input').val('');
				$('#showImg').html('');
    		}
		})
		
		
	});
	//修改商品详情
	$('.detailContent .upload').click(function(){
		var v = $(this).prev().prev().find('input:last');
		if(v.val()==""||v.val()==null) {
			alert('您未选择任何图片！');
			return false;
		}
		var pid = $(this).next().val();
		$.ajaxFileUpload({
			url: "${pageContext.request.contextPath}/adminProduct_editDetail.action",
    		fileElementId: "pdpath",
    		data: {pid:pid},
    		dataType: "json",
    		success: function(data){
				var content = "";
				$.each(data, function(index, item) {
					content += '<li><img src="'+ item.pdpath +'" alt=""><a class="detailBtn" pdid="'+ item.pdid +'">删除</a></li>';
				});
				$(content).appendTo($('.delDetail'));
				$('.detailContent .hid').find('input').val('');
				$('#detailImg').html('');
    		}
		})
		
		
	});
	
	//删除图片展示
	$('.showBtn').click(function(){
		if(confirm('确定删除吗？')) {
			var sid = $(this).attr('sid');
			var that = this;
			$.ajax({
				url: "${pageContext.request.contextPath}/adminProduct_deleteShow.action",
				type: "get",
				data: {sid:sid},
				success: function(data){
					if(data=="yes") {
						$(that).parent().remove();
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
				}
			});
		}
	});
	//删除商品详情
	$('.detailBtn').click(function(){
		if(confirm('确定删除吗？')) {
			var pdid = $(this).attr('pdid');
			var that = this;
			$.ajax({
				url: "${pageContext.request.contextPath}/adminProduct_deleteDetail.action",
				type: "get",
				data: {pdid:pdid},
				success: function(data){
					if(data=="yes") {
						$(that).parent().remove();
						alert("删除成功！");
					} else {
						alert("删除失败！");
					}
				}
			});
		}
	});

	// 商品详情
	var detail = true;
	$('.addDetail a').click(function(){
		if(show) {
			$('.detailContent').show();
			$(this).html('收起');
			show = false;
		} else {
			$('.detailContent').hide();
			$(this).html('添加');
			show = true;
		}
	});
	$('.pdpath').change(function(){
		if($(this)[0].files.length>1) {
			$(this).prev().prev().val("选中"+$(this)[0].files.length+"个文件");
		} else {
			$(this).prev().prev().val($(this).val());
		}
		var docObj = document.getElementById("pdpath");
        var dd = document.getElementById("detailImg"); 
		preview(docObj, dd, 'detail');
	});
	$('.detailContent .remove').click(function(){
		$(this).prev().find('input').val('');
		$(this).parent().parent().next().html('');
	});

	//选中一级分类后查询相应二级分类
    $('.category').change(function(){
    	var cid = $(this).val();
    	if(cid!="0") {
    		$.ajax({
    			url: "${pageContext.request.contextPath}/adminProduct_findCategorySecond.action?cid="+cid,
    			type: "get",
    			success: function(data) {
    				var json = JSON.parse(data);
    				var content = "<option value='0' selected>请选择</option>";
    				$.each(json, function(index, item){
    					content += "<option value='"+ item.csid +"'>" + item.csname + "</option>"
    				});
    				
    				$('.categorySecond').html(content);
    			}
    		});
    	} else {
    		var content = "<option value='0' selected>请选择</option>";
    		$('.categorySecond').html(content);
    	}
    });
	
    
    
    
    $('.headBtn').click(function(){
    	if($(this).prev().val()==""&&$(this).prev().val()==null) {
    		alert("未选择图片！");
    		return false;
    	}
    	var pid = $("#infoPid").val();
    	var that = this;
    	$.ajaxFileUpload({
    		url: "${pageContext.request.contextPath}/adminProduct_editImg.action",
    		fileElementId: "spath",
    		data: {pid:pid},
    		dataType: "text",
    		success: function(data){
    			if(data!=null&&data!=""){
    				$(that).parent().prev().find('img').attr('src', data);
    				$('.headContent').hide();
    				head = true;
    				$('.headImg a').html('修改');
    			} else {
    				alert('上传失败！');
    			}
    		}
    	});
    });
    
    
    
    

	// 图片预览
	function preview(docObj, dd, content) {
        dd.innerHTML = "";
        var fileList = docObj.files;
        for (var i = 0; i < fileList.length; i++) {    
            dd.innerHTML += "<img id='"+ content + i + "'  />";
            var imgObjPreview = document.getElementById(content+i); 
            if (docObj.files && docObj.files[i]) {
                //火狐下，直接设img属性
                //imgObjPreview.src = docObj.files[0].getAsDataURL();
                //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式
                imgObjPreview.src = window.URL.createObjectURL(docObj.files[i]);
            }

            else {
                //IE下，使用滤镜
                docObj.select();
                var imgSrc = document.selection.createRange().text;
                var localImagId = document.getElementById(content + i);
                //图片异常的捕捉，防止用户修改后缀来伪造图片
                try {
                    localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                    localImagId.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
                }
                catch (e) {
                    alert("您上传的图片格式不正确，请重新选择!");
                }
                imgObjPreview.style.display = 'none';
                document.selection.empty();
            }
        }  
    }
});