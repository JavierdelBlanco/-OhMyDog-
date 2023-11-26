json.extract! historia_clinica, :id, :perrito_id, :tipo, :dia, :mes, :año, :detalle, :tipoVacuna, :lote, :dosis, :producto, :sintomas, :diagnostico, :tratamiento, :created_at, :updated_at
json.url historia_clinica_url(historia_clinica, format: :json)
