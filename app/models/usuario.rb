class Usuario < ApplicationRecord

  validates :cpf_cnpj, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # validates :nome, presence: true, case_sensitive: false
  validates :indicacao, presence: true


  has_one :endereco
  belongs_to :franquia
  has_one :cidade, through: :endereco
  has_one :estado, through: :cidade
  has_many :veiculos
  has_many :oficinas

  def to_s
    nome
  end

  def indicado_por
    if self.indicacao != 0
      Usuario.find(self.indicacao)
    else
      "Dono da franquia"
    end
  end

  def indicados
    Usuario.where(indicacao: self, status: true)
  end

end
