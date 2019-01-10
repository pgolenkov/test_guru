module Admin::QuestionsHelper
  def question_header(question)
    if question.new_record?
      t("form.create_question", title: question.test.title)
    else
      t("form.edit_question", title: question.test.title)
    end
  end
end
