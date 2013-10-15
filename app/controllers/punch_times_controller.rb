class PunchTimesController < ApplicationController

  before_filter :get_user, :authenticate_user!
  
  def index
    @punch_times = @user.punch_times.limit(20).order("created_at DESC")
  end

  def new
    if @user.all_punches_complete?
      @punch_time = @user.punch_times.new(params[:punch_time])
    else
      flash[:error] = "You are still clocked in."
    end
  end

  def create
    @punch_time = @user.punch_times.new(punch_time_params)
    @punch_time.in = Time.now
    @punch_time.project_id = params[:project][:project_id] if @punch_time.project_id
    @punch_time.organization_id = params[:organization][:organization_id] if @punch_time.organization_id
    if @punch_time.save
      redirect_to user_punch_times_path(@user)
      flash[:notice] = "Successfully clocked in."
    else
      flash[:notice] = "There was an issue."
      render "new"
    end
  end

  def edit
    get_user
    @punch_time = @user.punch_times.find(params[:id])
    if @user.on_the_clock?
      render "_out"
    else
      render "edit"
    end
  end

  def update
    @punch_time = @user.punch_times.find(params[:id])
    @punch_time.out = Time.now
    if @punch_time.update_attributes!(punch_time_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show
    @punch_time = @user.punch_times.find(params[:id])
    @organization = Organization.find(@punch_time.organization_id) if @punch_time.organization_id 
    @project = Project.find(@punch_time.project_id) if @punch_time.project_id
  end

  def out
    @punch_time = @user.punch_times.find(params[:id])
    time_out = Time.now
    if @punch_time.update_attribute(:out, time_out)
      redirect_to user_punch_times_path(@user)
      flash[:notice] = "Successfully punched out."
    else
      redirect_to user_punch_times_path(@user)
    end
  end

  private

  def punch_time_params
    params.require(:punch_time).permit(:in, :out, :description, :user_id, :project_id, :organization_id, :latitude, :longitude)
  end

  def get_user
    @user = current_user
  end

end
