class AddReferencesGerais < ActiveRecord::Migration[5.2]
  def change
    add_column :veiculos, :oficina_id, :integer
    add_foreign_key :veiculos, :oficinas

    rename_column :usuarios, :grupo, :franquia_id
    add_foreign_key :usuarios, :franquias

    add_column :veiculos, :valor_instalacao, :float
    add_column :veiculos, :mensalidade, :float


  end
end
