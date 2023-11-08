class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :perritos

  perritos_vector = []

  def agregar_perro(nombre,dia,mes,anio,caracteristicas,condiciones,raza,color,tamanio)
    perro_nuevo = Perro.new(nombre,dia,mes,anio,caracteristicas,condiciones,raza,color,tamanio)
    perritos_vector << perro_nuevo
  end  
         

end
