module Duration


  def self.calculate(duration)
    times = {years: 31536000, months: 2678400, weeks: 604800, days: 86400, hours: 3600, minutes: 60, seconds: 1}
    response = ''
    duration = duration
    times.each do |time, value|
      numerator = duration / value if duration >= value
      duration = duration % value if numerator
      response << "#{numerator} #{time} "
    end
    puts response
  end

end

Duration.calculate(99030720045)









