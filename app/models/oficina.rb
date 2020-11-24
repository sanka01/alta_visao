class Oficina < ApplicationRecord
  belongs_to :usuario
  belongs_to :endereco
  belongs_to :franquia
end
