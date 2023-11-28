class TurnosMailer < ApplicationMailer
  default from: 'noreply@ohmydog.com'

  def notificar_turno_otorgado(turno)
    @turno = turno
    mail(to: turno.email_cliente, subject: 'Tu turno en la veterinaria ¡Oh my dog! ha sido otorgado!')
  end

  def notificar_turno_rechazado(turno_attributes)
    @turno = turno_attributes
    mail(to: @turno['email_cliente'], subject: 'Lo sentimos, Tu turno en la veterinaria ¡Oh my dog! ha sido rechazado')
  end

  def recordatorio_turno(turno)
    @turno = turno
    mail(to: turno.email_cliente, subject: 'Recordatorio de turno en la veterinaria ¡Oh my dog!')
  end

end
