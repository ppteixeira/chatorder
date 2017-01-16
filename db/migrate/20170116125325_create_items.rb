class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :category
      t.decimal :price , :precision => 8, :scale => 2
      t.string :item_type
      t.text :description
      t.timestamps
    end
  end
end
