class MatchMailer < ApplicationMailer
    default from: 'noreply@ohmydog.com'

    def enviar_correo_match(perro_1, perro_2)
        @perro_1 = perro_1
        @perro_del_receptor = perro_2

        @user_1 = User.find(perro_1.user_id)
        @user_receptor = User.find(perro_2.user_id)

        mail(to: @user_receptor.email, subject: '¡Se ha generado un matcheo!')
    end

end