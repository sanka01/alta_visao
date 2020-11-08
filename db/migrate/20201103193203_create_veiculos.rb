class CreateVeiculos < ActiveRecord::Migration[5.2]
  def change
    create_table :veiculos do |t|
      t.string :placa
      t.string :chassi
      t.integer :renavan
      t.string :ano
      t.string :modelo

      t.timestamps
    end
  end
end
