class PerrosEncontrado < ApplicationRecord
    attr_accessor :action_type
    
    has_one_attached :foto
    
    validates :foto, presence: { message: "Debe subir una foto" }
    
    validate :foto_content_type
    #validate :nombre_unico_para_usuario_actual

    def foto_content_type
      if foto.attached? && !foto.content_type.in?(%w(image/jpeg image/jpg image/png image/gif image/webp))
        errors.add(:foto, 'El formato de imagen no es válido.')
      end
    end
       
    #def nombre_unico_para_usuario_actual
    #  if action_type == 'create'
    #    if PerrosEncontrado.exists?(nombre: nombre, mail: mail, status: 'Se busca al dueño')
    #      errors.add(:nombre, "Ya tienes una publicacion con este nombre de perro!")
    #    end
    #  else
    #    existing_perro = PerrosEncontrado.find_by(nombre: nombre, mail: mail, status: 'Se busca al dueño')
    #    if existing_perro && existing_perro.id != id
    #      errors.add(:nombre, "Ya tienes una publicacion con este nombre de perro!.")
    #    end
    #  end
    #end
end
