class EnderecoAddCidade < ActiveRecord::Migration[5.2]
  def change
    add_column :enderecos, :cidade_id, :int
    add_foreign_key :enderecos, :cidades
  end
end
