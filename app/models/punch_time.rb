class PunchTime < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  belongs_to :organization

  validates_presence_of :in
  before_create :ensure_punches_complete

  def ensure_punches_complete
    total = @user.punch_times.length
    puts "How Many?"
    puts total
    puts ""
    new_total = total.take_while { |punch_time| punch_time.in && punch_time.out != nil }
    puts "How Many Now?"
    puts new_total
    puts ""
    if total == new_total 
      return true
    else
      return false
    end
  end

end
