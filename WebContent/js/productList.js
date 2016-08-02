$(function(){
	//加入购物车
    $('.lCart').click(function(){
        var pid = $(this).next().val();
        var subcount = $(this).next().next().val();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/cart_addToCart.action",
            data: {pid:pid, subcount:subcount},
            success: function(data){
            	var json = JSON.parse(data);	
                    if(json.flag=="yes") {
                        $('.successCart').show();
                        $('.successCart').animate({width:'300px'}, 400);
                        setTimeout(function(){
                            $('.successCart').animate({width:'0px'}, 400);
                        }, 1300);
                    }
                	$('.cart strong').text(json.count);
                },
        });
    });
});