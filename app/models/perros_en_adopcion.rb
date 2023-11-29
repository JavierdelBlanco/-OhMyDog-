class PerrosEnAdopcion < ApplicationRecord
    attr_accessor :action_type

    validate :nombre_unico_para_usuario_actual

    def nombre_unico_para_usuario_actual
      if action_type == 'create'
        if PerrosEnAdopcion.exists?(nombre: nombre, mail: mail, status: true)
          errors.add(:nombre, "Ya tienes una publicacion con este nombre de perro!")
        end
      else
        existing_perro = PerrosEnAdopcion.find_by(nombre: nombre, mail: mail, status: true)
        if existing_perro && existing_perro.id != id
          errors.add(:nombre, "Ya tienes una publicacion con este nombre de perro!")
        end
      end
    end
end
