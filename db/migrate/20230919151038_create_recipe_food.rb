class CreateRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_food do |t|
      t.integer :quantity
      t.references :recipe, foreign_key: { to_table: :recipes }
      t.references :food, foreign_key: { to_table: :food }

      t.timestamps
    end
  end
end
