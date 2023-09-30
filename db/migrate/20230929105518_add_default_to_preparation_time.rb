class AddDefaultToPreparationTime < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :preparation_time, :integer, default: 0
  end
end
