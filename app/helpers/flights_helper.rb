module FlightsHelper
  def status_badge(status)
    status_class = case status
    when 'On Time' then 'status-on-time'
    when 'Delayed' then 'status-delayed'
    when 'Check-in' then 'status-checkin'
    when 'Security' then 'status-security'
    when 'Gate Open' then 'status-gate-open'
    when 'Boarding' then 'status-boarding'
    when 'Final Call' then 'status-final-call'
    when 'Last Call' then 'status-last-call'
    when 'Departed' then 'status-departed'
    when 'Cancelled' then 'status-cancelled'
    when 'Arrived' then 'status-arrived'
    else 'status-default'
    end
    
    icon = case status
    when 'On Time' then '✔️'
    when 'Delayed' then '⏰'
    when 'Cancelled' then '❌'
    when 'Departed' then '🛫'
    when 'Arrived' then '🛬'
    else ''
    end
    
    content_tag(:span, icon.present? ? "#{icon} #{status}" : status, class: "status-badge #{status_class}")
  end
end
