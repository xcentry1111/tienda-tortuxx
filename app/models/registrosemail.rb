class Registrosemail < ActiveRecord::Base
	validates_presence_of :email, message: "Favor ingresar el correo"
	validates_uniqueness_of :email, messages: "El correo ya se encuentra registrado"
	validates_format_of :email, with: Devise::email_regexp, message: "No se envio ningun correo"
end
