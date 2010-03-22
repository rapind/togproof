// Function for easily submitting forms with ajax.
// The action being submitted to should return javascript (I.e. create.js.erb / update.js.erb)
// Just add a selector to the page like $("new_comment").submitWithAjax();
jQuery.fn.submitWithAjax = function() {
	this.submit(function() {
		$.post($(this).attr("action"), $(this).serialize(), null, "script");
		return false;
	});
}

// makes sure our ajax requests actually look like ajax requests to the server
jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
});

$(document).ready(function() {
	
	// validate all forms
	$("form").validationEngine();
	
	$("a[rel='colorbox']").colorbox();
	$("a[rel='colorbox-frame']").colorbox({iframe:true, innerWidth:660, innerHeight:600});
	
	// disable right click save as dialog for images
	// just makes it a little harder to copy low res images
	$("img").noContext();
	
});