$(function(){
	$('.edit').live('click', function(){
		$(this).toggle();
		$(this).next().toggle();
	});
	$('.merge').live('click', function(){
		$(this).parent().toggle();
		$(this).parent().prev().toggle();
	});
	// 编辑
	$('.sBtn').live('click', function(){
		var flag = true;
		if($(this).prev().prev().val()==""||$(this).prev().prev().val()==null) {
			$(this).prev().prev().css('border', '1px solid #e14041');
			flag = false;
		}
		if(!flag) {
			return false;
		} else {
			var csname = $(this).prev().prev().val();
			var cid = $(this).prev().val();
			var csid = $(this).prev().prev().prev().val();
			var that = this;
			$.ajax({
				url: "${pageContext.request.contextPath}/adminCategorySecond_categorySecondEdit.action",
				type: "post",
				data: {csname:csname,cid:cid,csid:csid},
				success: function(data) {
					if(data=="yes") {	
						$(that).parent().prev().prev().prev().text(csname);
						$(that).parent().toggle();
						$(that).prev().prev().val('');
						$(that).parent().prev().toggle();
					}
				}
			});
		}
		
		
	});
	//添加
	$('.btn').click(function(){
		var flag = true;
		if($(this).prev().find('.categorySecond').val()==""||$(this).prev().find('.categorySecond').val()==null) {
			$(this).prev().find('.categorySecond').css('border', '1px solid #e14041');
			flag = false;
		}
		if(!flag) {
			return false;
		} else {
			var that = this;
			var csname = $(this).prev().find('.categorySecond').val();
			var cid = $(this).prev().find('.category').val();
			$.ajax({
				url: "${pageContext.request.contextPath}/adminCategorySecond_categorySecondAdd.action",
				type: "post",
				data: $(that).prev().serialize(),
				success: function(data) {
					if(data!=null&&data!="") {
						var content = '<li><span>'+ csname +'</span><a class="delete">删除</a><a class="edit">编辑</a>'
						+'<div class="hid"><input type="hidden" name="csid" value="'+ data +'" class="csid"/>'
						+'<input type="text" name="csname" class="categorySecond"><input type="hidden" name="category.cid" value="'+ cid +'"/>'
						+'<a class="sBtn">确认</a><a class="merge">收起</a></div>;</li>';
						$(content).appendTo($(that).parent().parent().next());
						$(that).prev().find('.categorySecond').val('');
						$(that).parent().toggle();
						$(that).parent().prev().toggle();
					}
				}
			});
		}
		
		
	});
	
	$('.categorySecond').focus(function(){
		$(this).css('border', '1px solid #ccc');
	});
	$('.add').click(function(){
		$(this).hide();
		$(this).next().show();
	});
	
	//删除
	$('.delete').live('click', function(){
		if(confirm('确定删除吗？')) {
			var csid = $(this).next().next().find('.csid').val();
			var that = this;
			$.ajax({
				url: "${pageContext.request.contextPath}/adminCategorySecond_categorySecondDelete.action",
				type: "post",
				data: {csid:csid},
				success: function(data) {
					if(data=="yes") {
						$(that).parent().remove();
						alert('删除成功！');
					} else {
						alert('只有该二级分类分类下不存在商品才能删除这个二级分类！')
					}
				}
			});
		}
	});
	
});