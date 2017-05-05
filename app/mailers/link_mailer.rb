class LinkMailer < ActionMailer::Base
	default from: "torttuxx@gmail.com" #es desde donde se van a enviar los correos
	layout false
	def download_link(link) 
		@link = link # guarda los link en una variable de clase para mostrarlo en otra vista
		@producto = link.producto
		mail(to: link.email,subject:"Descarga los productos que adquiriste en torttuxx.com")
		# link.email  =>  es al correo que se va a enviar que compro el producto
		# to: =>  ya tiene el correo desde donde se va a enviar el correo
		# Nota: se debe de crar una vista con el mismo metodo download_link
	end
end