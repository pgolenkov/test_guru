class ChangeTestIdColumnToQuestionIdInAnswers < ActiveRecord::Migration[5.2]
  def change
    rename_column :answers, :test_id, :question_id
  end
end
