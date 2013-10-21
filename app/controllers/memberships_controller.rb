class MembershipsController < ApplicationController

  def new
    @membership = @user.memberships.new(params[:membership])
  end

end
