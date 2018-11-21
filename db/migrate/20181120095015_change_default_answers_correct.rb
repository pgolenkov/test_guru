class ChangeDefaultAnswersCorrect < ActiveRecord::Migration[5.2]
  def change
    change_column_default(:answers, :correct, from: nil, to: false)
  end
end
