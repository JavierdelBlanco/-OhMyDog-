module PerrosQueBuscanParejasHelper

    def calcular_edad(dia, mes, año)
        fecha_nacimiento = Date.new(año, mes, dia)
        fecha_actual = Date.current
        edad = fecha_actual.year - fecha_nacimiento.year - (fecha_actual.month > fecha_nacimiento.month || (fecha_actual.month == fecha_nacimiento.month && fecha_actual.day >= fecha_nacimiento.day) ? 0 : 1)
        edad.positive? ? edad : 0
      end

end
