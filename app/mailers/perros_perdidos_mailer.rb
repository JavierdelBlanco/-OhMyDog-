class PerrosPerdidosMailer < ApplicationMailer
    default from: 'noreply@ohmydog.com'
    
    def enviar_correo_perros_perdidos(perro, owner, current_user)
        @perro = perro
        @owner = owner
        @current_user = current_user
        mail(to: perro.mail, subject: '¡Han encontrado a uno de tus perros!')
    end

    def enviar_correo_perros_perdidos_contactar(perro, owner, nombre, apellido, direccion, numero, email)
        @perro = perro
        @owner = owner
        @nombre = nombre
        @apellido = apellido
        @direccion = direccion
        @numero = numero
        @email = email
        mail(to: perro.mail, subject: '¡Han encontrado a uno de tus perros!')
      end
  
  end