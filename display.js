// Dora Jambor
// My first attempts to get into JS
// Code is used for my personal website

// hide social icons with scroll down
$(window).scroll(function() {
	if ($(this).scrollTop()>0)
	{
		$('.icon').fadeOut();
	}
	else
	{
		$('.icon').fadeIn();
	}
});

// About -> hide home pic and bring in about section
function dropFunc1() {
	$('#image').fadeOut();
	$(".post-image-caption").fadeOut();
	$('#about').fadeIn();

}
function homeFunc() {
	$('#about').fadeOut();
	$('#image').fadeIn();
	$(".post-image-caption").fadeIn();

}

window.onload = function() {
	$('#about').hide()
}

// function dropFunc3() {
// 	document.getElementById("thoughts").classList.toggle('show');
// }

// window.onclick = function(event){
// 	if (!event.target.matches('.menu')) {
// 		var dropdowns = document.getElementsByClassName("dropdownList2");
// 		for (var i=0; i <dropdowns.length; i++) {
// 			var openDropdown = dropdowns[i];
// 			if (openDropdown.classList.contains('show')) {
// 				openDropdown.classList.remove('show');
// 			}
// 		}
// 	}
// }
