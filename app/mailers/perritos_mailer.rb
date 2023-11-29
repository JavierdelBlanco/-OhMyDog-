class PerritosMailer < ApplicationMailer
    default from: 'noreply@ohmydog.com'
  
    def notificar_refuerzo_vacunae(user_id, nombre_perro)
      @user = User.find(user_id)
      mail(to: @user.email, subject: 'Recordatorio de refuerzo Vacuna Anti Enfermedades!')
    end

    def notificar_refuerzo_vacunar(user_id, nombre_perro)
        @user = User.find(user_id)
        mail(to: @user.email, subject: 'Recordatorio de refuerzo Vacuna Antirrábica!')
    end

  
  end