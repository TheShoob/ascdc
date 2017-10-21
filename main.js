// JavaScript Document

var objIframe = document.getElementById('changeSrc');
function resizeContent() {
	'use strict';
	objIframe.style.height = 'auto';
	objIframe.style.height = objIframe.contentDocument.body.scrollHeight +'px';
}
$(window).resize(function() {
	'use strict';
	resizeContent();
});
$('iframe').on('load', function(){
	"use strict";
	resizeContent();
	$('li a').prev().removeClass('on');
	$('li a').prev().removeClass('under');
	$('li a').each(function(){
		if ($(this).attr('href') === window.location.hash) {
			$(this).prev().addClass('on');
			$(this).parents().prev('li.navLink').children('svg:first-child').addClass('under');
		}
	});
});		
$(window).on('hashchange', function() {
	'use strict';
	$('iframe').fadeOut(800,function(){
		objIframe.src = window.location.hash.substr(1);
		$('#loading').addClass('on');
		$('iframe').on('load', function(){
			$('#loading').removeClass('on');
			$('iframe').fadeIn(800);
			resizeContent();
		});
	});
});
$('.sidebar li a').next('svg').click(function() {
	'use strict';
	var numberChild = $(this).parent().next().children().length;
	var heightChild = $(this).parent().next().children().height();
	var total = (numberChild * heightChild);
	$(this).parent().next('li').css('max-height', 0 + 'px');
	$(this).toggleClass('open');
	$(this).parent().next().toggleClass('openSub');	
	do {
		$(this).parent().next('li.openSub').css('max-height', total + 'px');
		return false;
	}
	while ($(this).parent().next('li').hasClass('openSub'));
});
$('#menu-btn-left').click(function(e) {
	'use strict';
	if ($('#container').hasClass('center'))  {
		$('#container').addClass('open-sidebar-left');
		$('#container').removeClass('center');
		$('#menu-area-left div.menuBtn span').addClass('open');
		return false;
	}
	else if ($('#container').not('center')) {
		$('#container').addClass('center');
		$('#container').removeClass('open-sidebar-right');
		$('#container').removeClass('open-sidebar-left');
		$('#menu-area-left div.menuBtn span').removeClass('open');
		return false;
	}
	e.preventDefault();
});	
$('#menu-btn-right').click(function(e) {
	'use strict';
	if ($('#container').hasClass('center'))  {
		$('#container').addClass('open-sidebar-right');
		$('#container').removeClass('center');
		$('#menu-area-right div.menuBtn span').addClass('open');
		return false;
	}
	else if ($('#container').not('center')) {
		$('#container').addClass('center');
		$('#container').removeClass('open-sidebar-right');
		$('#container').removeClass('open-sidebar-left');
		$('#menu-area-right div.menuBtn span').removeClass('open');
		return false;
	}
	e.preventDefault();
});	
$('.swipeArea').swipe({
	swipeStatus:function(event, phase, direction) {
		'use strict';
		if ((phase==='move' && direction ==='right') && $('#container').hasClass('center'))  {
			$('#container').addClass('open-sidebar-left');
			$('#container').removeClass('center');
			$('#menu-area-right div.menuBtn span').addClass('open');
			$('#menu-area-left div.menuBtn span').removeClass('open');
			return false;
		}
		else if ((phase==='move' && direction ==='left') && $('#container').hasClass('center')) {
			$('#container').addClass('open-sidebar-right');
			$('#container').removeClass('center');
			$('#menu-area-left div.menuBtn span').addClass('open');
			$('#menu-area-right div.menuBtn span').removeClass('open');
			return false;
		}
		else if ((phase==='move') && $('#container').not('center')) {
			$('#container').addClass('center');
			$('#container').removeClass('open-sidebar-right');
			$('#container').removeClass('open-sidebar-left');
			$('#menu-area-right div.menuBtn span').removeClass('open');
			$('#menu-area-left div.menuBtn span').removeClass('open');
			return false;
		}
	},	
	triggerOnTouchEnd: true
}); 
$('document').ready(function() {
	'use strict';
	if  (window.location.href === 'http://ascdc.org/_dev/') {
		window.location.href = "http://ascdc.org/_dev/#home.html";
	}	
	objIframe.src = window.location.hash.substr(1);	
	//var current1 = 0,
	var $imgs1 = $('#rotator1 a img');
	//var imgAmount1 = $imgs1.length;
	$($imgs1.css('position', 'absolute').hide().get(0)).show();
	window.setInterval(swapImages1, 8000);
	function swapImages1() {
		var $currentImg1 = $('#rotator1 a img:visible');
		var $nextImg1 = $('#rotator1 a img:hidden').eq(Math.floor(Math.random() * $('#rotator1 a img:hidden').length));
		var speed1 = 300;
		// animation speed should be the same for both images so we have a smooth change
		$currentImg1.fadeOut(speed1);
		$nextImg1.fadeIn(speed1);
	}
	//var current2 = 1,
	var	$imgs2 = $('#rotator2 a img');
	//var imgAmount2 = $imgs2.length;
	$($imgs2.css('position', 'absolute').hide().get(1)).show();
	window.setInterval(swapImages2, 8000);
	function swapImages2() {
		var $currentImg2 = $('#rotator2 a img:visible');
		var $nextImg2 = $('#rotator2 a img:hidden').eq(Math.floor(Math.random() * $('#rotator2 a img:hidden').length));
		var speed2 = 300;
		// animation speed should be the same for both images so we have a smooth change
		$currentImg2.fadeOut(speed2);
		$nextImg2.fadeIn(speed2);
	}	
});



