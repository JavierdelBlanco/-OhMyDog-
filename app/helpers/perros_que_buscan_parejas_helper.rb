module PerrosQueBuscanParejasHelper

  def calcular_edad(dia, mes, año)
    fecha_nacimiento = Date.new(año, mes, dia)
    fecha_actual = Date.current
    edad_en_años = fecha_actual.year - fecha_nacimiento.year - (fecha_actual.month > fecha_nacimiento.month || (fecha_actual.month == fecha_nacimiento.month && fecha_actual.day >= fecha_nacimiento.day) ? 0 : 1)
  
    if edad_en_años.positive?
      "#{edad_en_años} #{'año'.pluralize(edad_en_años)}"
    else
      meses_transcurridos = (fecha_actual.year * 12 + fecha_actual.month) - (fecha_nacimiento.year * 12 + fecha_nacimiento.month)
      if meses_transcurridos.positive?
        "#{meses_transcurridos} #{'mes'.pluralize(meses_transcurridos)}"
      else
        dias_transcurridos = (fecha_actual - fecha_nacimiento).to_i
        "#{dias_transcurridos} #{'día'.pluralize(dias_transcurridos)}"
      end
    end
  end
  
  

end