class GestionTurnosMailer < ApplicationMailer
  default from: 'noreply@ohmydog.com'

  def notificar_turno_otorgado(turno)
    @turno = turno
    mail(to: turno.email_cliente, subject: 'Tu turno en la veterinaria ¡Oh my dog! ha sido otorgado!')
  end
end
