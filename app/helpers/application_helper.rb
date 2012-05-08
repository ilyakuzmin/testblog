module ApplicationHelper
  def nice_time(time)
    time.strftime("%e %B %Y %k:%M")
  end

  def comment_status(comment)
    case comment.state
      when 'unverified'
        content_tag(:span, 'unverified', :class => 'label')
      when 'declined'
        content_tag(:span, 'declined', :class => 'label label-warning')
      when 'accepted'
        content_tag(:span, 'accepted', :class => 'label label-success')
    end
  end
end
