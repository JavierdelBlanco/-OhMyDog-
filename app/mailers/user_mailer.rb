class UserMailer < ApplicationMailer

    default from: 'noreply@ohmydog.com' # Reemplaza con tu dirección de correo electrónico

    def random_password_email(direccion,password)
        @direccion = direccion
        @password = password
        mail(to: @direccion, subject: 'Se ha creado su cuenta de manera exitosa')
    end
end
