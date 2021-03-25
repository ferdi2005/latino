class AddDescriptionToStudies < ActiveRecord::Migration[6.1]
  def change
    add_column :studies, :description, :text
  end
end
