class Shedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :lab_type
  has_many :lab_requests
end
