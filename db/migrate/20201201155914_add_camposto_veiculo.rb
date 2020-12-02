class AddCampostoVeiculo < ActiveRecord::Migration[5.2]
  def change
    add_column :veiculos, :cor, :string
    add_column :veiculos, :marca, :string

  end
end
