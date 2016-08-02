$(function(){

	$('.spath, .pdpath, .pspath').change(function(){
        $(this).next().css('display', 'inline-block');
		if($(this)[0].files.length>1) {
			$(this).prev().prev().val("选中"+$(this)[0].files.length+"个文件");
		} else {
			$(this).prev().prev().val($(this).val());
		}
		if($(this).hasClass('pspath')) {
			var docObj = document.getElementById("pspath");
	        var dd = document.getElementById("showImg"); 
			preview(docObj, dd, 'show');
		} else if($(this).hasClass('pdpath')) {
			var docObj = document.getElementById("pdpath");
	        var dd = document.getElementById("detailImg"); 
			preview(docObj, dd, 'detail');
		}
	});

    // 移除图片
    $('.remove').click(function(){
        $(this).parent().parent().next().html('');
        $(this).prev().val('');
        $(this).prev().prev().prev().val('');
        $(this).hide();
    });
    
    //限制功效的字数
    $('.function').blur(function(){
    	if($(this).val().length>300) {
    		alert("字数不能超过300");
    	}
    });

    // 提交表单
    $('.sBtn').click(function(){
    	//input输入框
        $('input[class!="filename"]').each(function(){
            if($(this).val()==null||$(this).val()==''){
                $('.formTip').addClass('is-visible');
                return false;
            }
        });
        //下拉选择
        if($('select').val()=='0'||$('textarea').val()==''||$('textarea').val()==null) {
            $('.formTip').addClass('is-visible');
            return false;
        }
        //功效的字数长度
        if($('.function').val().length>300) {
        	alert("功效的字数已经超过300！");
        	return false;
        }

        $('#addForm').submit();
    });
    
    //close popup
    $('.formTip').click(function(event){
        if( $(event.target).is('.close') || $(event.target).is('.formTip')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    }); 

    // 重置表单
    $('.cBtn').click(function(){
        $('#showImg, #detailImg').html('');
        $('.remove').hide();
        $('input').val('');
        $('textarea').val('');
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