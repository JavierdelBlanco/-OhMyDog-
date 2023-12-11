class CampaniaDonacion < ApplicationRecord
    validate :nombre_unico
    has_one_attached :imagen
    validate :imagen_content_type

    def imagen_content_type
        if imagen.attached? && !imagen.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
          errors.add(:imagen, 'El formato de imagen no es válido.')
        end
    end

    def nombre_unico
      existing_record = self.class.where.not(id: self.id).find_by(nombre: self.nombre)
      if existing_record
        errors.add(:nombre, 'Ya existe una campaña con ese nombre')
      end
    end
end
