class PerrosEnAdopcionsMailer < ApplicationMailer
    
    default from: 'noreply@ohmydog.com'
    
    def enviar_correo_contactar_registrado(perro, owner, current_user, detalle)
        @perro = perro
        @owner = owner
        @current_user = current_user
        @detalle = detalle
        mail(to: perro.mail, subject: '¡Alguien esta interesado en adoptar a tu perro!')
    end

    def enviar_correo_contactar_no_registrado(perro, owner, nombre, apellido, direccion, numero, email, detalle)
        @perro = perro
        @owner = owner
        @nombre = nombre
        @apellido = apellido
        @direccion = direccion
        @numero = numero
        @email = email
        @detalle = detalle
        mail(to: perro.mail, subject: '¡Alguien esta interesado en adoptar a tu perro!')
    end

end
