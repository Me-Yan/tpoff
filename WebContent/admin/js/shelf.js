$(function(){
	var pid = null;
	// 上架
	$('.downshelf').click(function(event){
		event.preventDefault();
		$('.shelf').addClass('is-visible');
		pid = $(this).attr('pid');
	});
	
	//close popup
	$('.downCancel').click(function(){
		$('.shelf').removeClass('is-visible');
	});
	$('.shelf').click(function(event){
		if( $(event.target).is('.cd-popup-close') || $(event.target).is('.shelf') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
		}
	});
	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
    	if(event.which=='27'){
    		$('.shelf').removeClass('is-visible');
	    }
    });
	
	//确认上架按钮
	$('.downConfirm').click(function(){
		window.location.href = "${pageContext.request.contextPath}/adminProduct_productUp.action?pid="+pid;
	});
	
	//查询按钮
	$('.search form a').click(function(){
		if($('.search input').val()==""||$('.search input').val()==null) {
			$('.search input').css('border', '1px solid #e14041');
			return false;
		}
		$('#searchForm').serialize();
		$('#searchForm').submit();
	});
	$('.search input').focus(function(){
		$('.search input').css('border', '1px solid #ccc');
	});

});