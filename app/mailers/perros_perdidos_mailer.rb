class PerrosPerdidosMailer < ApplicationMailer
    default from: 'noreply@ohmydog.com'
    
    def enviar_correo_perros_perdidos(direccion)
        @direccion = direccion
        mail(to: direccion, subject: '¡Has encontrado a un perro!')
    end
  
  end