class Trip < ActiveRecord::Base
  has_many :costs, dependent: :destroy
  has_many :documents, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :todos, dependent: :destroy
    
end
