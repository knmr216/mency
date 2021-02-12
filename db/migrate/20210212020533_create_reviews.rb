class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer    :star,  null: false
      t.text       :text,  null: false
      t.string     :image
      t.references :user,  null: false, foreign_key: true
      t.references :item,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
