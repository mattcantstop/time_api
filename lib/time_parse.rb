class Integer
  def should_calculate?(time_frame)
    if self >= time_frame
      return true
    else 
      return false
    end
  end
end

module Duration

  YEAR = 31536000
  MONTH = 2678400
  WEEK = 604800
  DAY = 86400
  HOUR = 3600
  MINUTE = 60
  SECOND = 1


  def self.calculate(int)
    if int.should_calculate?(YEAR)
      years = int/YEAR if int >= YEAR
      years_remainder = int % YEAR
    end
    if years_remainder
      if years_remainder.should_calculate?(MONTH)
        months = years_remainder / MONTH
        months_remainder = years_remainder % MONTH
      end
    else
      if int.should_calculate?(MONTH)
        months = int / MONTH
        months_remainder = int % MONTH
      end
    end
    if months_remainder
      if months_remainder.should_calculate?(WEEK)
        weeks = months_remainder / WEEK
        weeks_remainder = months_remainder % WEEK
      end
    elsif years_remainder
      if years_remainder.should_calculate?(WEEK)
        weeks = years_remainder / WEEK
        weeks_remainder = years_remainder % WEEK
      end
    else
      if int.should_calculate?(WEEK)
        weeks = int / WEEK
        weeks_remainder = int % WEEK
      end
    end
    if weeks_remainder
      if weeks_remainder.should_calculate?(DAY)
        days = weeks_remainder / DAY
        days_remainder = weeks_remainder % DAY
      end
    elsif months_remainder
      if months_remainder.should_calculate?(DAY)
        days = months_remainder / DAY
        days_remainder = months_remainder % DAY
      end
    elsif years_remainder
      if years_remainder.should_calculate?(DAY)
        days = years_remainder / DAY
        days_remainder = years_remainder % DAY
      end
    else
      if int.should_calculate?(DAY)
        days = int / DAY
        days_remainder = int % DAY
      end
    end
    if days_remainder
      if days_remainder.should_calculate?(HOUR)
        hours = days_remainder / HOUR
        hours_remainder = days_remainder % HOUR
      end
    elsif weeks_remainder
      if weeks_remainder.should_calculate?(HOUR)
        hours = weeks_remainder / HOUR
        hours_remainder = weeks_remainder % HOUR
      end
    elsif months_remainder
      if months_remainder.should_calculate?(HOUR)
        hours = months_remainder / HOUR
        hours_remainder = months_remainder % HOUR
      end
    elsif years_remainder
      if years_remainder.should_calculate?(HOUR)
        hours = years_remainder / HOUR
        hours_remainder = years_remainder % HOUR
      end
    else
      if int.should_calculate?(HOUR)
        hours = int / HOUR
        hours_remainder = int % HOUR
      end
    end
    if hours_remainder
      if hours_remainder.should_calculate?(MINUTE)
        minutes = hours_remainder / MINUTE
        minutes_remainder = hours_remainder % MINUTE
      end
    elsif days_remainder
      if days_remainder.should_calculate?(MINUTE)
        minutes = days_remainder / MINUTE
        minutes_remainder = days_remainder % MINUTE
      end
    elsif weeks_remainder
      if weeks_remainder.should_calculate?(MINUTE)
        minutes = weeks_remainder / MINUTE
        minutes = weeks_remainder % MINUTE
      end
    elsif months_remainder
      if months_remainder.should_calculate?(MINUTE)
        minutes = months_remainder / MINUTE
        minutes_remainder = months_remainder % MINUTE
      end
    elsif years_remainder
      if years_remainder.should_calculate?(MINUTE)
        minutes = years_remainder / MINUTE
        minutes_remainder = years_remainder % MINUTE
      end
    else 
      if int.should_calculate?(MINUTE)
        minutes = int / MINUTE
        minutes_remainder = int % MINUTE
      end
    end
    if minutes_remainder
      if minutes_remainder.should_calculate?(SECOND)
        seconds = minutes_remainder / SECOND
      end
    elsif hours_remainder
      if hours_remainder.should_calculate?(SECOND)
        seconds = hours_remainder / SECOND
      end
    elsif days_remainder
      if days_remainder.should_calculate?(SECOND)
        seconds = days_remainder / SECOND
      end
    elsif weeks_remainder
      if weeks_remainder.should_calculate?(SECOND)
        seconds = weeks_remainder / SECOND
      end
    elsif months_remainder
      if months_remainder.should_calculate?(SECOND)
        seconds = months_remainder / SECOND
      end
    elsif years_remainder
      if years_remainder.should_calculate?(SECOND)
        seconds = years_remainder / SECOND
      end
    else
      if int.should_calculate?(SECOND)
        seconds = int / SECOND
      end
    end
    return "#{years if years} years, #{months if months} months, #{weeks if weeks} weeks, #{days if days} days, #{hours if hours} hours, #{minutes if minutes} minutes, #{seconds if seconds} seconds"
  end

end



puts Duration.calculate(63072000)




























