class User < ActiveRecord::Base
  has_secure_password
  validates_uniqueness_of :email
  has_many :user_trips
  has_many :trips, through: :user_trips
end
