module ApplicationHelper

  def display_user?
    return true if current_user
  end

  def alert_categorization
    
  end

  def in_or_out?
    if @user.user_on_the_clock?
      return render 'form'
    else
      return render 'in'
    end
  end

end 
