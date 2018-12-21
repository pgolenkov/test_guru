module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo.classify, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def resource_header(resource)
    if resource.new_record?
      "Create New #{resource.class}"
    else
      "Edit #{resource.class}"
    end
  end

  def flash_messages
    flash.map do |type, msg|
      content_tag :div, msg, class: "flash #{type}"
    end.join(' ').html_safe
  end
end
