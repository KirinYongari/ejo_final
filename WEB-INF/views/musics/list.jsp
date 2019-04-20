<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<%@ include file="../include/main-nav.jsp"%>

<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
.city {display:none}
.info-table {
	    padding: 6px 0px 6px 0px;
}

.audio.green-audio-player {
  width: 400px;
  min-width: 300px;
  height: 56px;
  box-shadow: 0 4px 16px 0 rgba(0, 0, 0, .07);
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-left: 24px;
  padding-right: 24px;
  border-radius: 4px;
  user-select: none;
  -webkit-user-select: none;
  background-color: #fff;
  }
  .play-pause-btn {
    display: none;
    cursor: pointer;
  }
  .audio.green-audio-player .spinner {
    width: 18px;
    height: 18px;
    background-image: url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/355309/loading.png);
    background-size: cover;
    background-repeat: no-repeat;
    animation: spin 0.4s linear infinite;
  }
  .audio.green-audio-player .slider {
    flex-grow: 1;
    background-color: #D8D8D8;
    cursor: pointer;
    position: relative;
    }
    .audio.green-audio-player .progress1 {
      background-color: #44BFA3;
      border-radius: inherit;
      position: absolute;
      pointer-events: none;
      }
      .audio.green-audio-player .pin {
        height: 16px;
        width: 16px;
        border-radius: 8px;
        background-color: #44BFA3;
        position: absolute;
        pointer-events: all;
        box-shadow: 0px 1px 1px 0px rgba(0,0,0,0.32);
      }
 
  .controls {
    font-family: 'Roboto', sans-serif;
    font-size: 16px;
    line-height: 18px;
    color: #55606E;
    display: flex;
    flex-grow: 1;
    justify-content: space-between;
    align-items: center;
    margin-left: 24px;
    margin-right: 24px;
    }
    .controls .slider {
      margin-left: 16px;
      margin-right: 16px;
      border-radius: 2px;
      height: 4px;
      }
      .controls .progress1 {        
        width: 0;
        height: 100%;
        }
        .controls .pin {
          right: -8px;
          top: -6px;
          }
 
    .audio.green-audio-player span {
      cursor: default;
    }
 
 .volume {
    position: relative;
   }
    .volume-btn {
      cursor: pointer;
      }
      .open path {
        fill: #44BFA3;
      }
  
    .volume-controls {
      width: 30px;
      height: 135px;
      background-color: rgba(0, 0, 0, 0.62);
      border-radius: 7px;
      position: absolute;
      left: -3px;
      bottom: 52px;
      flex-direction: column;
      align-items: center;
      display: flex;
      }
     .volume-controls .hidden {
        display: none;
      }
      .volume-controls .slider {
        margin-top: 12px;
        margin-bottom: 12px;
        width: 6px;
        border-radius: 3px;
        }
        .volume-controls .progress1 {
          bottom: 0;
          height: 100%;
          width: 6px;
          }
          .volume-controls .pin {
            left: -5px;
            top: -8px;
          }
   
.audio.green-audio-player svg, .audio.green-audio-player img {
  display: block;
}



