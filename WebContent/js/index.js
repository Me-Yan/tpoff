$(function(){

	//提交搜索栏表单
	$('.searchButton').click(function(){
		var val = $('.keywords').val();
		if(val!='' && val!=null) {
			$('#keyForm').serialize();
			$('#keyForm').submit();
		}
	});
	
	
	//让轮播图的第一张图显示
	$('.ck-slide-wrapper li:first').show();
	//展示的商品名称过长进行隐藏
	$('.rightIntroduce p:first').css('overflow', 'hidden');
	
	
	/*控制输入框获取、失去焦点时的边框颜色*/
	$('.keywords').focus(function(){
		$(this).css('border', '1px solid #1E90FF');
	}).blur(function(){
		$(this).css('border', '1px solid #ccc');
	});

	var hideTime = null;
	/*控制菜单导航栏的隐藏、显示*/
	$('.menuListUl li').mouseover(function(){
		clearTimeout(hideTime);
		var hei = $(this).position().top;
		var wid = $(this).position().left + $(this).width();
		$('.menuDetail').hide().eq($(this).index()).show().css({'left':wid,'top':hei});
		$('.menuDetailList').show();
	});
	$('.menuListUl').mouseout(function(){
		hideDetail();
	});

	$('.menuDetailList').mouseover(function(){
		clearTimeout(hideTime);
	}).mouseout(function(){
		hideDetail();	
	});

		/*隐藏二级分类*/
	function hideDetail(){
		hideTime = setTimeout(function(){
			$('.menuDetailList').hide();
			$('.menuDetailList .menuDetail').hide();
		}, 100);
	}

	/*首页鼠标悬停，图片放大*/
	$('.rightImg').mouseover(function(){
		$(this).find('img').stop();
		$(this).find('img').animate({height:'235px', width:'215px'}, 300);
	}).mouseout(function(){
		$(this).find('img').stop();
		$(this).find('img').animate({height:'220px', width:'199px'}, 300);
	});
});