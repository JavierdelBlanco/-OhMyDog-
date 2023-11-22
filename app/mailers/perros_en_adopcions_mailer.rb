class PerrosEnAdopcionsMailer < ApplicationMailer
    
    default from: 'noreply@ohmydog.com'
    
    def enviar_correo_contactar_registrado(perro, owner, current_user)
        @perro = perro
        @owner = owner
        @current_user = current_user
        mail(to: perro.mail, subject: '¡Alguien esta interesado en adoptar a tu perro!')
    end

    def enviar_correo_contactar_no_registrado(perro, owner, nombre, apellido, direccion, numero, email)
        @perro = perro
        @owner = owner
        @nombre = nombre
        @apellido = apellido
        @direccion = direccion
        @numero = numero
        @email = email
        mail(to: perro.mail, subject: '¡Alguien esta interesado en adoptar a tu perro!')
    end

end
