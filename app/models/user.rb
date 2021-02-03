class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  with_options presence: true do
    validates :nickname
    validates :name, format: { with: /\A[a-zA-Z0-9_]{4,}\z/ }
  end
end
