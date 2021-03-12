class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.integer :type
      t.string :options, array: true
      t.integer :correct_options, array: true
      t.string :correct_texts, array: true
      t.text :text
      
      t.timestamps
    end
    add_index :questions, :options, using: 'gin'
    add_index :questions, :correct_options, using: 'gin'
    add_index :questions, :correct_texts, using: 'gin'
  end
end
