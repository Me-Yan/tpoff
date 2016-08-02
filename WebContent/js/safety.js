$(function(){

	
	//修改密码
	$('.close').click(function(){
		$('.pwdPop, .emailPop, .phonePop, .confirmPop').fadeOut();
		$('.mask').fadeOut();
		$('.state').text('');
	});
	$('.mask').click(function(){
		$('.pwdPop, .emailPop, .phonePop, .confirmPop').fadeOut();
		$('.mask').fadeOut();
		$('.state').text('');
	});
	$('.editPwd').click(function(){
		distance($('.pwdPop'));
		$('.mask').fadeIn();
		$('.pwdPop').fadeIn();
		$('.pwdPop').find(':input').val('');
	});
	$('.editEmail').click(function(){
		distance($('.emailPop'));
		$('.mask').fadeIn();
		$('.emailPop').fadeIn();
		$('.emailPop').find(':input').val('');
	});
	$('.editPhone').click(function(){
		distance($('.phonePop'));
		$('.mask').fadeIn();
		$('.phonePop').fadeIn();
	});


	function distance(element){
		var h = screen.height;
		var w = screen.width;
		var htop = h * 0.5 - 300;
		var wleft = w * 0.5 - 260;
		element.css({'top': htop, 'left': wleft});
	}


	//表单验证------------------------------------------

	// 密码表单验证
	$('.old input').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()==''||$(this).val()==null) {
			$('.ostate').text('*  请输入旧密码！');
			$(this).css('border', '1px solid #ccc');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.ostate').text('');
		}
		
	});
	$('.new input').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()==''||$(this).val()==null) {
			$('.nstate').text('*  请输入新密码！');
			$(this).css('border', '1px solid #ccc');
		} else if($(this).val().length<6 || $(this).val().length>16) {
			$('.nstate').text('*  长度6-16字符！');
			$(this).css('border', '1px solid #ccc');
		} else if($(this).val()==$('.old input').val()) {
			$('.nstate').text('*  新旧密码不能一致！');
			$(this).css('border', '1px solid #ccc');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.nstate').text('');
		}
	});
	$('.confirmPwd').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()==''||$(this).val()==null) {
			$('.cstate').text('*  请确认新密码！');
			$(this).css('border', '1px solid #ccc');
		} else if($(this).val() != $('.new input').val()){
			$('.cstate').text('*  密码不一致！');
			$(this).css('border', '1px solid #ccc');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.cstate').text('');
		}
	});

	$('.pwdBtn').click(function(){
		var oldPwd = $('.old input').val();
		if(valideOld() & valideNew() & valideConfirm()){
			$.ajax({
				url: "${pageContext.request.contextPath}/user_checkPwd.action",
				type: "post",
				data: {oldPwd:oldPwd},
				success: function(data){
					if(data=="no") {
						$('.ostate').text('*  密码错误！');
						$('.old input').css('border', '1px solid #ccc');
					} else if(data=="yes") {
						$('#pwdForm').serialize();
						$('#pwdForm').submit();
					}
				}
			});			
		}
	})


	function valideOld(){
		if($('.old input').val()==''||$('.old input').val()==null) {
			$('.ostate').text('*  请输入旧密码！');
			$('.old input').css('border', '1px solid #ccc');
			return false;
		} else {
			$('.old input').css('border', '1px solid #ccc');
			$('.ostate').text('');
			return true;
		}
	}

	function valideNew(){
		if($('.new input').val()==''||$('.new input').val()==null) {
			$('.nstate').text('*  请输入新密码！');
			$('.new input').css('border', '1px solid #ccc');
			return false;
		} else if($('.new input').val().length<6 || $('.new input').val().length>16) {
			$('.nstate').text('*  长度6-16字符！');
			$('.new input').css('border', '1px solid #ccc');
			return false;
		} else if($('.new input').val()==$('.old input').val()) {
			$('.nstate').text('*  新旧密码不能一致！');
			$('.new input').css('border', '1px solid #ccc');
			return false;
		}  else {
			$('.new input').css('border', '1px solid #ccc');
			$('.nstate').text('');
			return true;
		}
	}

	function valideConfirm(){
		if($('.confirmPwd').val()==''||$('.confirmPwd').val()==null) {
			$('.cstate').text('*  请确认新密码！');
			$('.confirmPwd').css('border', '1px solid #ccc');
			return false;
		} else if($('.confirmPwd').val() != $('.new input').val()){
			$('.cstate').text('*  密码不一致！');
			$('.confirmPwd').css('border', '1px solid #ccc');
			return false;
		} else {
			$('.confirmPwd').css('border', '1px solid #ccc');
			$('.cstate').text('');
			return true;
		}
	}

	// 邮箱验证
	var em = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
	$('.email input').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()=='' || $(this).val()==null){
			$(this).css('border', '1px solid #ccc');
			$('.estate').text('*  请输入邮箱！');
		} else if(!(em.test($(this).val()))) {
			$(this).css('border', '1px solid #ccc');
			$('.estate').text('*  邮箱格式错误！');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.estate').text('');
		}
	});

	
	$('.emailBtn').click(function(){
		if(valideEmail()){
			var mail = $('.email input').val();
			$.ajax({
				url:"${pageContext.request.contextPath}/user_editEmail.action",
				type: "post",
				data: {email:mail},
				success: function(data) {
					if(data=="no") {
						$('.estate').text('*  邮箱已被注册！')
					} else if(data=="yes") {
						$('.estate').text('');
						$('.emailPop').fadeOut();
						$('.confirmPop span').text('请前去邮箱'+mail+'进行确认！');
						distance($('.confirmPop'));
						$('.confirmPop').fadeIn();
					}
				}
			});
		}
	})

	function valideEmail(){
		if($('.email input').val()=='' || $('.email input').val()==null){
			$('.email input').css('border', '1px solid #ccc');
			$('.estate').text('*  请输入邮箱！');
		} else if(!(em.test($('.email input').val()))) {
			$('.email input').css('border', '1px solid #ccc');
			$('.estate').text('*  邮箱格式错误！');
			return false;
		} else {
			$('.email input').css('border', '1px solid #ccc');
			$('.estate').text('');
			return true;
		}
	}

	// 手机号验证
	var p = /^1\d{10}$/;
	$('.telephone input').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).css('border', '1px solid #ccc');
			$('.pstate').text('*  请输入手机号！');
		} else if(!(p.test($(this).val()))) {
			$(this).css('border', '1px solid #ccc');
			$('.pstate').text('*  号码格式错误！');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.pstate').text('');
		}
	});
	$('#code').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		if($(this).val()=='' || $(this).val()==null) {
			$(this).css('border', '1px solid #ccc');
			$('.gstate').text('*  请输入验证码！');
		} else {
			$(this).css('border', '1px solid #ccc');
			$('.gstate').text('');
		}
	});


	$('.phoneBtn').click(function(){
		if(validePhone() & valideCode()) {
			$('#phoneForm').serialize();
			$('#phoneForm').submit();
		}
	});

	function validePhone() {
		if($('.telephone input').val()=='' || $('.telephone input').val()==null) {
			$('.telephone input').css('border', '1px solid #ccc');
			$('.pstate').text('*  请输入手机号！');
			return false;
		} else if(!(p.test($('.telephone input').val()))) {
			$('.telephone input').css('border', '1px solid #ccc');
			$('.pstate').text('*  号码格式错误！');
			return false;
		} else {
			$('.telephone input').css('border', '1px solid #ccc');
			$('.pstate').text('');
			return true;
		}
	}

	function valideCode(){
		if($('#code').val()=='' || $('#code').val()==null) {
			$('#code').css('border', '1px solid #ccc');
			$('.gstate').text('*  请输入验证码！');
			return false;
		} else {
			$('#code').css('border', '1px solid #ccc');
			$('.gstate').text('');
			return true;
		}
	}
});