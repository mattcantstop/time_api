class PunchTime < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  belongs_to :organization

  validates_presence_of :in

  def complete?
    self.out.present?
  end

end
