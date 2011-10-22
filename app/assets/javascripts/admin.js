// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-alerts-1.3.0
//= require jquery_ui
//= require fancybox

$(document).ready(function() {

	// Lightbox effect - overlay the title over the bottom left of the image.
	$("a[rel='lightbox']").fancybox({ titlePosition: 'inside' });
	
	// date picker
	$(".date_picker").datepicker({ dateFormat: 'MM dd, yy' });

});