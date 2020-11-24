class Oficina < ApplicationRecord
  belongs_to :usuario
  belongs_to :endereco
  has_one :franquia, through: :usuario

end
