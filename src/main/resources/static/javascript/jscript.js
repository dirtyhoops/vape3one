//for the sticky header navigation
$(window).scroll(function() {
	var scrollPos = $(this).scrollTop();
	
	if(scrollPos > 20) {
		$('#navigation1').addClass('fixed-nav');
		$('#navigation').removeClass('container');
		$('#wrapper1').addClass('addtopmargin');
//		$('#maincontentid').addClass('addtopmargin');
	} else {
		$('#navigation1').removeClass('fixed-nav');
		$('#navigation').addClass('container');
		$('#wrapper1').removeClass('addtopmargin');
//		$('#maincontentid').addClass('addtopmargin');
	}
});



//for image gallery
$(document).ready(function() {
	$('.smallimagebox img').on ({
		mouseover: function() {
			$(this).css({
				'cursor': 'pointer'
		/* 		'border-Color': 'pink'; */
			});
		}, 
		mouseout: function() {
			$(this).css({
				'cursor': 'default'
/* 						'border-Color': 'black' */
			});
		},
		click: function() {
			var imageUrl = $(this).attr('src');
			$('#mainImage').attr('src', imageUrl);
		}
	});
});
