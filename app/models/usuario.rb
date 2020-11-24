class Usuario < ApplicationRecord

  # validates :cpf_cnpj, presence: true, uniqueness: true
  # validates :nome, presence: true, case_sensitive: false
  validates :indicacao, presence: true
  enum tipo_usuario: {
      administrator: 0,
      pre_cadastro: 1,
      cliente: 2,
      empreendedor: 3
  }
  has_one :endereco
  has_one :franquia
  has_one :cidade, through: :endereco
  has_one :estado, through: :cidade
  has_many :veiculos

  def to_s
    nome
  end
end
