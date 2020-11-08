class Cidade < ApplicationRecord
  belongs_to :estado
  has_many :endereco

  def to_s
    nome
  end
end
