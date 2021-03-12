class CreateStudies < ActiveRecord::Migration[6.1]
  def change
    create_table :studies do |t|
      t.string :title
      t.string :image
      t.string :video

      t.timestamps
    end
  end
end
