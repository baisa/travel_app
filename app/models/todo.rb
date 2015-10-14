class Todo < ActiveRecord::Base
  belongs_to :trip
  has_many :assignments
  has_many :participants, through: :assignments
end
