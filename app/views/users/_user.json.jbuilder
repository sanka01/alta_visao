json.extract! user, :id, :nome, :rg, :cpf_cnpj, :email, :endereco_id, :telefone, :telefone_2, :cobranca, :tipo_usuario, :associado, :created_at, :updated_at
json.url user_url(user, format: :json)
