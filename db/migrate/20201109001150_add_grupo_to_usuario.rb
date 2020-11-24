class AddGrupoToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :grupo, :integer
  end
end
