class VeiculoAddDono < ActiveRecord::Migration[5.2]
  def change
    add_column :veiculos, :usuario_id, :int
    add_foreign_key :veiculos, :usuarios
  end
end
