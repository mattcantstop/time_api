module Duration

  YEAR = 31536000
  MONTH = 2678400
  WEEK = 604800
  DAY = 86400
  HOUR = 3600
  MINUTE = 60 


  def self.calculate(int)
    years = int/YEAR
    years_remainder = int%YEAR

  end

  private

  def self.should_keep?
    if self > 0
      return true
    else 
      return false
    end 
  end

end



Duration.calculate(63072000)
