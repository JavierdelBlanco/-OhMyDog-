class SolicitudTurno < ApplicationRecord
  validate :al_menos_un_perro_seleccionado
  validate :una_solicitud_por_dia_y_email

  def al_menos_un_perro_seleccionado
    if nombres_perros.include?('[]')
      errors.add(:nombres_perros, "Debes seleccionar al menos un perro")
    end
  end

  def una_solicitud_por_dia_y_email
      if SolicitudTurno.exists?(dia: dia, email_cliente: email_cliente)
        errors.add(:dia, "Ya tienes una solicitud de turno para ese dia")
      end
  end

end
