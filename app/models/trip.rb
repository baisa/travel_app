class Trip < ActiveRecord::Base
  has_many :costs, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many :user_trips
  has_many :users, through: :user_trips
    
end
