class Estado < ApplicationRecord
  has_many :cidade

  def to_s
    nome
  end
end
