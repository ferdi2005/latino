class AddImageToQuizzes < ActiveRecord::Migration[6.1]
  def change
    add_column :quizzes, :image, :string
  end
end
