$( function() {
	$('.slider-main').nivoSlider({
		pauseTime: 5000,
		animSpeed: 750,
		effect: 'fade',
		slices: 1,
	});

	$('.image-gallery').justifiedGallery({
		rowHeight: 150,
		margins: 2,
	}).on('jg.complete', function (e) {
	    
	});;

	$('.image-gallery a').colorbox({
		maxWidth: '95%',
		maxHeight: '95%',
	});
});