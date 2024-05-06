$(document).ready(function(){
	
	$('.cedulas-slides').cycle({
		fx: 'scrollHorz',		
		prev: '.cedulas-info .seta-esquerda a',
		next: '.cedulas-info .seta-direita a',
		timeout: 0,
		startingSlide: 0,
		before: function (currSlideElement, nextSlideElement) {			
			
			var slide =  $(nextSlideElement).parent().find('.cedulas-slide').index(nextSlideElement);
			
			var page = $('.cedulas .numero').get (slide);
			
			$('.cedulas .numero').not(page).stop(true, true).fadeOut({queue:false});
			
			$(page).stop(true, true).fadeIn({queue:false});
			
		}
		
	});
	
	
	
});

