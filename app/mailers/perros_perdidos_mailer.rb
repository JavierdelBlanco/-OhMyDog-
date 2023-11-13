class PerrosPerdidosMailer < ApplicationMailer
    default from: 'noreply@ohmydog.com'
    
    def enviar_correo_perros_perdidos(perro, owner, current_user)
        @perro = perro
        @owner = owner
        @current_user = current_user
        mail(to: perro.mail, subject: '¡Han encontrado a uno de tus perros!')
    end
  
  end