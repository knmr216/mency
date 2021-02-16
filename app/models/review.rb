class Review < ApplicationRecord
  belongs_to :item
  belongs_to :user

  with_options presence: true do
    validates :score
    validates :text
  end
end
