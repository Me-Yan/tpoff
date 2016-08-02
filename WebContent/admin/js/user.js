$(function(){
	var emailFlag = true;
	var usernameFlag = true;
	var delId = null;

	//添加用户
	$('.addUser').click(function(event){
		event.preventDefault();
		$('.add').addClass('is-visible');
	});

	$('.addCancel').click(function(){
		$('.add').removeClass('is-visible');
	});
	
	//close popup
	$('.add').click(function(event){
		if( $(event.target).is('.addClose') || $(event.target).is('.add') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.add').removeClass('is-visible');
	    }
    });


    // 编辑用户
    $('.editUser').click(function(event){
		event.preventDefault();
		$('.edit').addClass('is-visible');
		getEdit($(this), $('#editForm'));
	});

	$('.editCancel').click(function(){
		$('.edit').removeClass('is-visible');
	});
	
	//close popup
	$('.edit').click(function(event){
		if( $(event.target).is('.editClose') || $(event.target).is('.edit') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.edit').removeClass('is-visible');
	    }
    });


    // 删除二次确认
    $('.delUser').click(function(event){
		event.preventDefault();
		$('.delete').addClass('is-visible');
		delId = $(this).parent().next().next().next().text();
	});
	$('.cancelBtn').click(function(){
		$('.delete').removeClass('is-visible');
	});
	
	//close popup
	$('.delete').click(function(event){
		if( $(event.target).is('.addClose') || $(event.target).is('.delete') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.delete').removeClass('is-visible');
	    }
    });
	//删除
	$('.delBtn').click(function(){
		window.location.href = "${pageContext.request.contextPath}/adminUser_deleteUser.action?uid="+delId;
	});


	// 添加、编辑校验
	// 用户名
	$('.username').blur(function(){
		usernameFlag = true;
		var username = $(this).val();
		if(username==""||username==null) {
			$(this).parent().next().text("* 用户名不能为空！");
		} else if(username.length<4||username.length>20) {
			$(this).parent().next().text("* 用户名为4-20个字符！");
		} else {
			var that = this;
			$.ajax({
				url: "${pageContext.request.contextPath}/user_findByUsername.action",
				type: "post",
				data: {username: username},
				success: function(data) {
					if(data==1) {
						$(that).parent().next().text("用户名已被注册！");
						usernameFlag = false;
					} else {
						$(that).parent().next().text("用户名可以使用！");
					}
				}
			});
		}
	});
	function valideUsername(element) {
		var username = element.val();
		if(username==""||username==null) {
			element.parent().next().text("* 用户名不能为空！");
			return false;
		} else if(username.length<4||username.length>20) {
			element.parent().next().text("* 用户名为4-20个字符！");
			return false;
		} else {
			element.parent().next().text("");
			return true;
		}
	}
	//添加密码
	$('.password').blur(function(){
		var password = $(this).val();
		if(password==""||password==null) {
			$(this).parent().next().text('* 密码不能为空！');
		} else if(password.length<6||password.length>16) {
			$(this).parent().next().text('* 密码为6-16个字符！');
		} else {
			$(this).parent().next().text('');
		}
	});
	function validePassword(element) {
		var password = element.val();
		if(password==""||password==null) {
			element.parent().next().text('* 密码不能为空！');
			return false;
		} else if(password.length<6||password.length>16) {
			element.parent().next().text('* 密码为6-16个字符！');
			return false;
		} else {
			element.parent().next().text('');
			return true;
		}
	}
	//编辑密码
	$('.editPassword').blur(function(){
		var password = $(this).val();
		if(password==""||password==null) {
			$(this).parent().next().text('* 为空表示不修改！');
		} else if(password.length<6||password.length>16) {
			$(this).parent().next().text('* 密码为6-16个字符！');
		} else {
			$(this).parent().next().text('');
		}
	});
	function valideEditPassword(element) {
		var password = element.val();
		if(password==""||password==null) {
			element.parent().next().text('* 为空表示不修改！');
			return true;
		} else if(password.length<6||password.length>16) {
			element.parent().next().text('* 密码为6-16个字符！');
			return false;
		} else {
			element.parent().next().text('');
			return true;
		}
	}
	//邮箱
	$('.email').blur(function(){
		emailFlag = true;
		var eReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		var email = $(this).val();
		if(email==""||email==null) {
			$(this).parent().next().text('* 邮箱不能为空！');
		} else if(!eReg.test(email)) {
			$(this).parent().next().text('* 邮箱格式错误！');
		} else {
			var that = this;
			$.ajax({
				url: "${pagContext.request.contextPath}/user_findByEmail.action",
				type: "post",
				data: {email: email},
				success: function(data) {
					if(data==1) {
						$(that).parent().next().text('邮箱已被注册！');
						emailFlag = false;
					} else {
						$(that).parent().next().text('邮箱可以使用！');
					}
				}
			});
			
		}
	});
	function valideEmail(element) {
		var eReg = /^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		var email = element.val();
		if(email==""||email==null) {
			element.parent().next().text('* 邮箱不能为空！');
			return false;
		} else if(!eReg.test(email)) {
			element.parent().next().text('* 邮箱格式错误！');
			return false;
		} else {
			element.parent().next().text('');
			return true;
		}
	}
	//手机号码
	$('.phone').blur(function(){
		var pReg = /^1\d{10}$/;
		var phone = $(this).val();
		if(phone!=""&&phone!=null&&!pReg.test(phone)) {
			$(this).parent().next().text('* 手机号码格式错误！');
		} else {
			$(this).parent().next().text('');
		}
	});
	function validePhone(element) {
		var pReg = /^1\d{10}$/;
		var phone = element.val();
		if(phone!=""&&phone!=null&&!pReg.test(phone)) {
			element.parent().next().text('* 手机号码格式错误！');
			return false;
		} else {
			element.parent().next().text('');
			return true;
		}
	}

	//将用户信息填充到编辑表单中
	function getEdit(element, el) {
		var username = element.parent().parent().find('li:nth-child(2)').text();
		var realname = element.parent().next().text();
		var gender = element.parent().parent().find('li:nth-child(3)').text();
		var province = element.parent().next().next().text();
		var phone = element.parent().parent().find('li:nth-child(5)').text();
		var email = element.parent().parent().find('li:nth-child(4)').text();
		var state = element.parent().parent().find('li:nth-child(7)').text();
		var uid = element.parent().next().next().next().text();

		el.find('.username').val(username);
		el.find('.realname').val(realname);

		el.find('.gender option').removeAttr('selected');
		if(gender=="未填写") {
			el.find('.gender option[value=""]').attr('selected', 'selected');
		} else {
			el.find('.gender option[value="'+gender+'"]').attr('selected', 'selected');
		}
		if(phone=="未填写") {
			el.find('.phone').val('');
		} else {
			el.find('.phone').val(phone);
		}
		

		el.find('.province').val(province);
		el.find('.email').val(email);
		el.find('.state option').removeAttr('selected');
		if(state=="未激活") {
			el.find('.state option[value="0"]').attr('selected', 'selected');
		} else {
			el.find('.state option[value="1"]').attr('selected', 'selected');
		}
		el.find('.uid').val(uid);
	}


	//添加，提交表单
	$('.addConfirm').click(function(){
		var flag = valideUsername($('#addForm .username')) & validePassword($('#addForm .password')) & valideEmail($('#addForm .email')) & validePhone($('#addForm .phone'));
		if(flag==1&&usernameFlag==true&&emailFlag==true) {
			$('#addForm').serialize();
			$('#addForm').submit();
		}
	});

	//编辑，提交表单
	$('.editConfirm').click(function(){
		var flag = valideUsername($('#editForm .username')) & valideEditPassword($('#editForm .password')) & valideEmail($('#editForm .email')) & validePhone($('#editForm .phone'));
		if(flag==1&&usernameFlag==true&&emailFlag==true) {
			$('#editForm').serialize();
			$('#editForm').submit();
		}
	});



    
});