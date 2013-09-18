class PunchTimesController < ApplicationController

  before_filter :get_user

  def get_user
    @user = current_user
  end

  def new
    @punch_time = @user.punch_times.new(params[:punch_time])
  end

  def create
  @punch_time = @user.punch_times.new(params[:punch_time])
  user_on_the_clock?(current_user) ? @punch_time.out = DateTime.now : @punch_time.in = DateTime.now
  if @punch_time.save
    redirect_to @punch_time
  else
    render "new"
  end
  end

end
