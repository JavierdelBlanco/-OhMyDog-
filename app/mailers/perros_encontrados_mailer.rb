class PerrosEncontradosMailer < ApplicationMailer

    def enviar_correo_perros_encontrados(perro, current_user)
        @perro = perro
        @current_user = current_user
        mail(to: perro.mail, subject: '¡El dueño de uno de los perros que encontraste ha aparecido!')
    end

    def enviar_correo_perros_encontrados_contactar(perro, nombre, apellido, direccion, numero, email)
        @perro = perro
        @nombre = nombre
        @apellido = apellido
        @direccion = direccion
        @numero = numero
        @email = email
        mail(to: perro.mail, subject: '¡Han encontrado a uno de tus perros!')
    end

    
end
