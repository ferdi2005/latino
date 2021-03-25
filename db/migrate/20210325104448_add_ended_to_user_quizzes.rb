class AddEndedToUserQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_quizzes, :ended, :bool, default: false
  end
end
