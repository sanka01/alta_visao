class Endereco < ApplicationRecord
  belongs_to :usuario
  belongs_to :cidade

  # validates :lote, :bairro, :logradouro, :cep,  presence: true
  def to_s
    "#{bairro} #{logradouro} #{complemento} #{lote}, #{cidade} - #{cidade.estado}"
  end

end
