$( function() {

	setupPage();
	setupSeamlessNav();

});

function setupPage() {

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
}

function setupSeamlessNav() {

	var linkSelector = 'a.x-silo';
	var siloSelector = '#silo-root';
	var containerSelector = '#silo-root';
	
	function swapContent(href, after) {
		var $silo = $(siloSelector);
		var $container = $(containerSelector);
		var title = $(linkSelector + '[href="'+href+'"]').text();
		$container.addClass('x-silo-change');
		$.get(href, function(data) {
			var $got = $(data);
			$container.html($got.find(containerSelector).html()).removeClass('x-silo-change')
			$silo.attr('class', $got.find(siloSelector).attr('class'));
			console.log(title);
			if(title !== '') {
				$('.nav-silo-name').text(title);
			}
			setTimeout(after, 10);
		});
	}

	$(linkSelector).click(function(e) {
		var href = $(this).attr('href');
		swapContent(href, function(data) {
			setupPage();
			$('body').removeClass('navbar-expanded');
			history.pushState({}, null, href);
		});
		return false;
	});

	// when clicking back button
	window.onpopstate = function(e) {
		var state = window.event.state;
		var w = $(window).width();
		var href = window.location.href;

		e.preventDefault();
		swapContent(href, setupPage);
	}
}
