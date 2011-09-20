$(document).ready(function() {

	// Lightbox effect - overlay the title over the bottom left of the image.
	$("a[rel='lightbox']").fancybox({
	  titlePosition: 'inside'
	});
	
	// date picker
	$(".date_picker").datepicker({ dateFormat: 'MM dd, yy' });

});