json.extract! producto, :id, :nombre, :precio, :descripcion, :user_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)