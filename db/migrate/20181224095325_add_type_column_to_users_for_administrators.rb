class AddTypeColumnToUsersForAdministrators < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :type, :string, null: false, default: 'User'
  end
end
