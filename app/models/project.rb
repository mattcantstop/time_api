class Project < ActiveRecord::Base

  belongs_to :user
  belongs_to :punch_time

end
