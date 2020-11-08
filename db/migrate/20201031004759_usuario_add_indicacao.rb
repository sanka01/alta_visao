class UsuarioAddIndicacao < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :indicacao, :int

  end
end
