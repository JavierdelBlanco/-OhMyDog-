class Perrito < ApplicationRecord
  validates :nombre, presence: true
  validates :caracteristicas, presence: true
  validates :condiciones, presence: true
  validates :raza, presence: true
  validates :color, presence: true
  validates :tamaño, presence: true

  has_many :historia_clinicas, dependent: :destroy
  belongs_to :user


  validates :nombre, uniqueness: { scope: [:user_id], message: 'ya está en uso para este usuario', if: :no_esta_fallecido? }

  def no_esta_fallecido?
    !fallecido
  end

  def tiene_historia_clinica_de_tipo?(tipo)
    historia_clinicas.any? { |hc| hc.tipo == tipo }
  end

end
