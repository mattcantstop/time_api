module PunchTimesHelper

  def belongs_to_org?
    if @user.organizations.any?
      return true
    else
      return false
    end
  end

  def month_and_day(punch)
    punch.strftime('%b %d')
  end

end
