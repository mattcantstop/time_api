class PunchTimesController < ApplicationController

  before_filter :get_user

  def get_user
    @user = current_user
  end

  def index
    @time_zone = Time.zone = 'MST'
    @punch_times = @user.punch_times
  end

  def new
    @punch_time = @user.punch_times.new(params[:punch_time])
  end

  def create
    @punch_time = @user.punch_times.new(punch_time_params)
    @punch_time.in = Time.now
    if @punch_time.save
      redirect_to :action => 'show', :id => [@user, @punch_time]
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
  end

  private

  def punch_time_params
    params.require(:punch_time).permit(:in, :out, :user_id, :project_id, :organization_id, :tag)
  end

end
