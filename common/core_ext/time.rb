class Time
  def readable_format
    time_diff = Time.now - self 
    min       = 60
    hour      = min*60
    day       = hour*24
    if time_diff < 10
      "刚刚"
    elsif time_diff >= 10 and time_diff < 60
      "#{time_diff.to_i} 秒前"
    elsif time_diff >= min and time_diff < hour
      "#{(time_diff/min).to_i} 分钟前"
    elsif time_diff >= hour and time_diff < day
      "#{(time_diff/hour).to_i} 小时前"
    elsif time_diff >= day and time_diff < day*7
      "#{(time_diff/day).to_i} 天前"
    else
      self.strftime("%Y-%m-%d")
    end
  end
end
