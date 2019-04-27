class ChangeBadgesAndBadgeRulesAttributes < ActiveRecord::Migration[5.2]
  def change
    remove_column :badge_rules, :badge_id
    add_column :badges, :rule_id, :integer, index: true, foreign_key: { to_table: :badge_rules }
    add_column :badge_rules, :name, :string
  end
end
