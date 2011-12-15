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

  // Remove the parent li on delete.
	$('a[data-method="delete"]').live('ajax:success',
    function(e, data, textStatus, jqXHR) {
      if (data.message == 'Success') {
        $(this).parents("li").remove();
      }
    }
  );
  
});