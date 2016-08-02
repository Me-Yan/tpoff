$(function(){
	

	//默认地址显示的样式
	$('.addrList').mouseover(function(){
		$(this).css('background-color', '#eee');
		$(this).find('.two').css('display', 'inline');
	}).mouseout(function(){
		$(this).css('background-color', '#fff');
		$(this).find('.two').css('display', 'none');
	});

	
	//删除地址的二次确认
	$('.deleteBtn').click(function(){
		if(!confirm("确定删除地址？")) {
			return false;
		}
	});


	//-------------------------------------------------------

	//修改地址信息
	$('.editBtn').click(function(){
		distance($('.editPop'));
		$('.mask').fadeIn();
		$('.editPop').fadeIn();
		var val = $(this).parent().parent();
		$('.editPop').find('.popReceiver :input').val(val.find('.receiver').text());
		$('.editPop').find('.popPhone :input').val(val.find('.phone').text());
		$('.editPop').find('.popAddr :input').val(val.find('.addr').text());
		$('.editPop').find('.aid').val(val.find('.aid').val());
	});
	$('.close').click(function(){
		$('.editPop').fadeOut();
		$('.mask').fadeOut();
		$(':input').css('border', '1px solid #ccc');
	});
	$('.mask').click(function(){
		$('.editPop').fadeOut();
		$('.mask').fadeOut();
		$(':input').css('border', '1px solid #ccc');
	});

	//添加地址
	$('.addAddr').click(function(){
		distance($('.addPop'));
		$('.mask').fadeIn();
		$('.addPop').fadeIn();
	});
	$('.close').click(function(){
		$('.addPop').fadeOut();
		$('.mask').fadeOut();
	});
	$('.mask').click(function(){
		$('.addPop').fadeOut();
		$('.mask').fadeOut();
	});

	function distance(element){
		var h = screen.height;
		var w = screen.width;
		var htop = h * 0.5 - 300;
		var wleft = w * 0.5 - 260;
		element.css({'top': htop, 'left': wleft});
	}




	//弹窗表单提交
	$('.popEdit a').click(function(){
		validePopup($(this).parent().parent());
	});


	//弹窗校验
	function validePopup(element){
		var flag = true;
		element.find(':input').each(function(){
			if($(this).val()=='' || $(this).val()==null) {
				flag = false;
				$(this).css('border', '1px solid #e14041');
			} else {
				$(this).css('border', '1px solid #ccc');
			}
		});
		if(flag) {
			element.serialize();
			element.submit();
		}
	}
});