class PerrosEncontradosMailer < ApplicationMailer
    
    def enviar_correo_perros_encontrados(perro, owner, current_user)
        @perro = perro
        @owner = owner
        @current_user = current_user
        mail(to: perro.mail, subject: '¡Esta persona dice ser el dueño de este perro!')
    end

end