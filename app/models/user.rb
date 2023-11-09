class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :apellido, presence: true
  validates :direccion, presence: true
  validates :nro, presence: true
  validates :tipo_usuario, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :perritos, dependent: :destroy

  perritos_vector = []

  def agregar_perro(nombre,dia,mes,anio,caracteristicas,condiciones,raza,color,tamanio)
    perro_nuevo = Perrito.new(nombre,dia,mes,anio,caracteristicas,condiciones,raza,color,tamanio)
    perritos_vector << perro_nuevo
  end  
         

end
