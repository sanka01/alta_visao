class Franquia < ApplicationRecord
  has_many :usuarios

  def to_s
    nome
  end
  def dono
    Usuario.find(self.usuario_id)
  end
  def oficinas
    Oficina.where(franquia_id: self)
  end
end
