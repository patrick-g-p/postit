module ApplicationHelper
  def url_fixer(url)
    if url.starts_with?("http://") || url.starts_with?("https://")
      url
    else
      "http://#{url}"
    end
  end

  def date_format_fixer(date)
    if logged_in? && !current_user.time_zone.blank?
      date = date.in_time_zone(current_user.time_zone)
    end

    date.strftime(format="on %m/%d/%Y at %l:%M%P %Z")
  end
end
