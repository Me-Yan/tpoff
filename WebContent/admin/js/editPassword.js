$(function(){
	$('.btn').click(function(){
		var flag = true;
		if($('.old').val()==""||$('.old').val()==null) {
			$('.old').next().html('* 不能为空！');
			flag = false;
		}
		if($('.new').val()==""||$('.new').val()==null) {
			$('.new').next().html('* 不能为空！');
			flag = false;
		}
		if($('.confirm').val()==""||$('.confirm').val()==null) {
			$('.confirm').next().html('* 不能为空！');
			flag = false;
		}
		if($('.confirm').val()!==$('.new').val()) {
			$('.confirm').next().html('* 两次密码不一致！');
			flag = false;
		}
		if(flag) {
			$('#editForm').serialize();
			$('#editForm').submit();
		}
	});
	$('input').focus(function(){
		$(this).next().html('');
		$('.content').html('');
	});
	$('.cancel').click(function(){
		$('input').val('');
		$('p span').html('');
	});
});