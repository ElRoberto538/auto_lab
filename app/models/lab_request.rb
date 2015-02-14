class LabRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :shedule
  has_one :lab_type
end
