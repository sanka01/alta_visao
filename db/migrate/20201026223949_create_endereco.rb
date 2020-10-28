class CreateEndereco < ActiveRecord::Migration[5.2]
  def change
    create_table :enderecos do |t|
      t.string :rua
      t.string :lote
      t.string :bairro
      t.string :logradouro
      t.string :cep
      t.references :cidade
      t.timestamps

    end

    create_table :cidades do |t|
      t.string :nome
      t.references :estado
    end

    create_table :estado do |t|
      t.string :nome
    end
  end
end
