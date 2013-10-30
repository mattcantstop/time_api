module ApplicationHelper
  module ElapsedTime 

    def self.calculate(duration)
      return "Less than a minute" if duration < 60
      time_measurements = {years: 31536000, months: 2678400, days: 86400, hours: 3600, minutes: 60}
      display_text  = ''
      time_measurements.each do |time_description, time_in_seconds|
        quotient = duration / time_in_seconds if duration >= time_in_seconds 
        duration = duration % time_in_seconds if quotient
        display_text << "#{quotient} #{time_description} " if quotient
      end
      return display_text
    end
  end

  def display_user?
    return true if current_user
  end

  def show_punch_form
    if @user.all_punches_complete?
      render 'form'
    end
  end

  def complete_name(user)
    name = user.first_name + " #{user.last_name}"
  end

  def display_punch_duration(int)
    ElapsedTime.calculate(int)
  end

  def hour_and_minute(punch)
    punch.strftime('%H:%M')
  end

end
