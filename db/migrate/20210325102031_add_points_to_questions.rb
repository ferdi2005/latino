class AddPointsToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :questions, :points, :float
  end
end
