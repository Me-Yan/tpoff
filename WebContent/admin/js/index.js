$(function(){
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;

		// Variables privadas
		var links = this.el.find('.link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}

	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();

		$next.slideToggle();
		$this.parent().toggleClass('open');

		if (!e.data.multiple) {
			$el.find('.submenu').not($next).slideUp().parent().removeClass('open');
		};
	}	

	var accordion = new Accordion($('#accordion'), false);

	// 管理人员下拉菜单
	$('.user').mouseover(function(){
		$(this).find('.userList').show();
		$(this).find('a i:last').removeClass('fa-chevron-down').addClass('fa-chevron-up');
	}).mouseout(function(){
		$(this).find('.userList').hide();
		$(this).find('a i:last').removeClass('fa-chevron-up').addClass('fa-chevron-down');
	});

	//让框架的高度为内容的高度
	var h = $(window).outerHeight() - $('.top').outerHeight();
	$('#navFrame').css('height', h+'px');

	// 点击菜单栏改变背景颜色
	$('.submenu a').click(function(){
		$('.submenu a').removeClass('navBg');
		$(this).addClass('navBg');
	});
	

});