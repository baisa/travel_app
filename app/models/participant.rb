class Participant < ActiveRecord::Base
  belongs_to :trip
  has_many :assignments
  has_many :todos, through: :assignments
end
