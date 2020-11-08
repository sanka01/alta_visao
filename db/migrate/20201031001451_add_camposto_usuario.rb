class AddCampostoUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ativo, :bool
    add_column :users, :usuario_master, :int

  end
end
