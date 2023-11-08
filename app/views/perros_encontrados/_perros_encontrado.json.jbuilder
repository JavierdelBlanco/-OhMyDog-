json.extract! perros_encontrado, :id, :nombre, :foto, :fecha_de_publicacion, :status, :mail, :descripcion, :created_at, :updated_at
json.url perros_encontrado_url(perros_encontrado, format: :json)
