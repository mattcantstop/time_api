module ApplicationHelper

  def display_user?
    return true if current_user
  end

  def show_punch_form
    if @user.all_punches_complete?
      render 'form'
    end
  end

end 
