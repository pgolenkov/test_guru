class AddOwnerToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :owner, foreign_key: { to_table: :users }
  end
end
