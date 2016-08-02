$(function(){
	$('.edit, .add').click(function(){
		$(this).toggle();
		$(this).next().toggle();
	});
	$('.merge').click(function(){
		$(this).parent().parent().toggle();
		$(this).parent().parent().prev().toggle();
	});
	// 校验
	$('.sBtn').click(function(){
		if($(this).prev().val()==""||$(this).prev().val()==null) {
			$(this).prev().css('border', '1px solid #e14041');
			return false;
		}
		
		var cid = $(this).prev().prev().val();
		var cname = $(this).prev().val();
		
		var that = this;
		$.ajax({
			url: "${pageContext.request.contextPath}/adminCategory_categoryEdit.action",
			type: "post",
			data: {cid:cid, cname:cname},
			success: function(data) {
				if(data=="yes") {
					$(that).parent().prev().prev().prev().text(cname);
					$(that).parent().toggle();
					$(that).parent().prev().toggle();
				} else {
					$(that).parent().toggle();
					$(that).parent().prev().toggle();
					alert('修改失败！');
				}
			}
		});
	});
	$('.category').focus(function(){
		$(this).css('border', '1px solid #ccc');
	});
	
	//添加一级分类
	$('.btn').click(function(){
		if($(this).prev().val()==""||$(this).prev().val()==null) {
			$(this).prev().css('border', '1px solid #e14041');
			return false;
		}
		
		$(this).parent().serialize();
		$(this).parent().submit();
		
	});
	
	//删除一级分类
	$('.delete').click(function(){
		if(confirm('确定删除该一级分类?')) {
			var cid = $(this).next().next().find('.cid').val();
			var that = this;
			$.ajax({
				url: "${pageContext.request.contextPath}/adminCategory_categoryDelete.action",
				type: "post",
				data: {cid:cid},
				success: function(data) {
					if(data=="yes") {
						$(that).parent().remove();
						alert("删除成功！");
					} else {
						alert("只有该一级分类分类下不存在二级分类及商品才能删除这个一级分类！");
					}
				}
			})
		}
	});
	
});