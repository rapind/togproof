$(document).ready(function() {
	
	// colorbox effect on any links with rel="colorbox"
	$('a[rel*=colorbox]').colorbox();
	
	// disable right click save as dialog for images
	// just makes it a little harder to copy low res images
	$("img").noContext();
	
});