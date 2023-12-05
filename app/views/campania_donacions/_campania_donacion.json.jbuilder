json.extract! campania_donacion, :id, :nombre, :motivo, :beneficiario, :monto_total, :monto_actual, :dia_limite, :mes_limite, :anio_limite, :imagen, :created_at, :updated_at
json.url campania_donacion_url(campania_donacion, format: :json)
