class RenameUserTestsToTestPassages < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_tests, :test_passages
  end
end
