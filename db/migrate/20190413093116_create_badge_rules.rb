class CreateBadgeRules < ActiveRecord::Migration[5.2]
  def change
    create_table :badge_rules do |t|
      t.references :badge, foreign_key: true
      t.timestamps
    end
  end
end
