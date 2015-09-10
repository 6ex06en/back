$(document).on("ready", ->
  $(".glyphicon-ok").click( ->
    $(this).parent().toggleClass("has-success")
    name = $(this).prev().attr('name').slice(-2, -1).toUpperCase()
    if $(this).parent().hasClass("has-success")
      $(this).parent().append("<input type='hidden' name='test[right_" + name + "]'value='"+name+"'></input>")
    else
      $(this).parent().find("input[type='hidden']").remove())
)
window.mark_right = ->
  $(this).parent().toggleClass("has-success")
  name = $(this).prev().attr('name').slice(-2, -1).toUpperCase()
	if $(this).parent().hasClass("has-success")
		$(this).parent().append("<input type='hidden' name='test[right_" + name + "]'value='"+name+"'></input>")
	else
		$(this).parent().find("input[type='hidden']").remove()