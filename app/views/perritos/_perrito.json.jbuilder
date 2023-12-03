json.extract! perrito, :id, :nombre, :dia, :mes, :año, :caracteristicas, :condiciones, :raza, :sexo, :color, :tamaño, :user_id, :created_at, :updated_at
json.url perrito_url(perrito, format: :json)
