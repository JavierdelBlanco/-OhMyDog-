class PerrosQueBuscanPareja < ApplicationRecord

    has_one_attached :foto

    validates :foto, presence: { message: "Debe subir una foto" }

    validate :foto_content_type

    def foto_content_type
        if foto.attached? && !foto.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
          errors.add(:foto, 'El formato de imagen no es válido.')
        end
      end
end