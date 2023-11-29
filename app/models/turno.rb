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
    turnos_two_days_before = where(estado: 'confirmado',fecha: 2.days.from_now.beginning_of_day..2.days.from_now.end_of_day)
    turnos_two_days_before.each do |turno|
      TurnosMailer.recordatorio_turno(turno).deliver_now
    end
  end

  def self.delete_expired_turns
    current_datetime = Time.zone.now
    turnos = all
    three_hours_in_seconds = 3 * 60 * 60 # 3 horas en segundos
    turnos_confirmados = where(estado: 'confirmado')
    expired_turnos = turnos_confirmados.select do |turno|
      # Construir fecha y hora combinada sin segundos
      fecha_hora_combinada = Time.zone.local(turno.fecha.year, turno.fecha.month, turno.fecha.day, turno.horario.hour, turno.horario.min, 0)
      fecha_hora_combinada_truncated = fecha_hora_combinada.change(sec: 0) # Eliminar los segundos
      current_datetime_truncated = current_datetime.change(sec: 0)  - three_hours_in_seconds# Eliminar los segundos de la fecha actual
      fecha_hora_combinada_truncated <= current_datetime_truncated
    end
    expired_turnos.each(&:destroy)
  end

end
