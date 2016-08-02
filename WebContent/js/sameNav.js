$(function(){

	//提交搜索栏表单
	$('.searchButton').click(function(){
		var va = $('.keywords').val();
		if(va!='' && va!=null) {
			$('#keyForm').serialize();
			$('#keyForm').submit();
		}
	});
	
	
	/*控制输入框获取、失去焦点时的边框颜色*/
	$('.keywords').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		$(this).css('border', '1px solid #ccc');
	});

	
	
	$('.menuList').hover(function(){
		$('.menuListUl').css('border-right', '2px solid #e14041');
	});
	
	//商品分类隐藏、显示的切换
	var menu = null;

	//进入、离开商品分类
	$('.category').mouseover(function(){
		clearTimeout(menu);
		$('.headerBottom').show();
		$('.menuDetail').hide();
		$('.menuListUl').show();
	}).mouseout(function(){
		hideMenu();
	});

	//进入、离开菜单
	$('.menuListUl li').mouseover(function(){
		clearTimeout(menu);
		var hei = $(this).position().top;
		var wid = $(this).position().left + $(this).width();
		$('.menuDetail').hide().eq($(this).index()).show().css({'left':wid,'top':hei});
	});

	//进入、离开分类详情
	$('.menuDetail').mouseover(function(){
		clearTimeout(menu);
	}).mouseout(function(){
		hideMenu();
	});

	$('.menuListUl').mouseout(function(){
		hideMenu();
	});
	//经过指定时间隐藏菜单
	function hideMenu(){
		menu = setTimeout(function(){
			$('.headerBottom').hide();
			$('.menuDetail').hide();
			$('.menuListUl').hide();
		}, 100);
	}
});