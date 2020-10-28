class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :rg
      t.string :cpf_cnpj
      t.string :email
      t.integer :endereco_id
      t.string :telefone
      t.string :telefone_2
      t.integer :cobranca
      t.integer :tipo_usuario
      t.boolean :associado

      t.timestamps
    end
  end
end
