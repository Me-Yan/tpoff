$(function(){

	$('.change').click(function(){		
		var flag = $(this).next().hasClass('hidDiv');
		if(flag) {
			$(this).next().removeClass('hidDiv').addClass('showDiv');
			$(this).text('收起');
		} else {
			$(this).next().removeClass('showDiv').addClass('hidDiv');
			$(this).text('更换');
		}
	});

	$('.spath').change(function(){
		$(this).prev().prev().val($(this).val());
	});

	// 上传验证
	$('.upload').click(function(){
		if($(this).prev().find('.spath').val()==''||$(this).prev().find('.spath').val()==null) {
			$('.formTip').addClass('is-visible');
			return false;
		}
		$(this).prev().serialize();
		$(this).prev().submit()
		
	});
	$('.formTip').click(function(event){
        if( $(event.target).is('.close') || $(event.target).is('.formTip')) {
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
        
    });
	
});