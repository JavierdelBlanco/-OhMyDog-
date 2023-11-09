class PerrosPerdido < ApplicationRecord
    has_one_attached :foto
    validates :nombre, presence: { message: "El nombre no puede estar en blanco" }
    validates :foto, presence: { message: "Debe subir una foto" }

    
    validate :nombre_unico_para_usuario_actual
    
    def nombre_unico_para_usuario_actual
        if PerrosPerdido.exists?(nombre: nombre, mail: mail)
            errors.add(:nombre, "Ya has publicado un perro con este nombre.")
        end
    end

end
