class VetDeGuardium < ApplicationRecord

    has_one_attached :foto

    validates :foto, presence: true
    validates :dia, presence: true
    validates :direccion, presence: true
    validates :telefono, presence: true
    validates :mail, presence: true

    validate :foto_content_type

    def foto_content_type
        if foto.attached? && !foto.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
          errors.add(:foto, 'El formato de imagen no es válido.')
        end
    end

    validate :validar_email

    def validar_email
        if mail.present?
            if !mail.include?('@')
                errors.add(:mail, 'El email debe contener el símbolo "@"')
            end
        else
            errors.add(:mail, 'Debe ingresar un email.')
        end
    end


end
