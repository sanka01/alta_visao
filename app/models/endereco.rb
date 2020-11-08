class Endereco < ApplicationRecord
  belongs_to :usuario
  belongs_to :cidade
  def to_s
    "#{bairro} #{logradouro} #{complemento} #{lote}, #{cidade} - #{cidade.estado}"
  end

end
