module Duration

  times = {year: 31536000, month: 2678400, week: 604800, day: 86400, hour: 3600, minute: 60, seconds: 1}

  def process(duration)
    response = ''
    duration = duration
    times.each do |time, value|
      numerator = duration / value
      remainder = duration / value
      response <<  "#{numerator} #{time}s "
    end
    return response
  end

end

Duration.write_values(99030720045, Duration::YEAR,"year")









