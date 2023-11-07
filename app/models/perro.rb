class Perro < ApplicationRecord

    belongs_to :user

    def new(nombre, dia, mes, anio, caracteristicas, condiciones, raza, color, tamanio)
        @nombre = nombre
        @dia = dia
        @mes = mes
        @anio = anio
        @caracteristicas = caracteristicas
        @condiciones = condiciones
        @raza = raza
        @color = color
        @tamanio = tamanio
      end

      def update(perro_params)
        @nombre = nombre
        @dia = dia
        @mes = mes
        @anio = anio
        @caracteristicas = caracteristicas
        @condiciones = condiciones
        @raza = raza
        @color = color
        @tamanio = tamanio
      end
      
      private
  
      def perro_params
        params.require(:perro).permit(:nombre, :dia, :mes, :anio, :caracteristicas, :condiciones, :raza, :color, :tamanio, :libreta, :historia)
      end
end
