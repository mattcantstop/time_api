class UsersOrganizationsController < ApplicationController

  def new
    @users_organization = @users.organizations.new(params[:users_organizations])
  end


end
