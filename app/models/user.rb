class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews

  mount_uploader :image, ImageUploader

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }, on: :create
  validates :email, uniqueness: true
  with_options presence: true do
    validates :nickname
    validates :username, format: { with: /\A[a-z\d]{1}[a-z\d_]{3,}\z/i }, uniqueness: true
  end
end
