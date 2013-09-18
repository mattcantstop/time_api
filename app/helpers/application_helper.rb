module ApplicationHelper

  def user_on_the_clock?(user)    
    if user.punch_times.last.in != nil
      return true
    elsif user.punch_times.last.out != nil
      return false
    else 
      return user.inspect
    end 
  end

end
