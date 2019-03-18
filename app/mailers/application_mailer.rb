class ApplicationMailer < ActionMailer::Base
  default from: 'noreply@testguru.ru'
  layout 'mailer'

  def feedback(user_id, title, body)
    @user = User.find(user_id)
    @title = title
    @body = body
    admins = Admin.all.pluck(:email).join(',')
    mail to: admins, subject: I18n.t('application_mailer.feedback.subject')
  end
end
