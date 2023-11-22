json.extract! perros_en_adopcion, :id, :nombre, :foto, :fecha_de_publicacion, :status, :raza, :sexo, :edad, :tamano, :created_at, :updated_at
json.url perros_en_adopcion_url(perros_en_adopcion, format: :json)
