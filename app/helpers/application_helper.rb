module ApplicationHelper
  def url_fixer(url)
    if url.starts_with?("http://")
      url
    else
      "http://#{url}"
    end
  end

  def date_format_fixer(date)
    date.strftime(format="on %m/%d/%Y at %l:%M%P %Z")
  end
end
