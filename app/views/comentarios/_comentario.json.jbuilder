json.extract! comentario, :id, :post_id, :autor, :body, :created_at, :updated_at
json.url comentario_url(comentario, format: :json)
