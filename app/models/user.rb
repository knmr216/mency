class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  validates :email, uniqueness: true
  with_options presence: true do
    validates :nickname
    validates :name, format: { with: /\A[a-z\d]{1}[a-z\d_]{3,}\z/i }
  end
end
