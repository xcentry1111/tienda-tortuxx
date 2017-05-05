$(document).on "ajax:beforeSend", "#emails-form", ()->
	$("#email-info").html "Se esta procesando tu petición"
$(document).on "ajax:success", "#emails-form", (e,data,estado,xhr)->
	$(this).slideUp()
	$("#email-info").html "Se guardo tu correo correctamente, te encuentras en la fila de las invitaciones"
$(document).on "ajax:error", "#emails-form", (e,data,estado,xhr)->
	$("#email-info").html data.responseJSON.email[0]
