require 'Date'

class Date
  def season
    # Not sure if there's a neater expression. yday is out due to leap years
    day_hash = month * 100 + mday
    case day_hash
      when 101..401 then :winter
      when 402..630 then :spring
      when 701..930 then :summer
      when 1001..1231 then :fall
    end
  end

  def dayname
     DAYNAMES[self.wday]
  end
end