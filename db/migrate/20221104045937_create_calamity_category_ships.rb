class CreateCalamityCategoryShips < ActiveRecord::Migration[7.0]
  def change
    create_table :calamity_category_ships do |t|
      t.references :calamity
      t.references :category
      t.timestamps
    end
  end
end
