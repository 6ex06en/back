window.fadeFlash = ->
  $(".alert-success").fadeOut(2500)
  $(".alert-danger").fadeOut(2500)
$(document).ready( ->
	setTimeout(->
		$(".alert").fadeOut(2500)
	,1000)
	)
