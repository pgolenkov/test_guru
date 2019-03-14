class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title

      t.timestamps
    end
    change_table :tests do |t|
      t.references :category, foreign_key: true
    end
  end
end
