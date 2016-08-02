$(function(){

	var h = screen.height * 0.4;
	$('.rotate').css('top', h);
	
	//减少数量
	$('.less').click(function(){
		var n1 = parseInt($(this).parent().find(':input').val());
		var buy = parseInt($(this).parent().find('.buy').text());
		var q1 = parseInt($(this).parent().find('.qd').text());
		var pid = $(this).parent().find('.pid').text();
		var that = this;
		if(isNaN(n1)){
			$(this).parent().find(':input').val(buy);
		} else if(n1<q1) {
			$(this).parent().find(':input').val(buy);
		} else if(n1==q1){
			$(this).parent().find(':input').val(q1);
		} else if(n1>q1) {
			$.ajax({
				url: "${pageContext.request.contextPath}/cart_less.action",
				type: "post",
				data: {pid:pid},
				beforeSend: function(){
					$('.rotate').show();
				},
				success: function(data){
					if(data=="yes") {
						$('.rotate').hide();
						n1 = n1 - 1;
						$(that).parent().find(':input').val(n1);
						total(n1, $(that));
						subTotal();
					}
				}
			});
		}
	});

	//增加数量
	$('.add').click(function(){
		var now = parseInt($(this).parent().find(':input').val());
		var buy = parseInt($(this).parent().find(':input').text());
		var q1 = parseInt($(this).parent().find('.qd').text());
		var pid = $(this).parent().find('.pid').text();
		var that = this;
		if(isNaN(now)) {
			$(this).parent().find(':input').val(buy);
		} else if(now<q1) {
			$(this).parent().find(':input').val(q1);
		} else {
			$.ajax({
				url: "${pageContext.request.contextPath}/cart_add.action",
				type: "post",
				data: {pid:pid},
				beforeSend: function(){
					$('.rotate').show();
				},
				success: function(data){
					if(data=="yes") {
						$('.rotate').hide();
						now = now + 1;
						$(that).parent().find(':input').val(now);
						total(now, $(that));
						subTotal();
					}
				}
			});				
		}
	});

	//小计
	function total(count, element){
		var price = parseFloat(element.parent().parent().find('.proPrice').text());
		var num = count * price;
		element.parent().parent().find('.proTotal').html(num.toFixed(2));
	}
	//总计
	function subTotal() {
		var sub = 0;

		$('.proTotal').each(function(){
			sub = parseFloat(sub) + parseFloat($(this).text());
		});
		$('.subtotal>span').html(sub.toFixed(2));
	}
	
	//删除购物车中商品的二次确认
	$('.delBtn').click(function(){
		if(!confirm("确定删除该商品？")) {
			return false;
		}
	});
	
});