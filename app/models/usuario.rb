class Usuario < ApplicationRecord

  # has_secure_password

  enum tipo_usuario: {
      administrator: 0,
      pre_cadastro: 1,
      cliente: 2,
      empreendedor: 3
  }
  has_one :endereco
  # has_one :indicacao, class_name: "indicacao"
  has_one :cidade, through: :endereco
  has_one :estado, through: :cidade
  has_many :veiculos
  def to_s
    nome
  end
end
