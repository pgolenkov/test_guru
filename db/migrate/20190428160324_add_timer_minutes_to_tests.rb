class AddTimerMinutesToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :timer_minutes, :integer
  end
end
