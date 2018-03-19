class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.float :tva
      t.text :description
      t.boolean :visible
      t.string :description_typetext
      t.text :description_fulltext

      t.timestamps
    end
  end
end
