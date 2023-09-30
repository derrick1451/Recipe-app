class AddDefaultToCookingTime < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :cooking_time, :integer, default: 0
  end
end
