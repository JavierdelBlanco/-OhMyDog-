class CuidadorPaseador < ApplicationRecord
    has_one_attached :foto
    validate :foto_content_type
    validate :validar_email

    paginates_per 4

    def foto_content_type
        if foto.attached? && !foto.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
          errors.add(:foto, 'El formato de imagen no es válido.')
        end
    end

    def validar_email
        if email.present?
          if !email.include?('@')
            errors.add(:email, 'El email debe contener el símbolo "@"')
          elsif CuidadorPaseador.where.not(id: id).exists?(email: email)
            errors.add(:email, 'Este email ya ha sido registrado')
          end
        end
      end

end
