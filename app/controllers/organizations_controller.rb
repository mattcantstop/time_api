class OrganizationsController < ApplicationController

  before_filter :get_user
  
  def new
    @organization = @user.organizations.new(params[:organization])
  end

  def create
    @organization = @user.organizations.new(organization_params)
    if @organization.save
      redirect_to @organization
      flash[:notice] = "Successfully created organization."
    else
      redirect_to new_user_organization(@user)
      flash[:error] = "Organization did not save successfully."
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  private

  def organization_params
    params.require(:organization).permit(:name, :user_id)
  end

  def get_user
    @user = current_user
  end

end
