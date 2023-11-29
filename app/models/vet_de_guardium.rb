class VetDeGuardium < ApplicationRecord
    attr_accessor :action_type

    validates :dia, presence: true
    validates :direccion, presence: true
    validates :telefono, presence: true
    validates :mail, presence: true

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

    validate :dia_repetido

    def dia_repetido
        if action_type == 'create'
            if VetDeGuardium.exists?(dia: dia)
                errors.add(:dia, 'Ya hay una veterinaria de guardia para esta fecha.')
            end
        else
            existing_vet = VetDeGuardium.find_by(dia: dia)
            if existing_vet && existing_vet.id != id
                errors.add(:dia, 'Ya hay una veterinaria de guardia para esta fecha.')
            end
        end
    end


end
