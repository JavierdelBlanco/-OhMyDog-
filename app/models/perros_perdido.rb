class PerrosPerdido < ApplicationRecord
    has_one_attached :foto
    validates :nombre, presence: { message: "El nombre no puede estar en blanco" }
    validates :foto, presence: { message: "Debe subir una foto" }

end
