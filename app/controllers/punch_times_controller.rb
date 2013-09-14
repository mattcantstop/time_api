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
    if @punch_time.save
      redirect_to @punch_time
    else
      render "new"
    end
  end

end
