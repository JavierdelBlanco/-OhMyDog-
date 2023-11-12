class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def password_required?
    false
  end

  def password_confirmation_required?
    false
  end

  validates :apellido, presence: true
  validates :direccion, presence: true
  validates :nro, presence: true
  validates :tipo_usuario, presence: true

  has_many :perritos, dependent: :destroy

  perritos_vector = []

  def agregar_perro(nombre,dia,mes,anio,caracteristicas,condiciones,raza,color,tamanio)
    perro_nuevo = Perrito.new(nombre,dia,mes,anio,caracteristicas,condiciones,raza,color,tamanio)
    perritos_vector << perro_nuevo
  end  
         

end
