module ApplicationHelper
  ALERT_CLASSES = { 'notice' => 'success', 'alert' => 'danger' }.freeze

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

  def boolean_to_human_string(value)
    value ? t("titles.yes_title") : t("titles.no_title")
  end

  def role(user)
    user.admin? ? t("titles.admin") : t("titles.guru")
  end

  def alert_class(type)
    ALERT_CLASSES[type]
  end
end
