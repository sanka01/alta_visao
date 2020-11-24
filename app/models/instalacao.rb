class Instalacao < ApplicationRecord
  belongs_to :veiculo
  belongs_to :oficina
end
