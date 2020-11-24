class Franquia < ApplicationRecord
  belongs_to :usuario

  def to_s
    nome
  end
end
