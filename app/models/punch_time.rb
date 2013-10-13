class PunchTime < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  belongs_to :organization

  validates_presence_of :in
  before_update :calculate_total_punch_time, :on=>:create

  def complete?
    self.out.present?
  end

  def calculate_total_punch_time
    self.total_punch_time = self.out.to_i - self.in.to_i 
  end

end
