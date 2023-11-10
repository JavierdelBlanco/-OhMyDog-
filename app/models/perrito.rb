class Perrito < ApplicationRecord
  validates :nombre, presence: true
  validates :fecha_de_nacimiento, presence: true
  validates :caracteristicas, presence: true
  validates :condiciones, presence: true
  validates :raza, presence: true
  validates :color, presence: true
  validates :tamaño, presence: true


  belongs_to :user
end
