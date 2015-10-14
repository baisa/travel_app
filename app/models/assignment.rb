class Assignment < ActiveRecord::Base
  belongs_to :trip
  belongs_to :participant
  belongs_to :todo
end
