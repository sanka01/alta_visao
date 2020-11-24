class CreateOficinas < ActiveRecord::Migration[5.2]
  def change
    create_table :oficinas do |t|
      t.string :nome
      t.references :usuario, foreign_key: true
      t.references :endereco, foreign_key: true
      t.references :franquia, foreign_key: true

      t.timestamps
    end
  end
end
