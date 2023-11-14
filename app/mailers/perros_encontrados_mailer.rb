class PerrosEncontradosMailer < ApplicationMailer

    def enviar_correo_perros_encontrados(perro, current_user)
        @perro = perro
        @current_user = current_user
        mail(to: perro.mail, subject: '¡El dueño de uno de los perros que encontraste ha aparecido!')
    end

end
