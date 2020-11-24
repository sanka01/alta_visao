class CreateFranquias < ActiveRecord::Migration[5.2]
  def change
    create_table :franquias do |t|
      t.string :nome
      t.references :usuario, foreign_key: true

      t.timestamps
    end
  end
end
