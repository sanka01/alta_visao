class Veiculo < ApplicationRecord
  belongs_to :usuario
  has_one :instalacao


  def rastreador_instalado?
    self.instalacao.present? ? "Instalado" : "Não instalado"
  end

  def to_s
    "#{self.modelo} #{self .placa}"
  end
end
