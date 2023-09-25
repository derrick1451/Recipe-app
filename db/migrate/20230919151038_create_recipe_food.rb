class CreateRecipeFood < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_food do |t|
      t.integer :quantity
      t.references :recipe, foreign_key: { to_table: :recipes }
      t.references :foods, foreign_key: { to_table: :foods }

      t.timestamps
    end
  end
end
