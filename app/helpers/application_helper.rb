module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to repo.classify, "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def resource_header(resource)
    if resource.new_record?
      t("form.create_resource", resource: resource.model_name.human)
    else
      t("form.edit_resource", resource: resource.model_name.human)
    end
  end

  def flash_messages
    flash.map do |type, msg|
      content_tag :div, msg, class: "flash #{type}"
    end.join(' ').html_safe
  end

  def boolean_to_human_string(value)
    value ? t("titles.yes_title") : t("titles.no_title")
  end
end
