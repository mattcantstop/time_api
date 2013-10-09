class OrganizationsController < ApplicationController

  before_filter :get_user
  
  def new
    @organization = @user.organizations.new(organization_params)
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :user_id)
  end

  def get_user
    @user = current_user
  end

end
