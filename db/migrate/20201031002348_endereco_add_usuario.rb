class EnderecoAddUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :enderecos, :usuario_id, :int
    add_foreign_key :enderecos, :usuarios

  end
end
