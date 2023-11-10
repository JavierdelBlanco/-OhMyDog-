class Perrito < ApplicationRecord
<<<<<<< HEAD
  validates :nombre, presence: true
  validates :caracteristicas, presence: true
  validates :condiciones, presence: true
  validates :raza, presence: true
  validates :color, presence: true
  validates :tamaño, presence: true
=======
>>>>>>> cc972f2e (correcion-usuario-registro)

  belongs_to :user
end
