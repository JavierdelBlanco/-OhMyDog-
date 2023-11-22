json.extract! solicitud_turno, :id, :nombre_cliente, :apellido_cliente, :nombres_perros, :tipo_turno, :dia, :horario, :descripcion, :created_at, :updated_at
json.url solicitud_turno_url(solicitud_turno, format: :json)
