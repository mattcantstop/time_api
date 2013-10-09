class OrganizationsController < ApplicationController

  def new
    @organization = @user.organization.new(organization_params)
  end

  private

  def organization_params
    params.require(:organization).require(:name, :user_id)
  end


end
