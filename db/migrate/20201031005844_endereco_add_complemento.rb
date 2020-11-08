class EnderecoAddComplemento < ActiveRecord::Migration[5.2]
  def change
    add_column :enderecos, :complemento, :string
  end
end
