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
	
	$('a.delete').live('click', function(event) {
		if ( confirm("Are you sure you want to delete this record?") ) {
			// put together the matching for related links
			href_match = this.href.substring(this.href.length - 12);
			$.post(this.href, {_method:"delete", authenticity_token:AUTH_TOKEN}, function(data) {
				// inform the user of status via gritter (growl)
        $.gritter.add({
      		title: data.title,
      		text: data.message,
      		image: '/images/icons/notice.png',
      		time: 3000
      	});
				// look for any related links, like edit, view etc. and remove them
				$("a[href*='" + href_match + "']").each(function() { 
					// change the link to text by adding the text we want and removing the link
					$(this).after("x");
					$(this).remove();
				});
   	  }, "json");
		}
		return false;
	});
	
	$('a.delete-no-conf').live('click', function(event) {
		href_match = this.href.substring(this.href.length - 12);
		$.post(this.href, {_method:"delete", authenticity_token:AUTH_TOKEN}, function(data) {
			// not going to message the user, gets cluttered
  	  // look for any related links, like edit, view etc. and remove them
			$("a[href*='" + href_match + "']").each(function() { 
				// change the link to text by adding the text we want and removing the link
				$(this).after("x");
				$(this).remove();
			});
		}, "json");
		return false;
	});
	
});