$(document).on("ready", ->
  $(".glyphicon-ok").click( ->
  	$(this).parent().toggleClass("has-success")
  )
 )
window.mark_right = ->
  $(this).parent().toggleClass("has-success")