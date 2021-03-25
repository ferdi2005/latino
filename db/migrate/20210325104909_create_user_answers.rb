class CreateUserAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :user_answers do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :index_value
      t.string :text_value
      t.boolean :correct
      t.float :points

      t.timestamps
    end
  end
end
