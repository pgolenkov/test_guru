class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, unique: true, null: false
      t.string :image, null: false
      t.timestamps
    end
  end
end
