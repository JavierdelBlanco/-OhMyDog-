class PerrosPerdido < ApplicationRecord
    attr_accessor :action_type

    has_one_attached :foto
    validates :nombre, presence: { message: "El nombre no puede estar en blanco" }
    validates :foto, presence: { message: "Debe subir una foto" }

    
    validate :nombre_unico_para_usuario_actual
        
    def nombre_unico_para_usuario_actual
      if action_type == 'create'
        if PerrosPerdido.exists?(nombre: nombre, mail: mail, status: 'Se busca')
          errors.add(:nombre, "create: ya existe.")
        end
      else
        existing_perro = PerrosPerdido.find_by(nombre: nombre, mail: mail, status: 'Se busca')
        if existing_perro && existing_perro.id != id
          errors.add(:nombre, "update: ya existe.")
        end
      end
    end
end