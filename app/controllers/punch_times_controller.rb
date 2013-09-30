class PunchTimesController < ApplicationController

  before_filter :get_user

  def get_user
    @user = current_user
  end

  def index
    @punch_time = @user.punch_times.new(params[:punch_time])
    @time_zone = Time.zone = 'MST'
    @punch_times = @user.punch_times.map! { |punch_time| punch_time if !punch_time.id.blank? }
    @punch_time = @user.punch_times.new(params[:punch_time])
    @current_punch = @user.last_punch
    @punch_time.in = Time.now
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
    params.require(:punch_time).permit(:in, :out, :user_id, :project_id, :organization_id, :tag)
  end

end
