
$(function() {
	
	/* 메인 커다란 슬라이드 쇼 */
	var slideIndex = 1;
	showSlides();
	
	function showSlides() {
		var i;
		var slides = document.getElementsByClassName("mySlides");
		var dots = document.getElementsByClassName("dot");
		
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		/* $(".mySlides").attr("style","display:none");*/
		
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace("active", "");
		}
		/*$(".mySlides:nth-child("+(slideIndex)+")").attr("style","display:block");
    	$(".dots:nth-child("+(slideIndex)+")").addClass("active");*/
		
		slides[slideIndex - 1].style.display = " block";
		dots[slideIndex - 1].className += " active";
		
		setTimeout(showSlides, 3000);
	} 
	
	
	/* 메인 작은 슬라이드 쇼 */
	var idx = 0;        // idx : 슬라이드 번호
	var slidemax = 4;   // slidemax : 슬라이드 번호 최대값
	var pos = 315;      // pos : 슬라이드 하나 당 width
	
	function sliding(add) {     // add : 증가시킬 값(왼쪽으로 움직이려면 -1, 오른쪽으로 움직이려면 0)
		idx = idx + add;
		if(idx < 0) idx = slidemax;
		else if(idx > slidemax) idx = 0;
		$('.slide').stop().animate({'left' : -(idx*pos)+"px"}, "slow");
	}
	
	autoslide = setInterval(function() { sliding(1) }, 3000);
	
	function after() {
		setTimeout(function() {
			clearInterval(autoslide);  
			autoslide = setInterval(function() { sliding(1) }, 3000);
		}, 2000);
	}
	
	$('.round-5 > .round').click(function() {
		clearInterval(autoslide);  
		idx = $(this).index(); 
		sliding(0);
		after();
	});
	
	
});

