class ChangeTestIdColumnToQuestionIdInAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_index :answers, :test_id
    remove_column :answers, :test_id
    add_reference :answers, :question, foreign_key: true 
  end
end
