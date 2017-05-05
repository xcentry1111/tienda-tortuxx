json.extract! empresa, :id, :descripcion, :municipio, :direccion, :telefono, :nit, :pagina_web, :email, :twitter, :tipo_empresa, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)