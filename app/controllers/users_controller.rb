class UsersController < ApplicationController
  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:user_id, :first_name, :last_name, :email)
  end

end
