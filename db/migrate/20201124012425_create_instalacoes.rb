class CreateInstalacoes < ActiveRecord::Migration[5.2]
  def change
    create_table :instalacoes do |t|
      t.references :veiculo, foreign_key: true
      t.references :oficina, foreign_key: true

      t.timestamps
    end
  end
end
