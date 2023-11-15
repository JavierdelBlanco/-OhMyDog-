class CuidadorPaseadorsMailer < ApplicationMailer
  default from: 'noreply@ohmydog.com'

  def enviar_correo(cuidador_paseador,current_user)
    @cuidador_paseador = cuidador_paseador
    @current_user = current_user
    mail(to: cuidador_paseador.email, subject: 'Tenes un nuevo cliente en ¡Oh my dog!')
  end

  def enviar_correo_no_registrado(cuidador_paseador, nombre, apellido, direccion, numero, email, telefono)
    @cuidador_paseador = cuidador_paseador
    @nombre = nombre
    @apellido = apellido
    @direccion = direccion
    @numero = numero
    @email = email
    @telefono = telefono
    mail(to: cuidador_paseador.email, subject: 'Tenes un nuevo cliente en ¡Oh my dog! no registrado')
  end
end
