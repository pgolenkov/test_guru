class AddEndAtToTestPassages < ActiveRecord::Migration[5.2]
  def change
    add_column :test_passages, :end_at, :timestamp
  end
end
