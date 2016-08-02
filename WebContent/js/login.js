$(function(){

	//当输入框获取、失去焦点后的样式
	$('.loginInput').focus(function(){
		$(this).css('border','1px solid #6495ED')
	}).blur(function(){
		$(this).css('border', 'none');
	});


	//表单验证
	$('.loginBtn a').click(function(){
		var v1 = valideUsername();
		var v2 = validePwd();
		var v3 = valideCode();
		if(v1 & v2 & v3) {			
			var username = $('#username').val();
			var password = $('#password').val();
			var code = $('#code').val();
			
			$('#upError').html('').hide();
			$('#userError').html('').hide();
			$('#pwdErro').html('').hide();
			$('#codeErro').html('').hide();
			
			$.post("user_login.action", {username:username, password:password, code:code}, function(data){
				if(data=='code') {
					$('#codeError').html("验证码错误！").show();
				} else if(data=="unactive") {
					$('#upError').html("账号未激活，请激活后登录！").show();
				} else if(data=='up') {
					$('#upError').html('用户名或密码错误！').show();
				} else {
					window.location.href = "index.action";
				}
			});
		}
	});
	
	//验证用户名
	$('#username').blur(function(){
		if ($(this).val()==''||$(this).val()==null) {
			$('#userError').html("帐号不能为空！").show();
		} else {
			$('#userError').hide();
		}
	});

	function valideUsername(){
		if ($('#username').val()==''||$('#username').val()==null) {
			$('#userError').html("帐号不能为空！").show();
			return false;
		}
		return true;
	}

	//验证密码
	$('#password').blur(function(){
		if ($(this).val()==''||$(this).val()==null) {
			$('#pwdError').html("密码不能为空！").show();
		} else {
			$('#pwdError').hide();
		}
	});

	function validePwd(){
		if ($('#password').val()==''||$('#password').val()==null) {
			$('#pwdError').html("密码不能为空！").show();
			return false;
		}
		return true;
	}

	//验证验证码
	$('#code').blur(function(){
		if ($(this).val()==''||$(this).val()==null) {
			$('#codeError').html("验证码不能为空！").show();
		} else {
			$('#codeError').hide();
		}
	});

	function valideCode(){
		if ($('#code').val()==''||$('#code').val()==null) {
			$('#codeError').html("验证码不能为空！").show();
			return false;
		} else {
			return true;
		}
	}
	
	
});