class UsersAddIndicacao < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :indicacao, :int
  end
end
