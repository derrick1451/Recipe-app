class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :food do |t|
      t.string :name
      t.string :measurement_unit
      t.integer :price

      t.timestamps
    end
  end
end
