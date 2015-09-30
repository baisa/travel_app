class Trip < ActiveRecord::Base
  has_many :costs, dependent: :destroy
  has_many :documents, dependent: :destroy
end
