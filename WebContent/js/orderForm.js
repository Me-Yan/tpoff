$(function(){
	//隐藏、显示弹窗
	//添加地址
	$('.addAddr a').click(function(){
		distance($('.addPop'));
		$('.mask').fadeIn();
		$('.addPop').fadeIn();
	});
	$('.close').click(function(){
		$('.addPop').fadeOut();
		$('.mask').fadeOut();
		$(':input').css('border', '1px solid #ccc');
	});
	$('.mask').click(function(){
		$('.addPop').fadeOut();
		$('.mask').fadeOut();
		$(':input').css('border', '1px solid #ccc');
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
			$('#addressForm').serialize();
			$('#addressForm').submit();
		}
	}


	//选择地址
	$('.list').click(function(){
		$('.list').removeClass('chooseList');
		$(this).addClass('chooseList');
		$('.list input').each(function(){
			$(this).attr('disabled', 'disabled');
		});
		$(this).find('input').removeAttr('disabled');
	});



	//提交订单
	$('.conClick a').click(function(){
		var flag = false;
		$('.list').each(function(index, element) {
			var d = $(this).hasClass('chooseList');
			if(d) {
				flag = true;
			}
		});
		if(flag) {
			$('#orderForm').serialize();
			$('#orderForm').submit();
		} else {
			alert('请选择地址或添加地址！');
		}
	});
});