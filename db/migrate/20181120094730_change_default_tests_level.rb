class ChangeDefaultTestsLevel < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:tests, :level, from: nil, to: 0)
  end
end
