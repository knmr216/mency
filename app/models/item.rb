class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :unit
  belongs_to :brand
  has_many :reviews

  mount_uploader :image, ImageUploader

  with_options presence: true do
    validates :name
    validates :introduction
    validates :image
    with_options numericality: { only_integer: true } do
      validates :capacity
      validates :price
    end
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :unit_id
    end
  end

  def avg_score
    if self.reviews.present?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

end
