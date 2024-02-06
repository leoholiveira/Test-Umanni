class User < ApplicationRecord
  enum user_type: {
    client: 0,
    admin: 1
  }

  validates :email, :fullname, :password, :avatar_image, :user_type, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
