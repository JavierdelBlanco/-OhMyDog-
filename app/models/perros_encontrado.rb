class PerrosEncontrado < ApplicationRecord
    has_one_attached :foto
    validates :foto, presence: { message: "Debe subir una foto" }
end
