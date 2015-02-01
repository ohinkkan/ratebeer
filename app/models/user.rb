class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true,
						length: { minimum: 3, maximum: 15 }
  validates :password, length: { minimum: 4}, format: { with: /.*(?=.*\d)(?=.*[A-Z]).*/ }
  has_many :ratings, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :memberships, dependent: :destroy
  has_secure_password
end