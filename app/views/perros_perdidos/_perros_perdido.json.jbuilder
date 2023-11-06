json.extract! perros_perdido, :id, :nombre, :foto, :fecha_de_publicacion, :status, :created_at, :updated_at
json.url perros_perdido_url(perros_perdido, format: :json)
