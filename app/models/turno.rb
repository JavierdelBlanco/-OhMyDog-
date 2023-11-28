class Turno < ApplicationRecord
  validate :al_menos_un_perro_seleccionado
  validate :una_solicitud_por_dia_y_email

  def al_menos_un_perro_seleccionado
    if nombres_perros.include?('[]')
      errors.add(:nombres_perros, "Debes seleccionar al menos un perro")
    end
  end

  def una_solicitud_por_dia_y_email
    if Turno.exists?(fecha: fecha, email_cliente: email_cliente) && estado != 'confirmado'
      errors.add(:fecha, "Ya tienes una solicitud de turno para ese día")
    end
  end

  def self.send_reminder_emails
    puts "Sending reminder emails..."
    turnos_two_days_before = where(fecha: 2.days.from_now.beginning_of_day..2.days.from_now.end_of_day)
    turnos_two_days_before.each do |turno|
      puts "turno #{turno.id}"
      TurnosMailer.recordatorio_turno(turno).deliver_now
    end
  end



end
