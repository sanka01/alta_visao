class AddAtivoToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :ativo, :boolean

  end
end
