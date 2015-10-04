class Document < ActiveRecord::Base
  belongs_to :trip
  mount_uploader :file, FileUploader
end
