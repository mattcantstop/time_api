module ApplicationHelper

  def display_user?
    return true if current_user
  end

  def alert_categorization
    
  end

  def show_punch_form?
    if !@user.user_on_the_clock?
      render 'form'
    end
  end

end 
