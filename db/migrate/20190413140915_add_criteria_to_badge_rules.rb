class AddCriteriaToBadgeRules < ActiveRecord::Migration[5.2]
  def change
    add_column :badge_rules, :kind, :integer, default: 0
    add_column :badge_rules, :category_id, :integer
    add_column :badge_rules, :test_id, :integer
    add_column :badge_rules, :level, :integer
  end
end
