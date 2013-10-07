class ProjectsController < ApplicationController

  def new
    @project = @user.project.new(params[:project])
  end

  def create
    @project = @user.project.new(params[:project])
    @project.owner_id = params[:user_id]
    if @project.save
      redirect_to users_punch_times_path(@user)
      flash[:notice] = "Project created successfully."
    else
      redirect_to new_user_project(@user)
      # Add actual errors in array
      flash[:error] = "Did not successfully save"
    end
  end

end
