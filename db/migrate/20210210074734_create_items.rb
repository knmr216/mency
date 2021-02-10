class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :name,         null: false
      t.integer    :category_id,  null: false
      t.integer    :capacity,     null: false
      t.integer    :unit_id,      null: false
      t.integer    :price,        null: false
      t.text       :introduction, null: false
      t.string     :image,        null: false
      t.references :brand,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
