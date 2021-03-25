class AddQuizToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :quiz, null: false, foreign_key: true
  end
end