.modal-body {
  display: flex;
  justify-content: center;
  align-items: center;
  background: #F8FFAE;
  background: -webkit-linear-gradient(-65deg, #43C6AC, #F8FFAE);
  background: linear-gradient(-65deg, #43C6AC, #F8FFAE);
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

@keyframes spin {
  from {
    transform: rotateZ(0);
  }
  to {
    transform: rotateZ(1turn);
  }
}

/* 음악 플레이어  */
.planner-hide{
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	opacity: 0.6px;
}
.planner-close-hide{
	display:none;
	position: absolute;
	top: 50%;
	left: 50%;
	opacity: 0.6px;
}
.col-left{
	left: 63px;
}

body {
	background:#eee;
	font-family: Helvetica, sans-serif;
	font-size: 14px;
}

/* SCROLL BAR */ 

::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}
::-webkit-scrollbar-track {
    

}
::-webkit-scrollbar-thumb {
    -webkit-border-radius: 10px;
    border-radius: 10px;
    background: rgba(150,150,150,0.8);  
}




.playcontainer {
	margin: auto;
	position: relative; left: 681px; top: -592px;
	margin-top: 20px;
  margin-bottom: 40px;
	width: 300px;
	-moz-box-shadow: 3px 3px 45px 10px #555;
	-webkit-box-shadow: 3px 3px 45px 10px #555;
	-o-box-shadow: 3px 3px 45px 10px #555;
	box-shadow: 3px 3px 45px 10px #555;
}

.carousel {
	width: 300px;
	height: 325px;
	position: relative;
	background-image:url(http://audeficheux.com/projects/carousel/src/images/background0.png);
	background-size: cover;
	transition: background-image 0.5s ease;
}

/*Slides*/

.carousel .slides{
	position: absolute;
	top:0px;
	right: 0px;
	bottom:0;
	left:0;
	overflow: hidden;
}

.carousel .slides .items {
	position: relative;
	width: 10000px;
	font-size:0;
	padding-left: 37.5px;
	transition: all ease-out 0.3s;
}

.carousel .slides .item {
	margin: 25px 12.5px;
	width: 200px;
	height: 300px;
	display: inline-block;
	background-repeat: no-repeat;
}
.carousel .slides .item .image {
	height: 200px;
	width: 200px;
	-moz-box-shadow: 6px 9px 20px #111;
	-webkit-box-shadow: 6px 9px 20px #111;
	-o-box-shadow: 6px 9px 20px #111;
	box-shadow: 6px 9px 20px #111;
}


.carousel .slides .item p {
	font-size: 12px;
	color: white;
	width: 200px;
	position: absolute;
	top: 250px;
	text-align: center;
}

.carousel .slides .item .artist {
	font-weight: 300;
	font-size: 16px;
	height: 25px;
}

.carousel .slides .item .track {
	font-weight: 500;
	font-size: 14px;
	top : 275px;
}




/*Siblings*/

.carousel .siblings .sibling{
	position: absolute;
	width: 25px;
	height: 200px;
	top: 25px;
	background: transparent;
	text-align: center;
	line-height:40px;
	text-decoration: none;
}

.carousel .siblings .sibling.prev{
	left:0px;
}
.carousel .siblings .sibling.next{
	right:0px;
}

.carousel .siblings .play{
	position: absolute;
	width: 200px;
	height: 200px;
	top: 25px;
	left: 50px;
	background-image: url(http://audeficheux.com/projects/carousel/src/images/play.png);
	background-repeat: no-repeat;
	background-position: center;
	text-align: center;
	line-height:40px;
	text-decoration: none;
	transition: all 0.8s ease;
}

.carousel .siblings .play.invisible{
	background-image: none;
	transition: all 0.8s ease;
}

.carousel .siblings .play.invisible:hover{
	background-image: url(http://audeficheux.com/projects/carousel/src/images/pause.png);;
}


/*Seek Bar */

.carousel .seek-bar {
	position: absolute;
	top: 315px;
	width: 100%;
	height: 10px;
	background-color: rgba(0,0,0,0.2);
}

.carousel .seek-bar .progress-bar {
	background-color: rgba(30,30,30,0.6);
	width: 100%;
	height: 100%;
	-webkit-transform: scaleX(0);
	   -moz-transform: scaleX(0);
	    -ms-transform: scaleX(0);
	     -o-transform: scaleX(0);
	        transform: scaleX(0);
	-webkit-transform-origin: 0;
	   -moz-transform-origin: 0;
	    -ms-transform-origin: 0;
	     -o-transform-origin: 0;
	        transform-origin: 0;
	-webkit-transition: transform 0.2s;
	   -moz-transition: transform 0.2s;
	    -ms-transition: transform 0.2s;
	     -o-transition: transform 0.2s;
	        transition: transform 0.2s;
}


/* SONG LIST */


.playcontainer .choice {
	width: 300px;
	height: 200px;
	background-color: white;
}

.playcontainer .choice .tracks {
	height: 170px;
	overflow: scroll;

}


.playcontainer .choice .title{
	width: 290px;
	height: 30px;
	border-bottom: 1px solid #ccc;
	padding-left: 10px;
}

.playcontainer .choice .title p{
	height: 30px;
	line-height: 30px;
	vertical-align: middle;
	color: #555;
	font-size: 10px;
}


.playcontainer .choice .track{
	width: 250px;
	margin: auto;
	height: 67px;
	border-bottom: 1px solid #ccc;
	padding-left: 10px;
	font-weight: 300;
	cursor: pointer;
}

.playcontainer .choice .track div{
	display: inline-block;
}

.playcontainer .choice .track .number{
	line-height: 50px;
}

.playcontainer .choice .track .name{
	height: 30px;
	vertical-align: middle;
	padding-left: 25px;
}

.playcontainer .choice .track .name .song{
	margin-top: 4px;
	font-size: 12px;
}

.playcontainer .choice .track .speakers{
	height: 20px;
	width: 20px;
	background-image: url(http://audeficheux.com/projects/carousel/src/images/speaker.png);
	background-repeat: no-repeat;
	vertical-align: middle;
	float: right;
	margin-top: 24px;
}

.playcontainer .choice .track .speakers.invisible{
	display: none;
}


.credits {
  width:250px;
  text-align: center;
  margin: auto;
  margin-bottom: 10px;
  font-size: 12px;
  color: #555;
}

.credits a {
  text-decoration: none;
  color: black;
}
.perf-detail-img{
	width: 203px;
}

.video-postion{
   
    background: rgba(255, 255, 255,0)
}

</style>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">


function ajaxPut(musicNo){
	$.ajax({
		type:"get",
		url:"putMusicList.do",
		data:{musicNo:musicNo},
		dataType:"json",
		success: function(result){
			console.log(result);
			
			if(result.length ==0 ){
				location.href = "/jhta/home.do?error=fail";
			}
			var html = "";
			$.each(result,function(index,item){
				html+= '<input type="hidden" value="'+item.music.img+'" id="musicImg-'+(index)+'">';
				html+='<div class="item"><div class="image" style="background-image:url(../resources/images/album/'+item.music.img+')"></div> <p class="artist">'+item.music.artist+'</p><p class="track">'+item.music.title+'</p></div>';
			})
			$("#playlist-img").empty();
			$("#playlist-img").append(html);
		
			var radiohtml="";
			
			$.each(result,function(index,item){
				radiohtml+='<div class="track '+(index+1)+'">';
				radiohtml+='<div class="number">'+(index+1)+'</div>';
				radiohtml+='<div class="name"><p>'+item.music.artist+'</p><p class="song">'+item.music.title+'</p></div>';
				radiohtml+='<div class="speakers">';
				radiohtml+='<input type="hidden" value="'+item.music.filename+'" id="playlistItem-'+index+'">';
				radiohtml+='</div>';
				radiohtml+='</div>';
			})
			$("#playlist-audio").empty();
			$("#playlist-audio").append(radiohtml);
			
			var Carousel = function ( $target )
			{
				
				this.$ = {};
				this.$.container  	    = $target;
				this.$.carousel 		= this.$.container.find('.carousel');
				this.$.prev 	 		= this.$.container.find('.prev');
				this.$.next 		    = this.$.container.find('.next');
				this.$.play 		    = this.$.container.find('.play');
				this.$.slides_container = this.$.container.find('.slides .items');
				this.$.slides 			= this.$.slides_container.find('.item');
				this.$.seek_bar			= this.$.container.find('.seek-bar');
				this.$.progress_bar		= this.$.container.find('.progress-bar');

				this.$.choice			= this.$.container.find('.choice');
				this.$.tracks 			= this.$.choice.find('.tracks');
				this.$.track 			= this.$.tracks.find('.track');
				this.$.speakers			= this.$.track.find('.speakers');
				this.$.music			= this.$.container.find('.music');

				this.count = this.$.slides.length;
				this.init_events();
				
			};

			Carousel.prototype.index = 0;
			Carousel.prototype.count = 0;
			Carousel.prototype.progress_ratio = 0;
			Carousel.prototype.swipe = 0;

			Carousel.prototype.init_events = function (){
				var that = this;

				/* On click on the next and prev button, swipe the carousel */ 
				this.$.next.on('click', function(){
					that.next();
					return false;
				});
				this.$.prev.on('click', function(){
					that.prev();
					return false;
				});

				/* We click on one track name, change to that music and that image */ 
				this.$.track.each(function (data) {
			       	$(this).on('click', function (){
			       		
			       		that.go_to( data, $carousel.index);
			       	});
			    });

				this.changeMusic();


				/* CHECK WHEN WE CHANGE MUSIC ON KEYBOARD */
				$(window).keydown(function(evt) {
					if (evt.which == 39) {
						that.next();
						return false;
				  	}
				  	if (evt.which == 37) {
						that.prev();
						return false;
				  	}
				  	if (evt.which == 32) {
				  		play = !play;
						that.changeMusic();
						return false;
				  	}
				});

				/* CHECK WHEN WE PAUSE BY CLICKING ON THE IMAGE */
				this.$.play.on('click', function(){
					play = !play;
					that.changeMusic();
					return false;
				});


				this.$.speakers.on('click', function(){
					if (that.$.music[0].volume == 1) {
						that.$.music[0].volume = 0;
						that.$.speakers.css({
							"background-image": "url(http://audeficheux.com/projects/carousel/src/images/mute.png)"
						});
					}
					else {
						that.$.music[0].volume = 1;
						that.$.speakers.css({
							"background-image": "url(http://audeficheux.com/projects/carousel/src/images/speaker.png)"
						});
					}
				});

				/* CHECK WHEN THE MUSIC ENDS */ 
				this.$.music.bind('ended', function(){
					that.next();
				});


				/* FOR THE TOUCH CONTROL */
				this.$.carousel.on('touchstart',function(e){
					that.swipe = e.originalEvent.touches[0].clientX;
				});

				this.$.carousel.on('touchend',function(e){
					if (e.originalEvent.changedTouches[0].clientX > that.swipe + 10)
						that.prev();
					else if (e.originalEvent.changedTouches[0].clientX < that.swipe - 10)
						that.next();
					/* The + / - 10 allows to not swipe when we touch the screen without purpose*/
				});


				/**** SEEK BAR ****/
				window.setInterval(function () {
					this.progress_ratio = that.$.music[0].currentTime / that.$.music[0].duration;
				    that.$.progress_bar.css({
					  transform: "scaleX(" + progress_ratio + ")"
					});
				}, 50);

				/* Allows to change the current time of the song */ 
				this.$.seek_bar.on('click', function (e) {
				        var x = e.clientX - that.$.seek_bar.offset().left,
				        ratio = x / that.$.seek_bar.width(),
				        time = ratio * that.$.music[0].duration;
				    that.$.music[0].currentTime = time;
				});

			};


			Carousel.prototype.next = function()
			{
				this.go_to( this.index + 1, this.index);
			};

			Carousel.prototype.prev = function()
			{
				this.go_to( this.index - 1, this.index);

			};

			Carousel.prototype.go_to = function( index, currentIndex )
			{	
				if (currentIndex != index) { //Avoid to start over the audio by clicking on the current music and mute the audio

					index = index%this.count;
				
					if (index < 0)
						index = index + this.count;
					
					var musicImg = $("#musicImg-"+(index)+"").val();
					console.log(index);
					this.$.carousel.css({
						"background-image": "url(../resources/images/album/" + musicImg + ")"
					});

					/* Make visible or invisible the speakers*/
					this.$.speakers[currentIndex].classList.add('invisible');
					this.$.speakers[index].classList.remove('invisible');
					var filename = $("#playlistItem-"+(index)+"").val();
					/* Change the source of the music */
					this.$.music[0].setAttribute('src', '../resources/musics/'+ filename + '');
					
					this.changeMusic();

					/* Make the scroll follow the current music */
					$carousel.$.tracks.animate({scrollTop:50*index - 50},300);

					/* Animate the slider */ 
					this.$.slides_container.css({
					  transform: "translateX(" + (-225)*index + "px)"
					});
					this.index = index;

				}
			};

			Carousel.prototype.changeMusic = function()
			{	
				/* Play or pause the music */ 	
				if (play == true) {
					this.$.play[0].classList.add('invisible');
					this.$.music[0].play();
				}
				else {
					this.$.play[0].classList.remove('invisible');
					this.$.music[0].pause();
				}
			};

			var $carousel = new Carousel( $('.playcontainer ') );

			var play = false;
			
			
		}
	})
	
	
}




function ajaxOut(musicNo){
	$.ajax({
		type:"get",
		url:"outMusicList.do",
		data:{musicNo:musicNo},
		dataType:"json",
		success : function(result){
			console.log(result);
			if(result.length ==0  ){
				location.href = "/jhta/home.do?error=fail";
			}
			
			var html = "";
			$.each(result,function(index,item){
				html+= '<input type="hidden" value="'+item.music.img+'" id="musicImg-'+(index)+'">';
				html+='<div class="item"><div class="image" style="background-image:url(../resources/images/album/'+item.music.img+')"></div> <p class="artist">'+item.music.artist+'</p><p class="track">'+item.music.title+'</p></div>';
			})
			$("#playlist-img").empty();
			$("#playlist-img").append(html);
		
			var radiohtml="";
			
			$.each(result,function(index,item){
				radiohtml+='<div class="track '+(index+1)+'">';
				radiohtml+='<div class="number">'+(index+1)+'</div>';
				radiohtml+='<div class="name"><p>'+item.music.artist+'</p><p class="song">'+item.music.title+'</p></div>';
				radiohtml+='<div class="speakers">';
				radiohtml+='<input type="hidden" value="'+item.music.filename+'" id="playlistItem-'+index+'">';
				radiohtml+='</div>';
				radiohtml+='</div>';
			})
			$("#playlist-audio").empty();
			$("#playlist-audio").append(radiohtml);
			
			var Carousel = function ( $target )
			{
				
				this.$ = {};
				this.$.container  	    = $target;
				this.$.carousel 		= this.$.container.find('.carousel');
				this.$.prev 	 		= this.$.container.find('.prev');
				this.$.next 		    = this.$.container.find('.next');
				this.$.play 		    = this.$.container.find('.play');
				this.$.slides_container = this.$.container.find('.slides .items');
				this.$.slides 			= this.$.slides_container.find('.item');
				this.$.seek_bar			= this.$.container.find('.seek-bar');
				this.$.progress_bar		= this.$.container.find('.progress-bar');

				this.$.choice			= this.$.container.find('.choice');
				this.$.tracks 			= this.$.choice.find('.tracks');
				this.$.track 			= this.$.tracks.find('.track');
				this.$.speakers			= this.$.track.find('.speakers');
				this.$.music			= this.$.container.find('.music');

				this.count = this.$.slides.length;
				this.init_events();
				
			};

			Carousel.prototype.index = 0;
			Carousel.prototype.count = 0;
			Carousel.prototype.progress_ratio = 0;
			Carousel.prototype.swipe = 0;

			Carousel.prototype.init_events = function (){
				var that = this;

				/* On click on the next and prev button, swipe the carousel */ 
				this.$.next.on('click', function(){
					that.next();
					return false;
				});
				this.$.prev.on('click', function(){
					that.prev();
					return false;
				});

				/* We click on one track name, change to that music and that image */ 
				this.$.track.each(function (data) {
			       	$(this).on('click', function (){
			       		
			       		that.go_to( data, $carousel.index);
			       	});
			    });

				this.changeMusic();


				/* CHECK WHEN WE CHANGE MUSIC ON KEYBOARD */
				$(window).keydown(function(evt) {
					if (evt.which == 39) {
						that.next();
						return false;
				  	}
				  	if (evt.which == 37) {
						that.prev();
						return false;
				  	}
				  	if (evt.which == 32) {
				  		play = !play;
						that.changeMusic();
						return false;
				  	}
				});

				/* CHECK WHEN WE PAUSE BY CLICKING ON THE IMAGE */
				this.$.play.on('click', function(){
					play = !play;
					that.changeMusic();
					return false;
				});


				this.$.speakers.on('click', function(){
					if (that.$.music[0].volume == 1) {
						that.$.music[0].volume = 0;
						that.$.speakers.css({
							"background-image": "url(http://audeficheux.com/projects/carousel/src/images/mute.png)"
						});
					}
					else {
						that.$.music[0].volume = 1;
						that.$.speakers.css({
							"background-image": "url(http://audeficheux.com/projects/carousel/src/images/speaker.png)"
						});
					}
				});

				/* CHECK WHEN THE MUSIC ENDS */ 
				this.$.music.bind('ended', function(){
					that.next();
				});


				/* FOR THE TOUCH CONTROL */
				this.$.carousel.on('touchstart',function(e){
					that.swipe = e.originalEvent.touches[0].clientX;
				});

				this.$.carousel.on('touchend',function(e){
					if (e.originalEvent.changedTouches[0].clientX > that.swipe + 10)
						that.prev();
					else if (e.originalEvent.changedTouches[0].clientX < that.swipe - 10)
						that.next();
					/* The + / - 10 allows to not swipe when we touch the screen without purpose*/
				});


				/**** SEEK BAR ****/
				window.setInterval(function () {
					this.progress_ratio = that.$.music[0].currentTime / that.$.music[0].duration;
				    that.$.progress_bar.css({
					  transform: "scaleX(" + progress_ratio + ")"
					});
				}, 50);

				/* Allows to change the current time of the song */ 
				this.$.seek_bar.on('click', function (e) {
				        var x = e.clientX - that.$.seek_bar.offset().left,
				        ratio = x / that.$.seek_bar.width(),
				        time = ratio * that.$.music[0].duration;
				    that.$.music[0].currentTime = time;
				});

			};


			Carousel.prototype.next = function()
			{
				this.go_to( this.index + 1, this.index);
			};

			Carousel.prototype.prev = function()
			{
				this.go_to( this.index - 1, this.index);

			};

			Carousel.prototype.go_to = function( index, currentIndex )
			{	
				if (currentIndex != index) { //Avoid to start over the audio by clicking on the current music and mute the audio

					index = index%this.count;
				
					if (index < 0)
						index = index + this.count;
					
					var musicImg = $("#musicImg-"+(index)+"").val();
					console.log(index);
					this.$.carousel.css({
						"background-image": "url(../resources/images/album/" + musicImg + ")","width":"200px","height":"200px"
					});

					/* Make visible or invisible the speakers*/
					this.$.speakers[currentIndex].classList.add('invisible');
					this.$.speakers[index].classList.remove('invisible');
					var filename = $("#playlistItem-"+(index)+"").val();
					/* Change the source of the music */
					this.$.music[0].setAttribute('src', '../resources/musics/'+ filename + '');
					
					this.changeMusic();

					/* Make the scroll follow the current music */
					$carousel.$.tracks.animate({scrollTop:50*index - 50},300);

					/* Animate the slider */ 
					this.$.slides_container.css({
					  transform: "translateX(" + (-225)*index + "px)"
					});
					this.index = index;

				}
			};

			Carousel.prototype.changeMusic = function()
			{	
				/* Play or pause the music */ 	
				if (play == true) {
					this.$.play[0].classList.add('invisible');
					this.$.music[0].play();
				}
				else {
					this.$.play[0].classList.remove('invisible');
					this.$.music[0].pause();
				}
			};

			var $carousel = new Carousel( $('.playcontainer ') );

			var play = false;
		}
	})
}

	





$(function(){
	
	$( "#playList-div").draggable();
	
	
	$("#playList-forder").click(function(event){
		event.preventDefault();
		var audioPlayer = document.querySelector('.playcontainer');
		var player = audioPlayer.querySelector('audio');
		player.pause();
		$("#playList-div").hide();
	})
	
	/* 플레이 리스트 담기 */
	$("td").on("click","[id^=put-btn]" ,function(event){
		event.preventDefault();
		
		$("#playList-div").hide();
		
		var musicNo = $(this).attr("id").replace("put-btn-","");
		
		if(!($("[id=put-btn-"+musicNo+"]").find('i').hasClass('in'))){
			
			ajaxPut(musicNo);
			var ahtml = "";
			ahtml += '<span style="font-size: 2rem;">';
			ahtml += '<span style="color: Tomato;">';
			ahtml +=	'<i class="fas fa-folder-minus in"></i>';
			ahtml += '</span>';
			ahtml += '</span>';
			
			
			$("#planner-div").fadeIn(1000).fadeOut(1000).addClass("planner-hide");
			$("#playList-div").show();
		}else {
			ajaxOut(musicNo);
			var ahtml = "";
			ahtml += '<span style="font-size: 2rem;">';
			ahtml += '<span style="color: Tomato;">';
			ahtml +=	'<i class="fas fa-folder-plus"></i>';
			ahtml += '</span>';
			ahtml += '</span>';
			
			$("#planner-close-div").fadeIn(1000).fadeOut(1000).addClass("planner-close-hide");;
			$("#playList-div").show();
		}
		
			$("[id=put-btn-"+musicNo+"]").empty();
			$("[id=put-btn-"+musicNo+"]").append(ahtml);
		
			
			
		
	});
	
	
	/* 듣기 */
	$("#myModal").on("click","button",function(){
		console.log(this);
		var audioPlayer = document.querySelector('.green-audio-player');
		var player = audioPlayer.querySelector('audio');
		player.pause();
		
	})
	
	$("td").on("click","[id^=music-listen-btn]",function(event){
		event.preventDefault();
		var musicNo = $(this).attr("id").replace("music-listen-btn-","");
		$.ajax({
			type:"get",
			url:"musicListen.do",
			data:{musicNo:musicNo},
			dataType:"json",
			success:function(result){
				ajaxListen(result);
				console.log(result);
			}
			
		})
		
		
	})
//라디오 음악
	function ajaxListen(result){
		var html = "";
		$("#ajax-listen").empty();
	    
	      
	    html += '   <div class="modal-content">';
	   html += '    <div class="modal-header">';
	   html += '	          <button type="button" class="close" data-dismiss="modal">&times;</button>';
	   html += '	          <h4 class="modal-title">'+result.artist+'<'+result.title+'></h4>';
	   html += '	        </div>';
	    html += '	        <div class="modal-body">';
	       		
	    html += '		  <div class="audio green-audio-player">';
	    html += ' <div class="loading">';
	    html += '   <div class="spinner"></div>';
	    html += ' </div>';
	   	html += ' <div class="play-pause-btn">  ';
	   	html += '   <svg xmlns="http://www.w3.org/2000/svg" width="18" height="24" viewBox="0 0 18 24">';
	 	html += '     <path fill="#566574" fill-rule="evenodd" d="M18 12L0 24V0" class="play-pause-icon" id="playPause"/>';
	 	html += ' </svg>';
	 	html += '  </div>';
	  
	 	html += '  <div class="controls">';
	 	html += '   <span class="current-time">0:00</span>';
	 	html += '   <div class="slider" data-direction="horizontal">';
	 	html += '     <div class="progress1">';
	 	html += '       <div class="pin" id="progress-pin" data-method="rewind"></div>';
	 	html += '     </div>';
	 	html += '   </div>';
	 	html += '<span class="total-time">0:00</span>';
	 	html += '</div>';
	  
		 html += ' <div class="volume">';
	 	html += '  <div class="volume-btn">';
		html += '     <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">';
	 	html += '      <path fill="#566574" fill-rule="evenodd" d="M14.667 0v2.747c3.853 1.146 6.666 4.72 6.666 8.946 0 4.227-2.813 7.787-6.666 8.934v2.76C20 22.173 24 17.4 24 11.693 24 5.987 20 1.213 14.667 0zM18 11.693c0-2.36-1.333-4.386-3.333-5.373v10.707c2-.947 3.333-2.987 3.333-5.334zm-18-4v8h5.333L12 22.36V1.027L5.333 7.693H0z" id="speaker"/>';
	 	html += '    </svg>';
	 	html += '   </div>';
	 	html += '   <div class="volume-controls hidden" style="bottom:-62px; left:63px;">';
	 	html += ' <div class="slider" data-direction="vertical">';
	 	html += '   <div class="progress1">';
		html += '     <div class="pin" id="volume-pin" data-method="changeVolume"></div>';
		html += '   </div>';
		html += '  </div>';
		html += ' </div>';
		html += '  </div>';
	  
		html += '<audio crossorigin id="audio-option">';
		html += '  <source src="../resources/musics/'+result.filename+'" type="audio/mpeg">';
		html += '</audio>';
		html += '</div>    ';   
	         
	         
		html += '   </div>';
		html += '   <div class="modal-footer">';
		html += '      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>';
		html += '     </div>';
		html += '   </div>';
	      
		$("#ajax-listen").append(html);
		
		var audioPlayer = document.querySelector('.green-audio-player');
		var playPause = audioPlayer.querySelector('#playPause');
		var playpauseBtn = audioPlayer.querySelector('.play-pause-btn');
		var loading = audioPlayer.querySelector('.loading');
		var progress = audioPlayer.querySelector('.progress1');
		var sliders = audioPlayer.querySelectorAll('.slider');
		var volumeBtn = audioPlayer.querySelector('.volume-btn');
		var volumeControls = audioPlayer.querySelector('.volume-controls');
		var volumeProgress = volumeControls.querySelector('.slider .progress1');
		var player = audioPlayer.querySelector('audio');
		var currentTime = audioPlayer.querySelector('.current-time');
		var totalTime = audioPlayer.querySelector('.total-time');
		var speaker = audioPlayer.querySelector('#speaker');

		var draggableClasses = ['pin'];
		var currentlyDragged = null;

		window.addEventListener('mousedown', function(event) {
		  
		  if(!isDraggable(event.target)) return false;
		  
		  currentlyDragged = event.target;
		  let handleMethod = currentlyDragged.dataset.method;
		  
		  this.addEventListener('mousemove', window[handleMethod], false);

		  window.addEventListener('mouseup', () => {
		    currentlyDragged = false;
		    window.removeEventListener('mousemove', window[handleMethod], false);
		  }, false);  
		});

		playpauseBtn.addEventListener('click', togglePlay);
		player.addEventListener('timeupdate', updateProgress);
		player.addEventListener('volumechange', updateVolume);
		player.addEventListener('loadedmetadata', () => {
		  totalTime.textContent = formatTime(player.duration);
		});
		player.addEventListener('canplay', makePlay);
		player.addEventListener('ended', function(){
		  playPause.attributes.d.value = "M18 12L0 24V0";
		  player.currentTime = 0;
		});

		volumeBtn.addEventListener('click', () => {
		  volumeBtn.classList.toggle('open');
		  volumeControls.classList.toggle('hidden');
		})

		window.addEventListener('resize', directionAware);

		sliders.forEach(slider => {
		  let pin = slider.querySelector('.pin');
		  slider.addEventListener('click', window[pin.dataset.method]);
		});

		directionAware();

		function isDraggable(el) {
		  let canDrag = false;
		  let classes = Array.from(el.classList);
		  draggableClasses.forEach(draggable => {
		    if(classes.indexOf(draggable) !== -1)
		      canDrag = true;
		  })
		  return canDrag;
		}

		function inRange(event) {
		  let rangeBox = getRangeBox(event);
		  let rect = rangeBox.getBoundingClientRect();
		  let direction = rangeBox.dataset.direction;
		  if(direction == 'horizontal') {
		    var min = rangeBox.offsetLeft;
		    var max = min + rangeBox.offsetWidth;   
		    if(event.clientX < min || event.clientX > max) return false;
		  } else {
		    var min = rect.top;
		    var max = min + rangeBox.offsetHeight; 
		    if(event.clientY < min || event.clientY > max) return false;  
		  }
		  return true;
		}

		function updateProgress() {
		  var current = player.currentTime;
		  var percent = (current / player.duration) * 100;
		  progress.style.width = percent + '%';
		  
		  currentTime.textContent = formatTime(current);
		}

		function updateVolume() {
		  volumeProgress.style.height = player.volume * 100 + '%';
		  if(player.volume >= 0.5) {
		    speaker.attributes.d.value = 'M14.667 0v2.747c3.853 1.146 6.666 4.72 6.666 8.946 0 4.227-2.813 7.787-6.666 8.934v2.76C20 22.173 24 17.4 24 11.693 24 5.987 20 1.213 14.667 0zM18 11.693c0-2.36-1.333-4.386-3.333-5.373v10.707c2-.947 3.333-2.987 3.333-5.334zm-18-4v8h5.333L12 22.36V1.027L5.333 7.693H0z';  
		  } else if(player.volume < 0.5 && player.volume > 0.05) {
		    speaker.attributes.d.value = 'M0 7.667v8h5.333L12 22.333V1L5.333 7.667M17.333 11.373C17.333 9.013 16 6.987 14 6v10.707c2-.947 3.333-2.987 3.333-5.334z';
		  } else if(player.volume <= 0.05) {
		    speaker.attributes.d.value = 'M0 7.667v8h5.333L12 22.333V1L5.333 7.667';
		  }
		}

		function getRangeBox(event) {
		  let rangeBox = event.target;
		  let el = currentlyDragged;
		  if(event.type == 'click' && isDraggable(event.target)) {
		    rangeBox = event.target.parentElement.parentElement;
		  }
		  if(event.type == 'mousemove') {
		    rangeBox = el.parentElement.parentElement;
		  }
		  return rangeBox;
		}

		function getCoefficient(event) {
		  let slider = getRangeBox(event);
		  let rect = slider.getBoundingClientRect();
		  let K = 0;
		  if(slider.dataset.direction == 'horizontal') {
		    
		    let offsetX = event.clientX - slider.offsetLeft;
		    let width = slider.clientWidth;
		    K = offsetX / width;    
		    
		  } else if(slider.dataset.direction == 'vertical') {
		    
		    let height = slider.clientHeight;
		    var offsetY = event.clientY - rect.top;
		    K = 1 - offsetY / height;
		    
		  }
		  return K;
		}

		function rewind(event) {
		  if(inRange(event)) {
		    player.currentTime = player.duration * getCoefficient(event);
		  }
		}

		function changeVolume(event) {
		  if(inRange(event)) {
		    player.volume = getCoefficient(event);
		  }
		}

		function formatTime(time) {
		  var min = Math.floor(time / 60);
		  var sec = Math.floor(time % 60);
		  return min + ':' + ((sec<10) ? ('0' + sec) : sec);
		}

		function togglePlay() {
		  if(player.paused) {
		    playPause.attributes.d.value = "M0 0h6v24H0zM12 0h6v24h-6z";
		    player.play();
		  } else {
		    playPause.attributes.d.value = "M18 12L0 24V0";
		    player.pause();
		  }  
		}

		function makePlay() {
		  playpauseBtn.style.display = 'block';
		  loading.style.display = 'none';
		}

		function directionAware() {
		  if(window.innerHeight < 250) {
		    volumeControls.style.bottom = '-54px';
		    volumeControls.style.left = '54px';
		  } else if(audioPlayer.offsetTop < 154) {
		    volumeControls.style.bottom = '-164px';
		    volumeControls.style.left = '-3px';
		  } else {
		    volumeControls.style.bottom = '52px';
		    volumeControls.style.left = '-3px';
		  }
		}
		
	}
	
	
	$("div").on("click","#close-btn",function(){
		$("#id01").attr("style","display:none");
	})
	$("div").on("click","[id^=modal-btn]",function(){
		var title = $(this).attr("id").replace("modal-btn-","");
		
		if(title == 'imfor'){
			var musicNo = $("#album-input").val();
			ajaxMusicFunction(musicNo);
		}else if(title == 'album'){
		
			var albumNo = $("#music-input").val();
			ajaxAlbumFunction(albumNo);
		}
	})
	
	
	$(document).on("keyup", "#myInput", function(){
		var value = $(this).val();
		$("table tr").each(function(index){
			$row = $(this);
			$row.show();
			if(index !== 0 && value) {
				var found = false;
				$row.find("td").each(function(){
					var cell = $(this).text();
					if(cell.indexOf(value.toUpperCase())>=0){
						found = true;
						return
					}
				});
				if(found === true){
					$row.show();
				}
				else {
					$row.hide();
				}
			}
		})
	
	})
	
	/* 앨범 정보 및 곡 정보  */
	$("div").on("click","[id^=music-imfor]",function(evnet){
		event.preventDefault();
		var musicNo = $(this).attr("id").replace("music-imfor-","");
		ajaxMusicFunction(musicNo);
		
	})
	$("div").on("click","[id^=album-imfor]",function(event){
		event.preventDefault();
		
		var albumNo = $(this).attr("id").replace("album-imfor-","");
		ajaxAlbumFunction(albumNo);
	})
})
function ajaxMusicFunction(musicNo){
	
	
	$.ajax({
		type:"get",
		url:"musicModal.do",
		data:{musicNo:musicNo},
		dataType:"json",
		success:function(result){
			$("#modal-content").empty();
			console.log(result);
			ajaxMusic(result);
			$("#id01").attr("style","display:block");
			 
			  $(".tablink").removeClass("w3-light-grey");
		
			  $("#modal-btn-imfor").addClass("w3-light-grey");
		}
	})
}

function ajaxAlbumFunction(albumNo){
	console.log(albumNo);
	$.ajax({
		type:"get",
		url:"albumModal.do",
		data:{albumNo:albumNo},
		dataType:"json",
		success:function(result){
			$("#modal-content").empty();
			console.log(result);
			ajaxModal(result);
			$("#id01").attr("style","display:block");
		
			
			 $(".tablink").removeClass("w3-light-grey");
			  
			  $("#modal-btn-album").addClass("w3-light-grey");
		}
		
	})
}


function ajaxMusic(result){
	var html = "";
	html += '<div id="id01" class="w3-modal">';
	html += '<input type="hidden" value="'+result.album.no+'" id="music-input">';
	html += '<div class="w3-modal-content w3-card-4 w3-animate-zoom">';
	html +=  '<header class="w3-container w3-red"> ';
	html +=  '<span id="close-btn" class="w3-btn w3-red w3-border w3-border-red w3-round-large w3-xlarge w3-display-topright">&times;</span>';
	html +=   '<h2 style="padding: 0px 1px 10px 1px">곡정보</h2>';
	html +=  '</header>';

	html +=  '<div class="w3-bar w3-border-bottom">';
	html +=   '<button id="modal-btn-imfor" class="tablink w3-bar-item w3-button" >곡 정보</button>';
	html +=   '<button id="modal-btn-album" class="tablink w3-bar-item w3-button" >앨범 정보</button>';
	html +=  '</div>';

	html +=  '<div id="music" class="w3-container">';
	html +=   '<div class="w3-panel">';
	html +=   '<div class="row">';
	html +=   '	<div class="col-xs-3">';
	html +=   '	<img class="perf-detail-img" src="../resources/images/album/'+result.img+'" alt="'+result.title+'" />';
	html +=   '	</div>';
	html +=   '	<div class="col-xs-9 col-left">';
	html +=   '	<div class="perf_title">';
	html +=   '			<label class=""></label>';
	html +=   '			<h2>'+result.title+'</h2>';
	html +=   '		</div>';
	html +=   '			<br />';

	html +=   '		<table class="info-table" id="album-table">';
	html +=   '		<colgroup>';
	html +=   '				<col width="15%">';
	html +=   '					<col width="25%">';
	html +=   '				</colgroup>';
	html +=   '				<tr>';
	html +=   '					<td><strong>아티스트</strong></td>';
	html +=   '					<td>'+result.artist+'</td>';
	html +=   '				</tr>';
	
	html +=   '				<tr>';
	html +=   '					<td><strong>발매일</strong></td>';
	html +=   '					<td>'+result.years+'</td>';
	html +=   '				</tr>';
	
	html +=   '				<tr>';
	html +=   '					<td><strong>작곡</strong></td>';
	html +=   '					<td>'+result.composer+'</td>';
	html +=   '				</tr>';
	html +=   '				<tr>';
	html +=   '					<td><strong>재생시간</strong></td>';
	html +=   '					<td>'+result.lengths	+'</td>';
	html +=   '				</tr>';
	html +=   '				<tr>';
	html +=   '					<td><strong>좋아요</strong></td>';
	html +=   '					<td>';
	html +=' 	<a href="likeMusic.do?musicNo='+result.no+'&url=form">';
	html +='<span style="font-size: 2rem;">';
	html +=  '	  <span style="color: Tomato;">';
	html +=  '<i class="fas fa-heart"></i>';
	html +=  '</span></span>'+result.likes+'</a></td>';
	html +=   '				</tr>';
	html +=   '		</table>';
	html +=   '	</div>';
	html +=   '</div>';
	html +=   '</div>';
	html +=  '</div>';


	html +=  '<div class="w3-container w3-white w3-padding">';
	html +=   '<button class="w3-btn w3-right w3-white w3-border w3-border-red w3-round-large" id="close-btn">Close</button>';
	html +=  '</div>';
	html +=  '</div>';
	html +=  '</div>';
	
	$("#modal-content").append(html);
}

function ajaxModal(result){
	var musics = result.musics;
	var album = result.album;
	console.log(album);
	var html = "";
	html += '<div id="id01" class="w3-modal">';
	html += '<input type="hidden" value="'+album.music.no+'" id="album-input">';
	html += '<div class="w3-modal-content w3-card-4 w3-animate-zoom">';
	html +=  '<header class="w3-container w3-red"> ';
	html +=  '<span id="close-btn" class="w3-btn w3-red w3-border w3-border-red w3-round-large w3-xlarge w3-display-topright" >&times;</span>';
	html +=   '<h2 style="padding: 0px 1px 10px 1px">앨범 정보</h2>';
	html +=  '</header>';

	html +=  '<div class="w3-bar w3-border-bottom">';
	html +=   '<button id="modal-btn-imfor" class="tablink w3-bar-item w3-button" >곡 정보</button>';
	html +=   '<button id="modal-btn-album" class="tablink w3-bar-item w3-button" >앨범 정보</button>';
	html +=  '</div>';

	html +=  '<div id="album" class="w3-container">';
	
	html +=   '<div class="w3-panel">';
	html +=   '<div class="row">';
	html +=   '	<div class="col-xs-3">';
	html +=   '	<img class="perf-detail-img" src="../resources/images/album/'+album.coverImg+'" alt="'+album.title+'" />';
	html +=   '	</div>';
	html +=   '	<div class="col-xs-9 col-left">';
	html +=   '	<div class="perf_title">';
	html +=   '			<label class=""></label>';
	html +=   '			<h2>'+album.title+'</h2>';
	html +=   '		</div>';
	html +=   '			<br />';

	html +=   '		<table class="info-table" id="album-table">';
	html +=   '		<colgroup>';
	html +=   '				<col width="15%">';
	html +=   '					<col width="25%">';
	html +=   '				</colgroup>';
	html +=   '				<tr>';
	html +=   '				<td><strong>아티스트</strong></td>';
	html +=   '				<td>'+album.artist+'</td>';
	html +=   '				</tr>';
	html +=   '				<tr>';
	html +=   '					<td><strong>발매일</strong></td>';
	html +=   '					<td>'+album.year+'</td>';
	html +=   '				</tr>';
	html +=   '				<tr>';
	html +=   '				<td><strong>장르</strong></td>';
	html +=   '				<td>'+album.genre+'</td>';
	html +=   '			</tr>';
	html +=   '			<tr>';
	html +=   '				<td><strong>좋아요</strong></td>';
	html +=   '				<td>';
	
	// <i class="far fa-heart"></i> 
	
	
	html +=' 	<a href="likeAlbum.do?albumNo='+album.no+'&url=form">';
	html +='<span style="font-size: 2rem;">';
	html +=  '	  <span style="color: Tomato;">';
	html +=  '<i class="fas fa-heart"></i>';
	html +=  '</span>';
	html +=  '</span>'+album.likes+'</a></td>';
	html +=   '			</tr>';
	html +=   '		</table>';
	html +=   '	</div>';
	
	html +=   '	<div class="col-xs-2">';
	html +=   '	</div>';
	html +=   '	<div class="col-xs-9" style="padding-top: 55px;">';
	html +=  '<table class="table table-hover">';
	html +=   '		<colgroup>';
	html +=   '				<col width="10%">';
	html +=   '					<col width="25%">';
	html +=   '					<col width="10%">';
	html +=   '					<col width="10%">';
	html +=   '					<col width="10%">';
	html +=   '				</colgroup>';
	html +=  '<thead>';
	html +=  ' <tr>';
	html +=  '    <th>번호</th>';
	html +=  '    <th>곡정보</th>';
	html +=  '    <th>가수</th>';
	html +=  '     <th>좋아요</th>';
	html +=  '     <th>듣기</th>';
	html +=  '     <th>담기</th>';
	html +=  '   </tr>';
	html +=  '  </thead>';
	html +=  '<tbody>';
	$.each(musics,function(index,music){
		html +=  '  <tr>';
		html +=  '    <td>'+(index+1)+'</td>';
		html +=  '    <td>'+music.title+'</td>';
		html +=  '    <td>'+music.artist+'</td>';
		html +=  '    <td>';
		html +=' <a href="likeMusic.do?musicNo='+music.no+'&url=form"><span style="font-size: 2rem;">';
		html +=  '	  <span style="color: Tomato;">';
		html +=  '<i class="fas fa-heart"></i>';
		// <i class="far fa-heart"></i> 
		html +=  '</span>';
		html +=  '</span>'+music.likes+'';
		html += '</a></td>';
		html +=  '    <td><a href="javascript:void(0)" id="music-listen-btn-'+music.no+'" data-toggle="modal" data-target="#myModal">';
					if(music.filename == null){
		
					}else{
		html += '<span style="font-size: 2rem;"> <span style="color: Tomato;"> <i class="fas fa-music"></i></span></span>';
				}
		html += '</a></td>';
		html +=  '<td><a href="javascript:void(0)" id="put-btn-'+music.no+'">';
		html += '<span style="font-size: 2rem;"><span style="color: Tomato;">';
				if(!${empty LOGIN_USER} ){
					if(music.added == 'Y'){
		html += '<i class="fas fa-folder-minus in"></i>';
					} else {
		html += '<i class="fas fa-folder-plus"></i>';
						
					}
				}
		html += '</span>';
		html += '</span>';
		html += '</a></td>';
		html +=  '   </tr>';
		
	})
	html +=  '</tbody>';
	html +=  '</table>';
	html +=   '</div>';
	html +=   '</div>';
	html +=   '</div>';
	html +=  '</div>';
	
	html +=  '<div class="w3-container w3-white w3-padding">';
	html +=   '<button class="w3-btn w3-right w3-white w3-border w3-border-red w3-round-large" id="close-btn">Close</button>';
	html +=  '</div>';
	html +=  '</div>';
	html +=  '</div>';
	
	$("#modal-content").append(html);
	
	
}
/* $("[class=tablink]").click(); */
	
function openCity(evt, cityName) {
  var i, x, tablinks;
  x = document.getElementsByClassName("city");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < x.length; i++) {
    tablinks[i].classList.remove("w3-light-grey");
  }
  $("#"+cityName+"").attr("style","display:block")
  evt.currentTarget.classList.add("w3-light-grey");
}


</script>
<body class="w3-theme-l5">
<!-- Navbar -->


<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">나의 프로필</h4>
         <c:choose>
         	<c:when test="${empty LOGIN_USER }">
               <p class="w3-center"><img src="../resources/images/profile/basic-profile.jpg" class="w3-circle" style="height:106px;width:106px" alt=""></p>
         	</c:when>
         	<c:otherwise>
		         <p class="w3-center"><img src="../resources/images/profile/${LOGIN_USER.theme.img }" class="w3-circle" style="height:106px;width:106px" alt=""></p>
         	</c:otherwise>
         </c:choose>
          <c:if test="${empty LOGIN_USER }">
 	        <p class="text-center"><a href="#login" id="loginAnchor" class="loginTrigger btn_gnb btn_g_login" accesskey="L" title="로그인 후 이용해주세요">로그인을 해주세요</a></p>
         </c:if>
         <hr>
         <c:choose>
         	<c:when test="${!empty LOGIN_USER}">
	         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> 별명 :${user.nickname }</p>
	         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> 생일:${user.birthday }</p>
	         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i>최종로그인:<fmt:formatDate value="${user.lastAccessDate }" pattern="yyyy-MM-dd"/></p>
         	</c:when>
         	<c:otherwise>
	         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> </p>
	         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> </p>
	         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i></p>
				         		
         	</c:otherwise>
         </c:choose>
        </div>
      </div>
      <br>

      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Some other text..</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>
      </div>
      <br>

      <!-- Interests -->
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <p>Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">News</span>
            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
            <span class="w3-tag w3-small w3-theme-d3">Labels</span>
            <span class="w3-tag w3-small w3-theme-d2">Games</span>
            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
            <span class="w3-tag w3-small w3-theme">Games</span>
            <span class="w3-tag w3-small w3-theme-l1">Friends</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Design</span>
            <span class="w3-tag w3-small w3-theme-l4">Art</span>
            <span class="w3-tag w3-small w3-theme-l5">Photos</span>
          </p>
        </div>
      </div>
      <br>

      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>

    <!-- End Left Column -->
    </div>

    <!-- Middle Column -->
	
    	<div class="w3-col m8" style="padding-left:40px">
		  <h2>음악 차트</h2>
		  <p> 차트</p>
<!-- onkeyup="keywordFunction()" -->
		<form method="get" id="form-btn">
		  <input class="w3-input w3-border w3-padding" type="text" placeholder="Keyword Search..." id="myInput" name="keyword" value=${param.keyword }>

		  <table class="w3-table-all w3-margin-top" id="myTable">
		 
			    <tr class="text-center">
			      <th style="width:7%;">순위</th>
		          <th style="width:10%;"></th>
		          <th style="width:20%;">곡정보</th>
		          <th style="width:23%;">앨범</th>
		          <th style="width:10%;">좋아요</th>
		          <th style="width:10%;">듣기</th>
		          <th style="width:10%;">담기</th>
		          <th style="width:10%;">뮤비</th>
			    </tr>
		    	<c:forEach items="${musics }" var="music" varStatus="status">
		    		<tr>
		    		<c:if test="${param.cp <= 1 || param.cp == null}">
		    			<td>${status.count }</td>		    		
		    		</c:if>
		    		<c:if test="${param.cp > 1}">
		    			<td>${status.count + ((param.cp-1)*5) }</td>	
		    		</c:if>
		    			<td><img src="../resources/images/album/${music.img}" alt="${music.title }" style="width: 75px; height: 75px"></td>
		    			<td><a href="javascript:void(0)" id="music-imfor-${music.no}">${music.title }</a></td>
		    			<td><a href="javascript:void(0)" id="album-imfor-${music.album.no }">${music.album.title}</a></td>
		    			<td class="text-center">
		    			<a href="likeMusic.do?musicNo=${music.no }&url=form">
		    				<span style="font-size: 2rem;">
							  <span style="color: Tomato;">
		    					<i class="fas fa-heart"></i>
		    					<!-- <i class="far fa-heart"></i> -->
		    					</span>
		    				</span>
		    				${music.likes}
		    			</a>
		    			</td>
		    			<td><a href="javascript:void(0)" id="music-listen-btn-${music.no }" data-toggle="modal" data-target="#myModal">
		    				<c:choose>
		    					<c:when test="${empty music.filename}">
		    					
		    					</c:when>
									<c:otherwise>
											<span style="font-size: 2rem;"> <span
												style="color: Tomato;"> <i class="fas fa-music"></i>
											</span>
											</span>
									</c:otherwise>
							</c:choose>
							</a>
		    			</td>
		    			<td><a href="javascript:void(0)" id="put-btn-${music.no }">
		    				<span style="font-size: 2rem;">
							  <span style="color: Tomato;">
							  <c:if test="${!empty LOGIN_USER  }">
								  	<c:choose>
								  		<c:when test="${music.added eq 'Y' }">
									  		<i class="fas fa-folder-minus in"></i>
								  		</c:when>
										<c:otherwise>
								  			<i class="fas fa-folder-plus"></i>									
										</c:otherwise>							  	
								  	</c:choose>
							  </c:if>		
							  </span>
							</span>
							</a>
		    			</td>
		    			<td><a href="javascript:void(0)" id="video-btn-${music.no }">
		    			<c:choose>
	    					<c:when test="${empty music.video }">
	    					</c:when>
							<c:otherwise>
								<span style="font-size: 2rem;">
				  					<span style="color: Tomato;">
   										<i class="fab fa-youtube"></i>
   									</span>
   								</span>
							</c:otherwise>
						</c:choose>
		    			</a>
		    			</td>
		    		</tr>
		    	</c:forEach>
		  
		  </table>
		  	<input type="hidden" name="cp" value="1" id="cp-box">
			<div class="w3-bar text-center" id="page-btn">
			<c:if test="${pagination.cb gt 1 }">
			  <a href="javascript:keywordPagination(${pangination.prevBlock })" class="w3-button w3-hover-red">&laquo;</a>
			</c:if>
			<c:forEach var="num" begin="${pagination.beginPageIndex }" end="${pagination.endPageIndex }">
			  <a href="javascript:keywordPagination(${num })" class="w3-button w3-hover-red ${num eq pagination.cp ? 'active' : ''}">${num }</a>
			</c:forEach>
			  <c:if test="${pagination.cb lt pagination.totalBlocks }">
			  <a href="javascript:keywordPagination(${pangination.nextBlock })" class="w3-button w3-hover-red">&raquo;</a>
			</c:if>
			 
			</div>
		  </form>
		</div>
    </div>
    <!-- End Middle Column -->
    <!-- 모달 -->
    <div id="modal-content"></div>
    	<div id="id01" class="w3-modal">
	<div class="w3-modal-content w3-card-4 w3-animate-zoom">
	<header class="w3-container w3-blue"> 
	<span id="close-btn" class="w3-button w3-blue w3-xlarge w3-display-topright">&times;</span>
	<h2>Header</h2>
	</header>

	<div class="w3-bar w3-border-bottom">';
	<button id="modal-btn-imfor" class="tablink w3-bar-item w3-button" onclick="openCity(event, 'imfor')">imfor</button>
	<button id="modal-btn-album" class="tablink w3-bar-item w3-button" onclick="openCity(event, 'album')">Album</button>
	<button id="modal-btn-3" class="tablink w3-bar-item w3-button" onclick="openCity(event, 'Tokyo')">Tokyo</button>
	</div>

	<div id="album" class="w3-container city">
	<h1>Paris1111</h1>
	<p>Paris is the capital of France.</p>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
	</div>


	<div class="w3-container w3-light-grey w3-padding">
	<button class="w3-button w3-right w3-white w3-border" id="close-btn">Close</button>
	</div>
	</div>
	</div>
    
    
    
    </div>
	<div class="modal fade" id="myModal" role="dialog">
	<div class="modal-dialog" id="ajax-listen">
	

	</div>
	</div>


	<!-- Right Column -->


  <!-- End Grid -->


<!-- End Page Container -->

<br>

<!-- Footer -->
<footer class="w3-container w3-theme-d3 w3-padding-16">
  <h5>Footer</h5>
</footer>

<footer class="w3-container w3-theme-d5">
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
</footer>

<div class="planner-hide" id="planner-div">
		<span class="w3-tag w3-padding w3-pink w3-center">음악 플레이어에 추가되었습니다.</span>
	</div>
	
	<div class="planner-close-hide" id="planner-close-div">
		<span class="w3-tag w3-padding w3-pink w3-center">음악 플레이어에서 삭제되었습니다.</span>
</div>
	
	

<div class="playcontainer off" style="display: none" id="playList-div">
			<!-- CAROUSEL -->
			<span style="font-size: 3rem; display: block;" class="text-center">
			<span style="color: Tomato;"> 
			<a href="#" id="playList-forder">	<i class="fas fa-angle-double-down"></i></a>
			</span>
			</span>
			
			<div class="carousel">
				
				<!-- SLIDES -->
				<div class="slides">
					<div class="items" id="playlist-img">
						<c:forEach items="${playlistItems }" var="playlistItem" varStatus="status">
							<input type="hidden" value="${playlistItem.music.img }" id="musicImg-${((status.count)-1) }">
							<div class="item"><div class="image" style="background-image:url(../resources/images/album/${playlistItem.music.img })"></div> <p class="artist">${playlistItem.music.artist }</p><p class="track">${playlistItem.music.title }</p></div>
						</c:forEach>
					</div>
				</div>

				<!-- SIBLINGS (PREVIOUS - NEXT) -->
				<div class="siblings">
					<a href="#" class="sibling prev"></a>
					<a href="#" class="play"></a>
					<a href="#" class="sibling next"></a>
				</div>

				<div class="seek-bar">
	                <div class="progress-bar"></div>
	            </div>

			</div>



			<div class="choice">
				<div class="title">
					<p>SONGS</p>
				</div>
				<div class="tracks" id="playlist-audio">
					<c:forEach items="${playlistItems }" var="playlistItem" varStatus="status">
						<div class="track ${(status.count) }">
							<div class="number">${(status.count) }</div>
							<div class="name"><p>${playlistItem.music.artist }</p><p class="song">${playlistItem.music.title }</p></div>
							<div class="speakers">
							<input type="hidden" value="${playlistItem.music.filename }" id="playlistItem-${((status.count)-1) }">
							</div>
						</div>
					</c:forEach>
				
					
				</div>
			</div>
			<div id="playlist-filename">
			<c:forEach items="${playlistItems }" var="playlistItem" varStatus="status" begin="1" end="1">
			<audio class="music"><source src="../resources/musics/${playlistItem.music.filename }" type="audio/mp3"></audio>
			</c:forEach>
			</div>
		</div>	


<c:forEach items="${musics }" var="music" varStatus="status">
	
	<div id="video-hidden-${music.no }" style="display: none;" class="video-postion">
		<video src="../resources/videos/${music.video}" controls loop muted autoplay poster="../resources/images/album/${music.img }">브라우저가 지원하지 못할 시 표시할 내용
		
		</video>
		<span style="font-size: 3em" id="sapn-btn-video-${music.no }">
 			<i class="fas fa-times"  style="top: -325px;position: relative;left: 3px;"></i>
		</span>
	
	</div>
</c:forEach>

<script>

	

function keywordPagination(cp){
	cp = cp || 1;
	$("#cp-box").val(cp);
	$("#form-btn").action ="form.do";
	$("#form-btn").submit();
}


// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else {
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className =
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else {
    x.className = x.className.replace(" w3-show", "");
  }
}

$(function(){
	$("[id^=video-btn-]").click(function(event){
		event.preventDefault();
		var musicNo = $(this).attr("id").replace("video-btn-","");
		var musicThis = $("#video-hidden-"+musicNo+"");
		toggle_layer(musicThis);
	});
	
	
})

	
	function toggle_layer(musicThis) {
		
		if(musicThis.css("display") == "none"){
				var sWidth = window.innerWidth;
				var sHeight = window.innerHeight;

				var oWidth = $('#discount-panel').width();
				var oHeight = $('#discount-panel').height();

				// 레이어가 나타날 위치를 셋팅한다.
				var divLeft = event.clientX - 600;
				var divTop = event.clientY + 10;

				// 레이어가 화면 크기를 벗어나면 위치를 바꾸어 배치한다.
			 	if( divLeft + oWidth > sWidth ) divLeft -= oWidth;
				if( divTop + oHeight > sHeight ) divTop -= oHeight; 

				// 레이어 위치를 바꾸었더니 상단기준점(0,0) 밖으로 벗어난다면 상단기준점(0,0)에 배치하자.
				if( divLeft < 0 ) divLeft = 0;
				if( divTop < 0 ) divTop = 0;

				musicThis.css({
					"top": divTop,
					"left": divLeft,
					"position": "absolute"
				}).show();
				musicThis.draggable();
		}else{
			musicThis.hide();
		}
	}

	$("[id^=sapn-btn-video]").click(function(){
		$("[id^=video-hidden]").hide();
	})



</script>

</body>
</html>
