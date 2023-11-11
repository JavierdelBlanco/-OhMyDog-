class CuidadorPaseadorsMailer < ApplicationMailer
  default from: 'noreply@ohmydog.com'

  def enviar_correo(cuidador_paseador,current_user)
    @cuidador_paseador = cuidador_paseador
    @current_user = current_user
    mail(to: cuidador_paseador.email, subject: 'Tenes un nuevo cliente en ¡Oh my dog!')
  end
end
