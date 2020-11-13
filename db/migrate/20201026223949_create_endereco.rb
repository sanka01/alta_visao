class CreateEndereco < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :lote
      t.string :bairro
      t.string :logradouro
      t.string :cep
#      t.references :cidade, foreign_key: true
      t.timestamps

    end

  end
end
