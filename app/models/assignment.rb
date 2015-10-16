class Assignment < ActiveRecord::Base
  belongs_to :participant
  belongs_to :todo
end
