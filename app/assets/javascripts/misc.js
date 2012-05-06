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
  
	$('.carousel').carousel({
	  interval: 8000
	});
	
	$('#sortable').sortable({
		handle: 'div.title',
		revert: true,
		update: function(){
			$.ajax({
				type: 'post',
				data: $('#sortable').sortable('serialize'),
				dataType: 'script',
				complete: function(request){
					$('#sortable').effect('highlight');
				},
				url: $('meta[name=sortable_path]').attr("content")
			});
		}
	});
	
});