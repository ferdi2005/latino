class AddPointsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :points, :float
  end
end
