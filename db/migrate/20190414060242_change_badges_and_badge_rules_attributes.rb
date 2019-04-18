class ChangeBadgesAndBadgeRulesAttributes < ActiveRecord::Migration[5.2]
  def change
    remove_column :badge_rules, :badge_id
    add_column :badges, :badge_rule_id, :integer, index: true, foreign_key: true
    add_column :badge_rules, :name, :string
  end
end
