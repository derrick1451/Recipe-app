class AddDefaultToquantityForRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_foods, :quantity, :integer, default: 0
  end
end
