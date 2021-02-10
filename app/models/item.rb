class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :unit
  belongs_to :brand

  with_options presence: true do
    validates :name
    validates :capacity
    validates :price
    validates :introduction
  end
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :unit_id
  end

end
