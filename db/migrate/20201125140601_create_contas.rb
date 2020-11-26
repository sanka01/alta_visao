class CreateContas < ActiveRecord::Migration[5.2]
  def change
    create_table :contas do |t|
      t.string :nome
      t.integer :nivel_permissao
      t.references :usuario, foreign_key: true
      t.references :oficina, foreign_key: true
      t.references :franquia, foreign_key: true

      t.timestamps
    end
  end
end
