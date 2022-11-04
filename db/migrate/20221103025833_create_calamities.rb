class CreateCalamities < ActiveRecord::Migration[7.0]
  def change
    create_table :calamities do |t|
      t.string :title
      t.string :content
      t.string :address
      t.references :user
      t.timestamps
    end
  end
end
