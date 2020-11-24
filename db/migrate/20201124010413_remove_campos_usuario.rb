class RemoveCamposUsuario < ActiveRecord::Migration[5.2]
  def change
    remove_column :usuarios, :password_digest
    remove_column :usuarios, :cobranca
  end
end
