module PunchTimesHelper

  def belongs_to_org?
    return true ? @user.organizations.any? : false
  end
  
  def belongs_to_project?
    return true ? @user.projects.any? : false
  end


  def month_and_day(punch)
    punch.strftime('%a, %b %d')
  end

  def date_and_time(punch)
    punch.strftime('%b %e, %Y %T')
  end

  def has_location?(punch)
    return true ? !punch.latitude.blank? : false
  end

end
