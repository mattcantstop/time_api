class ProjectsController < ApplicationController

  before_filter :get_user, :authenticate_user!

  def new
    @project = @user.projects.new(params[:project])
  end

  def create
    @project = @user.projects.new(project_params)
    @projects = @user.projects << @project
    if @project.save(:user_id => @user.id)
      redirect_to user_punch_times_path(@user)
      flash[:notice] = "Project created successfully."
    else
      redirect_to new_user_project(@user)
      # Add actual errors in array
      flash[:error] = "Did not successfully save"
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :user_id)
  end

end
