class AddDefaultValuesForFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :foods, :price, :integer, default: 0
    change_column :foods, :quantity, :integer, default: 0
  end
end
