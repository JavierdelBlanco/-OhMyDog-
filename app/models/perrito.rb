class Perrito < ApplicationRecord
  validates :nombre, presence: true
  validates :caracteristicas, presence: true
  validates :condiciones, presence: true
  validates :raza, presence: true
  validates :color, presence: true
  validates :tamaño, presence: true

  has_one :historia_c
  belongs_to :user


  validates :nombre, uniqueness: { scope: [:user_id], message: 'ya está en uso para este usuario', if: :no_esta_fallecido? }

  def no_esta_fallecido?
    !fallecido
  end


end
