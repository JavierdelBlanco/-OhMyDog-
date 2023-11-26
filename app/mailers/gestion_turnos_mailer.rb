class GestionTurnosMailer < ApplicationMailer
  default from: 'noreply@ohmydog.com'

  def notificar_turno_otorgado(turno)
    @turno = turno
    mail(to: turno.email_cliente, subject: 'Tu turno en la veterinaria ¡Oh my dog! ha sido otorgado!')
  end

  def notificar_turno_rechazado(solicitud_turno)
    @solicitud_turno = solicitud_turno
    mail(to: solicitud_turno.email_cliente, subject: 'Lo sentimos,Tu turno en la veterinaria ¡Oh my dog! ha sido rechazado')
  end

end
