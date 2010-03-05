$(document).ready(function() {
  
  // allows for row sorting within a category by dragging them around.
  // updates the order on the fly using ajax
  // this is by far the trickiest JS in the app
  $("#position_container").sortable({ 
      placeholder: "ui-selected",
      opacity: 0.7,
      update: function(e, ui) {
        // determine the end position for the element that was moved

        // end order as an array
        var end_order = $(this).sortable('serialize').replace(/row\[\]\=/g, '').split('&');

        // id of element that was moved (element is in the ui.helper object)
        var moved_row_id = ui.item.attr('id').replace('row_', ''); // parse row_ from the id

        // determine the end position of the moved element
        var end_position = 0;
        // loop through all order elements
        for (var y=0; y<end_order.length; y++) {
          // if the ids match, then we have the new index
          if (end_order[y] === moved_row_id) {
            end_position = y;
            break; // found it, bail
          }
        }
        // increment it to match our backend which starts the list at 1 instead of 0
        end_position++;

        // ajax post to save the position change
        // we're passing the parent booking, the moved row, and the new position of the row
        $.post(BASE_PATH + moved_row_id + '/update_position', {_method:"put", authenticity_token:AUTH_TOKEN, position:end_position}, function(data) {
					json = eval('(' + data + ')');
					var icon = '/images/icons/notice.png';
					//if (json.title === "Error") icon = '/images/icons/warning.png';
	        // inform the user of success / fail via gritter (growl)
	        $.gritter.add({
	      		title: json.title,
	      		text: json.message,
	      		image: icon,
	      		time: 3000
	      	});
          // re-bind lightbox so the row elements are in the right order for next / prev buttons
          //bindLightBox();
     	  });

      },
      revert: true
  });


	/* ***
	** TABLE ROW ORDERING VIA DRAG AND DROP **
	** requires: 
	**  1) AUTH_TOKEN should be set to rails form auth token in the calling erb page.
	**  2) You need an update_position action and route on the controller for the object being re-ordered.
	**     This action should return a json object.
	**  3) There should be a header row (assumption is made that the first row is 1 and not 0).
	**  4) The table you want to sort should have a class assignment of "sortable".
	*/
  $("table.sortable").tableDnD({
		onDragClass: "row_drag",
    onDrop: function(table, row) {
			// figure out where the row moved to
      var position = 0;
      var rows = table.tBodies[0].rows;
      for (var i=0; i<rows.length; i++) {
        if (rows[i].id === row.id) {
          position = i;
        }
      }
      // submit the id and position to the server via ajax
      $.post(document.location + '/' + row.id + '/update_position', {_method:"put", authenticity_token:AUTH_TOKEN, position:position}, function(data) {
        json = eval('(' + data + ')');
				var icon = '/images/icons/notice.png';
				if (json.title === "Error") icon = '/images/icons/warning.png';
        // inform the user of success / fail via gritter (growl)
        $.gritter.add({
      		title: json.title,
      		text: json.message,
      		image: icon,
      		time: 3000
      	});
      });
    },
		dragHandle: "dragHandle"
  });

	$("table.sortable tr").hover(function() {
		$(this.cells[0]).addClass('showDragHandle');
	}, function() {
		$(this.cells[0]).removeClass('showDragHandle');
	});
	
});