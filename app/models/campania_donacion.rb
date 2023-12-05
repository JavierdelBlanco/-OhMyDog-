class CampaniaDonacion < ApplicationRecord
    validates :nombre, uniqueness: { message: "Ya existe una campaña activa con este nombre"}
    has_one_attached :imagen
    validate :imagen_content_type

    def imagen_content_type
        if imagen.attached? && !imagen.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
          errors.add(:imagen, 'El formato de imagen no es válido.')
        end
    end
end
