module ApplicationHelper
  def nice_time(time)
    time.strftime("%e %B %Y %k:%M")
  end
end
