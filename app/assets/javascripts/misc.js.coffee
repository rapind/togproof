jQuery ->
  $("a[rel='lightbox']").fancybox
    titlePosition: "inside"
    overlayColor: "#444"

  $(".date_picker").datepicker dateFormat: "MM dd, yy"

  # Handle destroy errors
  $('a[data-remote="true"]').on "ajax:error", (xhr, status, error) ->
    alert 'Ran into a problem deleting this record.'

  # Remove parent row / item upon successful destroy
  $('a[data-remote="true"]').on "ajax:success", (data, status, xhr) ->
    if $(this).parents('tr').length
      $(this).parents('tr').remove()
    else if $(this).parents('li').length
      $(this).parents('li').remove()

  $(".carousel").carousel interval: 8000

  $("#sorted-image-list").sortable
    handle: "div.title"
    revert: true
    update: ->
      $.ajax
        type: "put"
        data: $("#sorted-image-list").sortable("serialize")
        dataType: "script"
        url: $("meta[name=sortable_path]").attr("content")
        complete: (request) ->
          $("#sorted-image-list").effect "highlight"


