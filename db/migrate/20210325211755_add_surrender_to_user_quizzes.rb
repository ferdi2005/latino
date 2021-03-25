class AddSurrenderToUserQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_quizzes, :surrender, :boolean, default: false
  end
end
