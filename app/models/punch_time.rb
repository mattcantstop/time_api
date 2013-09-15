class PunchTime < ActiveRecord::Base

  belongs_to :user
  belongs_to :project
  belongs_to :organization

  def punched_in?
    if @user.punch_times.last.in != nil
      return true
    elsif @user.punch_times.last.out != nil
      return false
    else 
      raise "error"
    end 
  end

end
