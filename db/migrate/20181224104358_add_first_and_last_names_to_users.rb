class AddFirstAndLastNamesToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :first_name
    change_column_null :users, :first_name, true
    add_column :users, :last_name, :string
  end
end
